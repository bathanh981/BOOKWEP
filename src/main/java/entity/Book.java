/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

/**
 *
 * @author USER
 */
@Entity
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String author;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="categoryId")
    Category category;
    
    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @PrimaryKeyJoinColumn
    private BookDestails bookDestails;

    public Book() {
    }

    public Book(String name, String author, Category category) {
        this.name = name;
        this.author = author;
        this.category = category;
    }

    public Book(String name, String author, Category category, BookDestails bookDestails) {
        this.name = name;
        this.author = author;
        this.category = category;
        this.bookDestails = bookDestails;
    }

    public Book(int id, String name, String author, Category category, BookDestails bookDestails) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.category = category;
        this.bookDestails = bookDestails;
    }

    public Book(String name, String author) {
        this.name = name;
        this.author = author;
    }

    public Book(int id, String name, String author, Category category) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.category = category;
    }

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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public BookDestails getBookDestails() {
        return bookDestails;
    }

    public void setBookDestails(BookDestails bookDestails) {
        this.bookDestails = bookDestails;
    }
}
