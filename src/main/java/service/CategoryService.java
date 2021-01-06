/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.Category;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.CategoryRepository;

/**
 *
 * @author USER
 */
@Service
public class CategoryService {
    @Autowired 
    private CategoryRepository categoryRepository;

    public List<Category> getCategoryList() {
      return (List<Category>) categoryRepository.findAll();
    }
    public Category add(Category category){
        return categoryRepository.save(category);
    }
    public Category getCategoryFindById(int id){
        return categoryRepository.findById(id);
    }
}
