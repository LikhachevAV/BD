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

    @Test
    public void addPersonAndVoteItInCycleTestMethodTest() {
        Voting voting = new Voting();
        String person = "Person with 3 vote";
        addPersonVotes(voting, person, 3);
        Assert.assertTrue(voting.getPersonVote(person) == 3);
    }

    @Test
    public void sortPersonsTest() {
        Voting voting = new Voting();
        String person1 = "Oleg";
        addPersonVotes(voting, person1, 1);
        Assert.assertTrue(voting.getPersonVote(person1) == 1);
        String person2 = "Zoya";
        addPersonVotes(voting, person2, 5);
        Assert.assertTrue(voting.getPersonVote(person2) == 5);
        String person3 = "Andrey";
        addPersonVotes(voting, person3, 7);
        Assert.assertTrue(voting.getPersonVote(person3) == 7);
        System.out.println(voting.getSortedPersons());
    }

    private void addPersonVotes(Voting voting, String person, int voteCount) {
        voting.addPerson(person);
        for (int i = 0; i < voteCount; i++) {
            voting.incrVote(person);
        }
    }
}
