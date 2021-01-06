/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.springframework.format.annotation.DateTimeFormat;
/**
 *
 * @author USER
 */
@Entity
public class BookDestails {
    @Id
  //  @GeneratedValue(strategy = GenerationType.IDENTITY) // Id tu tang
    private int id;
    private String isbn;
    private int numberOfPage;
    private double price;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate puslishedDate;
    
    @OneToOne(mappedBy = "bookDestails")//
    @PrimaryKeyJoinColumn
    private Book book;

    public BookDestails() {
    }

    public BookDestails(int id, String isbn, int numberOfPage, double price, LocalDate puslishedDate, Book book) {
        this.id = id;
        this.isbn = isbn;
        this.numberOfPage = numberOfPage;
        this.price = price;
        this.puslishedDate = puslishedDate;
        this.book = book;
    }

    public BookDestails(int id, String isbn, int numberOfPage, double price, LocalDate puslishedDate) {
        this.id = id;
        this.isbn = isbn;
        this.numberOfPage = numberOfPage;
        this.price = price;
        this.puslishedDate = puslishedDate;
    }

    public BookDestails(String isbn, int numberOfPage, double price, LocalDate puslishedDate, Book book) {
        this.isbn = isbn;
        this.numberOfPage = numberOfPage;
        this.price = price;
        this.puslishedDate = puslishedDate;
        this.book = book;
    }

    public BookDestails(String isbn, int numberOfPage, double price, LocalDate puslishedDate) {
        this.isbn = isbn;
        this.numberOfPage = numberOfPage;
        this.price = price;
        this.puslishedDate = puslishedDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getNumberOfPage() {
        return numberOfPage;
    }

    public void setNumberOfPage(int numberOfPage) {
        this.numberOfPage = numberOfPage;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public LocalDate getPuslishedDate() {
        return puslishedDate;
    }

    public void setPuslishedDate(LocalDate puslishedDate) {
        this.puslishedDate = puslishedDate;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }


}
