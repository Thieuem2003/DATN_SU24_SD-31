package com.backend.service.impl;

import com.backend.ServiceResult;
import com.backend.config.AppConstant;
import com.backend.dto.request.category.CategoryRequest;
import com.backend.dto.request.category.CategoryRequestUpdate;
import com.backend.dto.response.shoeDetail.CategoryResponse;
import com.backend.entity.Category;
import com.backend.repository.CategoryRepository;
import com.backend.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CategoryServiceImpl implements ICategoryService {

    @Autowired
    private CategoryRepository categoryRepository;


    @Override
    public ServiceResult<List<CategoryResponse>> getAll() {
        List<Category> categoryList = categoryRepository.findAll();
        List<CategoryResponse> categoryResponses = convertToRes(categoryList);
        return new ServiceResult<>(AppConstant.SUCCESS, "Category",categoryResponses);
    }

    @Override
    public ServiceResult<CategoryResponse> addCategory(CategoryRequest categoryRequest) {
        Optional<Category> categoryOptional = categoryRepository.findByNameCategory(categoryRequest.getName());
        if (categoryOptional.isPresent()){
            if (categoryOptional.get().getStatus() == 0){
                Category category = categoryOptional.get();
                category.setStatus(1);
                Category categoryUpdate = categoryRepository.save(category);
                return new ServiceResult(AppConstant.SUCCESS,"Category updated succesfully", categoryUpdate);
            }else {
                return new ServiceResult(AppConstant.FAIL,"Category already exits!", null);
            }
        }else {
            if (categoryRequest.getName() == null || (categoryRequest.getName() != null && categoryRequest.getName().trim().isEmpty())){
                return new ServiceResult<>(AppConstant.BAD_REQUEST,"The name of category not valid!", null);
            }else {
                Category category = new Category();
                Calendar calendar = Calendar.getInstance();
                Date date = calendar.getTime();
                category.setName(categoryRequest.getName());
                category.setStatus(1);
                category.setCreatedAt(date);
                category.setUpdatedAt(date);
                return new ServiceResult(AppConstant.SUCCESS,"Category", categoryRepository.save(category));
            }
        }
    }

    @Override
    public ServiceResult<Category> updateCategory(CategoryRequestUpdate categoryRequestUpdate) {
        Optional<Category> categoryOptional = categoryRepository.findById(categoryRequestUpdate.getId());
        if (categoryOptional.isPresent()){
            if (categoryRequestUpdate.getName() == null || (categoryRequestUpdate.getName() != null && categoryRequestUpdate.getName().trim().isEmpty())){
                return new ServiceResult<>(AppConstant.BAD_REQUEST,"The name of category not valid!", null);
            }else {
                Category categoryExits = categoryOptional.get();
                categoryExits.setId(categoryExits.getId());
                categoryExits.setName(categoryExits.getName());
                categoryExits.setCreatedAt(categoryExits.getCreatedAt());

                Calendar calendar = Calendar.getInstance();
                categoryExits.setUpdatedAt(calendar.getTime());

                categoryExits.setStatus(categoryRequestUpdate.getStatus());
                Category categoryUpdate = categoryRepository.save(categoryExits);
                return new ServiceResult<>(AppConstant.SUCCESS,"The category update succesfully!",categoryUpdate);
            }
        }else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST,"The category not found!", null);
        }
    }

    @Override
    public ServiceResult<Category> deleteCategory(CategoryRequestUpdate categoryRequestUpdate) {
        Optional<Category> categoryOptional = categoryRepository.findById(categoryRequestUpdate.getId());
        if (categoryOptional.isPresent()){
            Category categoryExits = categoryOptional.get();
            categoryExits.setStatus(0);
            categoryRepository.save(categoryExits);
            return new ServiceResult<>(AppConstant.SUCCESS, "The category update succesfully!", null);
        }else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST,"The category not found!", null);
        }
    }

    @Override
    public ServiceResult<Category> activeCategory(CategoryRequestUpdate categoryRequestUpdate) {
        Optional<Category> categoryOptional = categoryRepository.findById(categoryRequestUpdate.getId());
        if (categoryOptional.isPresent()){
            Category categoryExits = categoryOptional.get();
            categoryExits.setStatus(1);
            categoryRepository.save(categoryExits);
            return new ServiceResult<>(AppConstant.SUCCESS, "The category update succesfully!", null);
        }else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST,"The category not found!", null);
        }
    }

    private List<CategoryResponse> convertToRes(List<Category> categoryList){
        return categoryList.stream().map(category ->
                CategoryResponse.builder()
                .id(category.getId())
                .name(category.getName())
                .status(category.getStatus())
                .build()).collect(Collectors.toList());
    }
}
