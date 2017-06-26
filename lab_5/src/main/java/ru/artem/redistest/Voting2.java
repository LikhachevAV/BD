package ru.artem.redistest;

import redis.clients.jedis.Jedis;

/**
 * Created by artem.lihachev on 23.06.2017.
 */
public class Voting2 {
    private Jedis jedis = null;
    private static final String BD_KEY = "persons";
    private static final String SCORE = "score";

    public Voting2() {
        jedis = new Jedis(ConnectionSettings.host, ConnectionSettings.port);
    }

    //Добавить нового участника
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
}
