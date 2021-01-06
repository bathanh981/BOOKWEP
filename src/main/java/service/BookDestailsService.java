/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.BookDestails;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.BookDestailsRepository;

/**
 *
 * @author USER
 */
@Service
public class BookDestailsService {
    @Autowired
   BookDestailsRepository bookDestailsRepository;
   public List<BookDestails> getBookDestailsList(){
       return (List<BookDestails>)bookDestailsRepository.findAll();
   }
   
   public BookDestails  add(BookDestails bookDestails){
       return bookDestailsRepository.save(bookDestails);
   }
}
