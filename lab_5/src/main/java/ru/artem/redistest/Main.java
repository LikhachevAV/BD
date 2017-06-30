package ru.artem.redistest;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

/**
 * Created by tamerlan on 13.06.2017.
 */
public class Main {

    private static final String unknownCommandMessage = "Unknown command! " +
            "To show available command list, please enter \"help\" command!\n";
    private static final String helpMessage = "Voting system command list:\n" +
            "help - show voting system command list" +
            "addPerson <Person> - add new person in voting system;\n" +
            "delPerson <Person> - delete person with name <Person> from voting system\n" +
            "incrScore <Person> - add one score for person with name <Person>\n" +
            "decrScore <Person> - sub one score for person with name <Person>\n" +
            "showPersons - print sorted persons list by score value\n" +
            "exit - exit voting system\n";

    enum Commands {NoCommand, Help, AddPerson, DelPerson, IncrScore, DecrScore, ShowPersons, Exit}

    /*
    Добавить нового участника
    Удалить участника
    Добавить голос
    Отобрать голос
    Получить список всех участников, отсортированных по количеству голосов
    */

    private static Commands getCommand(String input) {
        for (Commands command : Commands.values()) {
            if (input.trim().toLowerCase().startsWith(command.toString().toLowerCase())) {
                return command;
            }
        }
        return Commands.NoCommand;
    }

    private static String getCommandValue(String input, Commands command) {
        return input.trim().toLowerCase().replaceFirst(command.toString().toLowerCase(), "");
    }

    private static String getVotingResults(Voting voting) {
        List<String> persons = voting.getSortdPersons();
        String result = "";
        for (int i = 0; i < persons.size(); i++) {
            String person = persons.get(i);
            result += "person: " + person + " score: " + voting.getPersonScore(person);
            if (i < persons.size() - 1) {
                result += "\n";
            }
        }

        return result;
    }

    public static void main(String[] args) throws IOException {
        Voting voting = new Voting();
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String s = "";
        do {
            System.out.print("Please, enter command: ");
            s = br.readLine();
            switch (getCommand(s)) {
                case Exit:
                    return;
                case NoCommand:
                    System.out.println(unknownCommandMessage);
                    break;
                case Help:
                    System.out.println(helpMessage);
                    break;
                case AddPerson:
                    voting.addPerson(getCommandValue(s, Commands.AddPerson));
                    break;
                case ShowPersons:
                    System.out.println(getVotingResults(voting));
                    break;
                default:
                    System.out.println(unknownCommandMessage);
                    break;
            }
        } while (true);
    }
}