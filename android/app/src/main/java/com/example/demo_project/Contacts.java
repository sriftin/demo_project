package com.example.demo_project;

import java.util.ArrayList;

public class Contacts extends MainActivity{
    private String numbers;
    private String firstName;
    private String lastName;
    private String eMail;
    private String id;

    public Contacts(String numbers, String firstName, String lastName, String eMail, String id) {
        this.numbers = numbers;
        this.firstName = firstName;
        this.lastName = lastName;
        this.eMail = eMail;
        this.id = id;
    }
    private ArrayList<Contacts> contacts;

    public Contacts(ArrayList<Contacts> contacts) {
        this.contacts = contacts;
    }

    public String getNumbers() {
        return numbers;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String geteMail() {
        return eMail;
    }

    public String getId() {
        return id;
    }
}
