package com.backend.service;

import com.backend.ServiceResult;
import com.backend.dto.request.brand.BrandRequest;
import com.backend.dto.request.brand.BrandRequestUpdate;
import com.backend.dto.response.BrandResponse;
import com.backend.entity.Brand;

import java.util.List;

public interface IBrandService {

    ServiceResult<List<BrandResponse>> getAll();

    ServiceResult<Brand> addNewBrand(BrandRequest brandRequest);

    ServiceResult<Brand> updateBrand(BrandRequestUpdate brandRequestUpdate);

    ServiceResult<Brand> deleteBrand(BrandRequestUpdate brandRequestUpdate);

    ServiceResult<Brand> activeBrand(BrandRequestUpdate brandRequestUpdate);

}
