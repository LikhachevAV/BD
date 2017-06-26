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
    public void addPerson(String person) {
        if (havePerson(person)) {
            throw new UnsupportedOperationException("Can not add person [" + person + "], " +
                    "because it is already exists!");
        }
        jedis.sadd(BD_KEY, person);
        jedis.hset(person, SCORE, "0");
    }

    public int getPersonScore(String person) {
        String score = jedis.hget(person, SCORE);
        return Integer.valueOf(score);
        //TODO: throw exception, if person not exists
    }

    public void delPerson(String person) {
        jedis.del(BD_KEY, person);
        //TODO: throw exception, if person not exists
    }

    public boolean havePerson(String person) {
        return jedis.sismember(BD_KEY, person);
    }
}
