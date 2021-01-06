/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Book;
import entity.Category;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;
import service.BookDestailsService;
import service.BookService;
import service.CategoryService;

/**
 *
 * @author USER
 */
@Controller
public class BookController {
    @Autowired
    BookService bookService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    BookDestailsService bookDestailsService;    
    
    @RequestMapping(value = "/listBook")
    public String listBook(Model model){
        List<Book> listBook=(List<Book>)bookService.getBookList();
        model.addAttribute("listBook",listBook);
       return "/listBook";
    }
    
    @RequestMapping(value = "/newBook")
    public String addBook(Model model){
        model.addAttribute("book", new Book());
        List<Category> listCategory= categoryService.getCategoryList();
        model.addAttribute("listCategory",listCategory);
        model.addAttribute("msg","New Book");
        model.addAttribute("submit","New Book");
        return "/newBook";
    }
    
    @RequestMapping(value = "/save")
    public String saveBook(Book book,Model model ) throws Exception{
        
        bookService.add(book);
        
        return listBook(model);
    }
    @RequestMapping(value = "/delete")
    public String deleteBook(@RequestParam(name="id") int id,Model model){
        bookService.deleteBook(id);
        return listBook(model);
    }
    @RequestMapping(value = "/edit",method = GET)
    public String edit(@RequestParam(name="id") int id,Model model){
        Book book=bookService.getBookById(id);
        model.addAttribute("book",book);
        
        List<Category> listCategory= categoryService.getCategoryList();
        model.addAttribute("listCategory",listCategory);
        
        model.addAttribute("msg","Edit Book");
        model.addAttribute("submit","Update");
        return "/newBook";
    }
    @RequestMapping(value = "/search")
    public String searchNameBook(@RequestParam(name="value") String value,Model model){
        List<Book> listBook=bookService.findByName(value);
        model.addAttribute("listBook",listBook);
        return "/listBook";
    }
    @RequestMapping(value = "/login")
    public String login(Model model){
        return "/loginfb";
    }
    @RequestMapping(value = "/login_success")
    public String loginsuccess(Model model){
        return "/loginsuccess";
    }
    @RequestMapping(value = "/token")
    public String token(Model model,@RequestParam(name="value") String token){
        
        System.out.println("thanh "+ token);
        return "/loginfb";
    }

    @RequestMapping(value = "/post")
    public String post(Model model){
      
        return "/post_fb";
    }

}
