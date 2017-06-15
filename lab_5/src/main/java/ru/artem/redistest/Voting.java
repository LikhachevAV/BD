package ru.artem.redistest;

import redis.clients.jedis.Jedis;

import java.util.List;

/**
 * Created by tamerlan on 14.06.2017.
 */
public class Voting {
    private Jedis jedis = null;
    private static final String BD_KEY = "persons";

    public Voting() {
        jedis = new Jedis(ConnectionSettings.host, ConnectionSettings.port);

    }

    //Добавить нового участника
    public void addPerson(String person) {
        try {
            if (!jedis.hget(BD_KEY, person).equals(null)) {
                throw new UnsupportedOperationException();
            }

        } catch (NullPointerException e) {
        }
        jedis.hset(BD_KEY, person, "0");
    }

    //Получить список всех участников, отсортированных по количеству голосов
    public List<String> getSortedPersons() {
        //TODO
        return null;
    }

    public void clearAllPersons() {
        jedis.flushDB();
    }

    public Integer getPersonVote(String person) {
        try {
            return Integer.valueOf(jedis.hget(BD_KEY, person));
        } catch (NumberFormatException e) {
            throw new NullPointerException();
        }
    }

    public void incrVote(String person) {
        Integer voteValue = getPersonVote(person);
        if (voteValue.equals(null)) {
            throw new NullPointerException();
        }
        voteValue++;
        jedis.hset(BD_KEY, person, voteValue.toString());
    }

    public void delPerson(String person) {
        jedis.hdel(BD_KEY, person);
    }

    public void decrVote(String person) {
        Integer voteValue = getPersonVote(person);
        if (voteValue.equals(null)) {
            throw new NullPointerException();
        }
        voteValue--;
        jedis.hset(BD_KEY, person, voteValue.toString());
    }
}
