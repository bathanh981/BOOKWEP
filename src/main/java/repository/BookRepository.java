/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import entity.Book;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author USER
 */
@Repository
public interface BookRepository extends CrudRepository<Book,Integer>{
    List<Book> findByAuthorLike(String author);
    @Query("Select b from Book b")
    List<Book> getAllBook();
    @Query("Select b from Book b where name like ?1 or author like ?2")
    List<Book> searchByNameAndAuthor(String name,String author);
    
    //Use SQL
    @Query(value = "Select *from book",nativeQuery = true)
        List<Book> getAllBook2();
        
        
    @Query(value = "Select *from book where name like ?1 or author like ?2",nativeQuery = true)
    List<Book> searchByNameAndAuthor1(String name,String author);
    List<Book> findByNameLike(String name);
}
