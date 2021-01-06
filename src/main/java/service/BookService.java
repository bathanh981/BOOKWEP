/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.Book;
import entity.BookDestails;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.BookDestailsRepository;
import repository.BookRepository;
import repository.CategoryRepository;

/**
 *
 * @author USER
 */
@Service
public class BookService {
    
    @Autowired
    BookRepository bookRepository;
    @Autowired
    BookDestailsRepository bookDestailsRepository;
    @Autowired
    CategoryRepository categoryRepository;

    public List<Book> getBookList() {
        return (List<Book>) bookRepository.findAll();
    }

    @Transactional(rollbackFor = Exception.class)
    public Book add(Book book) throws Exception {
        if (book.getBookDestails() == null) {
            return bookRepository.save(book);
        } else {
            //new bookDestails de luu
            BookDestails bookDestails = book.getBookDestails();
            //save book not include bookdestails
            book.setBookDestails(null);
            //save book
            book = bookRepository.save(book);
            //set BookDestailsId theo Book
            bookDestails.setId(book.getId());
            //save Book
            bookDestails = bookDestailsRepository.save(bookDestails);
            book.setCategory(categoryRepository.findById(book.getCategory().getId()));
            book.setBookDestails(bookDestails);
            return book;
        }
    }
    public List<Book> searchBookByAuthorLike(String author){
        author="%"+author+"%";
        return bookRepository.findByAuthorLike(author);
    }
    public List<Book> searchBookByNameorAuthor(String name, String author){
        name="%"+name+"%";
        author="%"+author+"%";
        return bookRepository.searchByNameAndAuthor1(name, author);
    }
    public void deleteBook(int id){
        bookRepository.delete(id);
    }
    public Book getBookById(int id){
        return bookRepository.findOne(id);
    }
    public List<Book> findByName(String name){
        name="%"+name+"%";
        return bookRepository.findByNameLike(name);
    }
}
