import org.testng.annotations.Test;
import ru.artem.redistest.Voting;

/**
 * Created by artem.lihachev on 15.06.2017.
 */
public class DeleteAllPersonsTest {

    @Test
    public void deleteAllPersonsTest() {
        Voting voting = new Voting();
        voting.clearAllPersons();
        voting.getSortedPersons();
    }
}
