package ru.artem.redistest.helpers;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.SortingParams;

import java.util.List;

/**
 * Created by artem.lihachev on 23.06.2017.
 */
public class Voting {
    private Jedis jedis = null;
    private static final String BD_KEY = "persons";
    private static final String SCORE = "score";

    public Voting() {
        jedis = new Jedis(ConnectionSettings.host, ConnectionSettings.port);
    }

    public void addPerson(String person) throws UnsupportedOperationException {
        if (havePerson(person)) {
            throw new UnsupportedOperationException("Person [" + person + "] already exists!");
        }
        jedis.sadd(BD_KEY, person);
        jedis.hset(person, SCORE, "0");
    }

    public int getPersonScore(String person) throws NullPointerException {
        if (!havePerson(person)) {
            throw new NullPointerException("Person [" + person + "] not exists");
        }
        String score = jedis.hget(person, SCORE);
        return Integer.valueOf(score);
    }

    public void delPerson(String person) throws NullPointerException {
        if (!havePerson(person)) {
            throw new NullPointerException("Person [" + person + "] not exists");
        }
        jedis.del(BD_KEY, person);
    }

    public boolean havePerson(String person) {
        return jedis.sismember(BD_KEY, person);
    }

    public void delAllPersons() {
        jedis.del(BD_KEY);
    }

    public void incrScore(String person) throws NullPointerException {
        int score = getPersonScore(person);
        ++score;
        jedis.hset(person, SCORE, String.valueOf(score));
    }

    public void decrScore(String person) throws NullPointerException {
        int score = getPersonScore(person);
        --score;
        jedis.hset(person, SCORE, String.valueOf(score));
    }

    public List<String> getSortdPersons() throws NullPointerException {
        if (!havePersons()) {
            throw new NullPointerException("Can not sort empty persons set!");
        }
        return jedis.sort(BD_KEY, new SortingParams().by("by *-> " + SCORE));
    }

    private boolean havePersons() {
        return !jedis.smembers(BD_KEY).isEmpty();
    }
}
