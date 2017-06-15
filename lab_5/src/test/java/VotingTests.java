import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;
import ru.artem.redistest.Voting;

/**
 * Created by artem.lihachev on 15.06.2017.
 */
public class VotingTests {

    @BeforeMethod
    public void deleteAllBdKeys() {
        new Voting().clearAllPersons();
    }

    @Test
    public void addPerson() {
        Voting voting = new Voting();
        String person = "Igor";
        voting.addPerson(person);
        Assert.assertTrue(voting.getPersonVote(person) == 0);
    }

    @Test
    public void incrVoteTest() {
        Voting voting = new Voting();
        String person = "Igor";
        voting.addPerson(person);
        Assert.assertTrue(voting.getPersonVote(person) == 0);
        voting.incrVote(person);
        Assert.assertTrue(voting.getPersonVote(person) == 1);
    }

    @Test
    public void decrVoteTest() {
        Voting voting = new Voting();
        String person = "Igor";
        voting.addPerson(person);
        Assert.assertTrue(voting.getPersonVote(person) == 0);
        voting.incrVote(person);
        Assert.assertTrue(voting.getPersonVote(person) == 1);
        voting.decrVote(person);
        Assert.assertTrue(voting.getPersonVote(person) == 0);
    }

    @Test(expectedExceptions = NullPointerException.class)
    public void delPersonTest() {
        String person = "Deletable";
        Voting voting = new Voting();
        voting.addPerson(person);
        voting.delPerson(person);
        Assert.assertTrue(voting.getPersonVote(person) == -1);
    }

    @Test
    public void addTwoPersonTest() {
        Voting voting = new Voting();
        String person1 = "first";
        String person2 = "second";
        voting.addPerson(person1);
        Assert.assertTrue(voting.getPersonVote(person1) == 0);
        voting.addPerson(person2);
        Assert.assertTrue(voting.getPersonVote(person2) == 0);
    }
}
