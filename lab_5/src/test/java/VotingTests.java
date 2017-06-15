import org.testng.Assert;
import org.testng.annotations.Test;
import ru.artem.redistest.Voting;

/**
 * Created by tamerlan on 14.06.2017.
 */
public class VotingTests {

 /*   @BeforeTest
    public void deleteAllPersons() {
        new Voting().clearAllPersons();
    }*/

    @Test(expectedExceptions = NullPointerException.class)
    public void canAddAndDeletePerson() {
        Voting voting = new Voting();
        String person = "Ivan Ivanov";
        voting.addPerson(person);
        Assert.assertTrue(voting.getPersonVote(person) == 0);
        voting.deletePerson(person);
        voting.getPersonVote(person);
        voting.deletePerson(person);
    }

    @Test
    public void canIncreaseDecreasePersonTest() {
        Voting voting = new Voting();
        String person1 = "First Person";
        String person2 = "Second person";
        voting.addPerson(person1);
        voting.addPerson(person2);
        voting.increaseVote(person1);
        Assert.assertTrue(voting.getPersonVote(person1) == 1, voting.getPersonVote(person1) + "==1");
        voting.increaseVote(person1);
        Assert.assertTrue(voting.getPersonVote(person1) == 2, voting.getPersonVote(person1) + "==2");
        voting.decreaseVote(person1);
        Assert.assertTrue(voting.getPersonVote(person1) == 1, voting.getPersonVote(person1) + "==1");
        voting.increaseVote(person2);
        Assert.assertTrue(voting.getPersonVote(person2) == 1, voting.getPersonVote(person2) + "==1");
        voting.deletePerson(person1);
        voting.deletePerson(person2);
    }
}
