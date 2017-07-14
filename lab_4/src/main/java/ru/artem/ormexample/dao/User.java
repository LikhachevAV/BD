package ru.artem.ormexample.dao;

import javax.persistence.Id;

/**
 * Created by artem.lihachev on 14.07.2017.
 */
public class User {

    private int id;
    private String name;
    private String password;

    @Id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
