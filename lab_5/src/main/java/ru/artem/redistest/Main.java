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
            "add <Person> - add new person in voting system;\n" +
            "del <Person> - delete person with name <Person> from voting system\n" +
            "incr <Person> - add one score for person with name <Person>\n" +
            "decr <Person> - sub one score for person with name <Person>\n" +
            "show - print sorted persons list by score value\n" +
            "exit - exit voting system\n";

    enum Commands {nocommand, help, add, del, incr, decr, show, exit}

    /*
    Добавить нового участника
    Удалить участника
    Добавить голос
    Отобрать голос
    Получить список всех участников, отсортированных по количеству голосов
    */

    private static Commands getCommand(String input) {
        for (Commands command : Commands.values()) {
            if (input.trim().startsWith(command.toString())) {
                return command;
            }
        }
        return Commands.nocommand;
    }

    private static String getCommandValue(String input, Commands command) {
        return input.trim().replaceFirst(command.toString(), "").trim();
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
            try {
                switch (getCommand(s)) {
                    case exit:
                        return;
                    case nocommand:
                        System.out.println(unknownCommandMessage);
                        break;
                    case help:
                        System.out.println(helpMessage);
                        break;
                    case add:
                        voting.addPerson(getCommandValue(s, Commands.add));
                        break;
                    case del:
                        voting.delPerson(getCommandValue(s, Commands.del));
                        break;
                    case show:
                        System.out.println(getVotingResults(voting));
                        break;
                    case incr:
                        voting.incrScore(getCommandValue(s, Commands.incr));
                        break;
                    case decr:
                        voting.decrScore(getCommandValue(s, Commands.decr));
                        break;
                    default:
                        System.out.println(unknownCommandMessage);
                        break;
                }
            } catch (UnsupportedOperationException e) {
                System.out.println(e.getMessage());
            } catch (NullPointerException e) {
                System.out.println(e.getMessage());
            }
        } while (true);
    }
}