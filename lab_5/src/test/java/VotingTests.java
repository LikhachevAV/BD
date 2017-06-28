import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;
import ru.artem.redistest.helpers.Voting;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by artem.lihachev on 26.06.2017.
 */
public class VotingTests {

    static final String firstPerson = "Ivan";
    static final String secondPerson = "Anna";
    Voting voting = new Voting();

    @BeforeMethod
    public void deleteAllPersons() {
        voting.delAllPersons();
    }

    @Test
    public void canAddPerson() {
        voting.addPerson(firstPerson);
        Assert.assertTrue(voting.getPersonScore(firstPerson) == 0);
    }

    @Test(expectedExceptions = UnsupportedOperationException.class)
    public void canNotAddPersonWhetItIsAlreadyExists() {
        canAddPerson();
        voting.addPerson(firstPerson);
    }

    @Test
    public void canDeletePerson() {
        canAddPerson();
        voting.delPerson(firstPerson);
        Assert.assertFalse(voting.havePerson(firstPerson));
    }

    @Test(expectedExceptions = NullPointerException.class)
    public void canNotDeletePersonWhenItIsNotExists() {
        voting.delPerson(firstPerson);
    }

    @Test(expectedExceptions = NullPointerException.class)
    public void canNotGetScoreWhenPersonNotExists() {
        voting.getPersonScore(firstPerson);
    }

    @Test
    public void canIncrScore() {
        canAddPerson();
        voting.incrScore(firstPerson);
        Assert.assertTrue(voting.getPersonScore(firstPerson) == 1);
    }

    @Test(expectedExceptions = NullPointerException.class)
    public void canNotIncrScoreWhenPersonNotExists() {
        voting.incrScore(firstPerson);
    }

    @Test
    public void canDecrScore() {
        canIncrScore();
        voting.decrScore(firstPerson);
        Assert.assertTrue(voting.getPersonScore(firstPerson) == 0);
    }

    @Test(expectedExceptions = NullPointerException.class)
    public void canNotDecrScoreWhenPersonNotExists() {
        voting.decrScore(firstPerson);
    }

    @Test
    public void canSortPersonsByScore() {
        List<String> persons = new ArrayList<String>();
        persons.add(secondPerson);
        persons.add(firstPerson);
        voting.addPerson(firstPerson);
        voting.addPerson(secondPerson);
        voting.incrScore(secondPerson);
        List<String> sortedByScorePersons = voting.getSortdPersons();
        Assert.assertEquals(persons, sortedByScorePersons);
    }

    @Test(expectedExceptions = NullPointerException.class)
    public void canNotSortEmptyPersonsSet() {
        voting.getSortdPersons();
    }

    @Test
    public void printSortedPersons() {
        canSortPersonsByScore();
        List<String> sortedByScorePersons = voting.getSortdPersons();
        for (String person: sortedByScorePersons) {
            System.out.println("person: " + person + " with score: " + voting.getPersonScore(person));
        }
    }
}
