package com.backend.service;

import com.backend.ServiceResult;
import com.backend.dto.request.category.CategoryRequest;
import com.backend.dto.request.category.CategoryRequestUpdate;
import com.backend.dto.response.shoeDetail.CategoryResponse;
import com.backend.entity.Category;

import java.util.List;

public interface ICategoryService {

    ServiceResult<List<CategoryResponse>> getAll();

    ServiceResult<CategoryResponse> addCategory(CategoryRequest categoryRequest);

    ServiceResult<Category> updateCategory(CategoryRequestUpdate categoryRequestUpdate);

    ServiceResult<Category> deleteCategory(CategoryRequestUpdate categoryRequestUpdate);

    ServiceResult<Category> activeCategory(CategoryRequestUpdate categoryRequestUpdate);
}
