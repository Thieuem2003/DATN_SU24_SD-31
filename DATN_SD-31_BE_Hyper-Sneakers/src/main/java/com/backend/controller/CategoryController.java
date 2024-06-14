package com.backend.controller;

import com.backend.dto.request.category.CategoryRequest;
import com.backend.dto.request.category.CategoryRequestUpdate;
import com.backend.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/category")
public class CategoryController {
    @Autowired
    private ICategoryService iCategoryService;

    @GetMapping("/getAllCategory")
    public ResponseEntity<?> getCategory() {
        return ResponseEntity.ok(iCategoryService.getAll());
    }

    @PostMapping("/addCategory")
    public ResponseEntity<?> addCategory(@RequestBody CategoryRequest categoryRequest){
        return ResponseEntity.ok(iCategoryService.addCategory(categoryRequest));
    }

    @PostMapping("/updateCategory")
    public ResponseEntity<?> updateCategory(@RequestBody CategoryRequestUpdate categoryRequestUpdate){
        return ResponseEntity.ok(iCategoryService.updateCategory(categoryRequestUpdate));
    }

    @PostMapping("/deleteCategory")
    public ResponseEntity<?> deleteCategory(@RequestBody CategoryRequestUpdate categoryRequestUpdate){
        return ResponseEntity.ok(iCategoryService.deleteCategory(categoryRequestUpdate));
    }

    @PostMapping("/activeCategory")
    public ResponseEntity<?> activeCategory(@RequestBody CategoryRequestUpdate categoryRequestUpdate){
        return ResponseEntity.ok(iCategoryService.activeCategory(categoryRequestUpdate));
    }
}
