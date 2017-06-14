package ru.artem.redistest;

import redis.clients.jedis.Jedis;

import java.util.List;

/**
 * Created by tamerlan on 14.06.2017.
 */
public class Voting {
    private Jedis jedis = null;

    public Voting() {
        jedis = new Jedis(ConnectionSettings.host, ConnectionSettings.port);

    }

    //Добавить нового участника
    public void addPerson(String person) {
        if (!jedis.get(person).equals(null)) {
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
        return null;
    }
}
