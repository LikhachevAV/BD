import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;
import ru.artem.redistest.Voting2;

/**
 * Created by artem.lihachev on 26.06.2017.
 */
public class Voting2Tests {

    static final String personName = "Ivan";
    Voting2 voting = new Voting2();

    @BeforeMethod
    public void deleteAllPersons() {
        voting.delAllPersons();
    }

    @Test
    public void canAddPerson() {
        voting.addPerson(personName);
        Assert.assertTrue(voting.getPersonScore(personName) == 0);
    }

    @Test(expectedExceptions = UnsupportedOperationException.class)
    public void canNotAddPersonWhetItIsAlreadyExists() {
        canAddPerson();
        voting.addPerson(personName);
    }

    @Test
    public void canDeletePerson() {
        canAddPerson();
        voting.delPerson(personName);
        Assert.assertFalse(voting.havePerson(personName));
    }

    @Test(expectedExceptions = NullPointerException.class)
    public void canNotDeletePersonWhenItIsNotExists() {
        voting.delPerson(personName);
    }

    @Test(expectedExceptions = NullPointerException.class)
    public void canNotGetScoreWhenPersonNotExists() {
        voting.getPersonScore(personName);
    }

    @Test
    public void canIncrScore() {
        canAddPerson();
        voting.incrScore(personName);
        Assert.assertTrue(voting.getPersonScore(personName) == 1);
    }

    @Test(expectedExceptions = NullPointerException.class)
    public void canNotIncrScoreWhenPersonNotExists() {
        voting.incrScore(personName);
    }

    @Test
    public void canDecrScore() {
        canIncrScore();
        voting.decrScore(personName);
        Assert.assertTrue(voting.getPersonScore(personName) == 0);
    }

    @Test(expectedExceptions = NullPointerException.class)
    public void canNotDecrScoreWhenPersonNotExists() {
        voting.decrScore(personName);
    }
}
