package ru.artem.redistest;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.stream.Stream;

/**
 * Created by tamerlan on 13.06.2017.
 */
public class Main {

    enum Commands {AddPerson, DelPerson, IncrScore, DecrScore, PrintSortedPersons}

    ;

    /*
    Добавить нового участника
    Удалить участника
    Добавить голос
    Отобрать голос
    Получить список всех участников, отсортированных по количеству голосов
    */
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String s = "";
        do {
            System.out.print("Enter String: ");
            s = br.readLine();
            System.out.println("You enter: " + s);
        } while (s.length() > 0);
        /*for (Commands command : Commands.values()) {
            System.out.println(command);
        }*/
        //System.out.println(Commands.AddPerson.toString().toLowerCase().equals("addperson"));
    }
}

