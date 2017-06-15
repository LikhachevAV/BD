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
    public void hAddPerson(String person) {
       /* if (!jedis.hget(BD_KEY, person).equals(null)) {
            throw new UnsupportedOperationException();
        }*/
        try {
            if (!jedis.hget(BD_KEY, person).equals(null)) {
                throw new UnsupportedOperationException();
            }

        } catch (NullPointerException e) {
        }
        jedis.hset(BD_KEY, person, "0");
    }

    //Добавить нового участника

    public void addPerson(String person) {
        if (!jedis.get(person).isEmpty()) {
            throw new UnsupportedOperationException();
        }
        jedis.set(person, "0");
    }

    //Удалить участника
    public void deletePerson(String person) {
        if (jedis.del(person) == 0) {
            throw new NullPointerException();
        }
    }

    //Добавить голос
    public void increaseVote(String person) {
        Integer voteValue = getPersonVote(person);
        if (voteValue.equals(null)) {
            throw new NullPointerException();
        }
        voteValue++;
        jedis.set(person, voteValue.toString());
    }

    //Отобрать голос
    public void decreaseVote(String person) {
        Integer voteValue = getPersonVote(person);
        if (voteValue.equals(null)) {
            throw new NullPointerException();
        }
        voteValue--;
        jedis.set(person, voteValue.toString());
    }

    // Получить количество голосов участника
    public Integer getPersonVote(String person) {
        try {
            String result = jedis.get(person);
            return Integer.valueOf(result);
        } catch (NumberFormatException e) {
            throw new NullPointerException();
        }
    }

    //Получить список всех участников, отсортированных по количеству голосов
    public List<String> getSortedPersons() {
        System.out.println(jedis.hgetAll("Andrey"));
        System.out.println(jedis.randomKey());
        return null;
    }

    public void clearAllPersons() {
        jedis.flushDB();
    }

    public void tmp() {
        jedis.hset("persons", "Oleg", "7");
        System.out.println(jedis.hgetAll("persons"));
        //System.out.println(jedis.get("all"));
    }

    public Integer hGetPersonVote(String person) {
        try {
        return Integer.valueOf(jedis.hget(BD_KEY, person));} catch (NumberFormatException e) {
            throw new NullPointerException();
        }
    }

    public void hIncrVote(String person) {
        Integer voteValue = hGetPersonVote(person);
        if (voteValue.equals(null)) {
            throw new NullPointerException();
        }
        voteValue++;
        jedis.hset(BD_KEY, person, voteValue.toString());
    }

    public void hDelPerson(String person) {
        jedis.hdel(BD_KEY, person);
    }

    public void hDecrVote(String person) {
        Integer voteValue = hGetPersonVote(person);
        if (voteValue.equals(null)) {
            throw new NullPointerException();
        }
        voteValue--;
        jedis.hset(BD_KEY, person, voteValue.toString());
    }
}
