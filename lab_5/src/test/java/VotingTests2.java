import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;
import ru.artem.redistest.Voting;

/**
 * Created by artem.lihachev on 15.06.2017.
 */
public class VotingTests2 {
    @BeforeTest
    public void deleteAllBdKeys() {
        new Voting().clearAllPersons();
    }

    @Test
    public void addPerson() {
        Voting voting = new Voting();
        String person = "Igor";
        voting.hAddPerson(person);
        Assert.assertEquals(voting.hGetPersonVote(person), "0");
    }

    @Test
    public void incrVoteTest() {
        Voting voting = new Voting();
        String person = "Igor";
        voting.hAddPerson(person);
        Assert.assertTrue(voting.hGetPersonVote(person) == 0);
        voting.hIncrVote(person);
        Assert.assertTrue(voting.hGetPersonVote(person) == 1);
    }

    @Test
    public void decrVoteTest() {
        Voting voting = new Voting();
        String person = "Igor";
        voting.hAddPerson(person);
        Assert.assertTrue(voting.hGetPersonVote(person) == 0);
        voting.hIncrVote(person);
        Assert.assertTrue(voting.hGetPersonVote(person) == 1);
        voting.hDecrVote(person);
        Assert.assertTrue(voting.hGetPersonVote(person) == 0);
    }

    @Test(expectedExceptions = NullPointerException.class)
    public void delPersonTest() {
        String person = "Deletable";
        Voting voting = new Voting();
        voting.hAddPerson(person);
        voting.hDelPerson(person);
        Assert.assertTrue(voting.hGetPersonVote(person) == -1);
    }
}
