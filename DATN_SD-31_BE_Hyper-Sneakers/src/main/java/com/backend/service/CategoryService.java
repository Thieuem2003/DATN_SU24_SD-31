package com.backend.service;

import com.backend.entity.Category;
import com.backend.repository.CategoryRepository;
import com.backend.request.CategoryRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CategoryService {
    @Autowired
    CategoryRepository repository;
    public List<Category> getAll(){
        return repository.getAll();
    }
    public List<Category> getAllbyName(String name){
        return repository.searchByName('%'+name+'%');
    }
    public Category add(CategoryRequest request){
        Category category = new Category();
        category.setDescription(request.getDescription());
        category.setName(request.getName());
        category.setCreateDate(new Date());
        category.setStatus(0);
        return repository.save(category);
    }
    public Category update(Integer Id,CategoryRequest request){
        Category category = repository.getById(Id);
        category.setDescription(request.getDescription());
        category.setName(request.getName());
        category.setUpdateDate(new Date());
        return repository.save(category);
    }
    public Category delete(Integer Id){
        Category category = repository.getById(Id);
        category.setStatus(1);
        return repository.save(category);
    }
    public Category getById(Integer Id){
        Category category = repository.getById(Id);
        return category;
    }
}
