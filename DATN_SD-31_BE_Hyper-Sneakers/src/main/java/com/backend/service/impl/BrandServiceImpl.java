package com.backend.service.impl;

import com.backend.ServiceResult;
import com.backend.config.AppConstant;
import com.backend.dto.request.brand.BrandRequest;
import com.backend.dto.request.brand.BrandRequestUpdate;
import com.backend.dto.response.BrandResponse;
import com.backend.entity.Brand;
import com.backend.repository.BrandRepository;
import com.backend.service.IBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class BrandServiceImpl implements IBrandService {

    @Autowired
    private BrandRepository brandRepository;

    @Override
    public ServiceResult<List<BrandResponse>> getAll() {
        List<Brand> brandList = brandRepository.findAll();
        List<BrandResponse> brandResponses = convertToRes(brandList);
        return new ServiceResult<>(AppConstant.SUCCESS, "brandList", brandResponses);
    }

    @Override
    public ServiceResult<Brand> addNewBrand(BrandRequest brandRequest) {
        Optional<Brand> brandOptional = brandRepository.findByNameBrand(brandRequest.getName());
        if (brandOptional.isPresent()) {
            if (brandOptional.get().getStatus() == 0) {
                Brand brand = brandOptional.get();
                brand.setStatus(1);
                Brand brandUpdate = brandRepository.save(brand);
                return new ServiceResult<>(AppConstant.SUCCESS, "Brand created succesfully!", brandUpdate);
            } else {
                return new ServiceResult<>(AppConstant.FAIL, "Category already exits!", null);
            }
        } else {
            if (brandRequest.getName() == null || brandRequest.getName().trim().isEmpty()) {
                return new ServiceResult<>(AppConstant.BAD_REQUEST, "The name of brand not valid!", null);
            } else {
                Brand brand = new Brand();
                Calendar calendar = Calendar.getInstance();
                Date date = calendar.getTime();
                brand.setName(brandRequest.getName());
                brand.setStatus(1);
                brand.setCreatedAt(date);
                brand.setUpdatedAt(date);
                return new ServiceResult<>(AppConstant.SUCCESS, "Brand created succesfully!", brandRepository.save(brand));
            }

        }
    }

    @Override
    public ServiceResult<Brand> updateBrand(BrandRequestUpdate brandRequestUpdate) {
        Optional<Brand> brandOptional = brandRepository.findById(brandRequestUpdate.getId());
        if (brandOptional.isPresent()) {
            if (brandRequestUpdate.getName() == null || (brandRequestUpdate.getName() != null && brandRequestUpdate.getName().trim().isEmpty())) {
                return new ServiceResult<>(AppConstant.BAD_REQUEST, "The name of brand not valid!", null);
            } else {
                Brand brandExits = brandOptional.get();
                brandExits.setId(brandExits.getId());
                brandExits.setName(brandRequestUpdate.getName());
                brandExits.setCreatedAt(brandExits.getCreatedAt());

                Calendar calendar = Calendar.getInstance();
                brandExits.setUpdatedAt(calendar.getTime());

                brandExits.setStatus(brandRequestUpdate.getStatus());
                Brand brandUpdate = brandRepository.save(brandExits);
                return new ServiceResult<>(AppConstant.SUCCESS, "The brand update succesfully!", brandUpdate);
            }

        } else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST, "The brand not found!", null);
        }

    }

    @Override
    public ServiceResult<Brand> deleteBrand(BrandRequestUpdate brandRequestUpdate) {
        Optional<Brand> brandOptional = brandRepository.findById(brandRequestUpdate.getId());
        if (brandOptional.isPresent()) {
            Brand brandExits = brandOptional.get();
            brandExits.setStatus(0);
            brandRepository.save(brandExits);
            return new ServiceResult<>(AppConstant.SUCCESS, "The brand delete succesfully!", null);
        }else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST, "The brand not found!", null);
        }
    }

    @Override
    public ServiceResult<Brand> activeBrand(BrandRequestUpdate brandRequestUpdate) {
        Optional<Brand> brandOptional = brandRepository.findById(brandRequestUpdate.getId());
        if (brandOptional.isPresent()) {
            Brand brandExits = brandOptional.get();
            brandExits.setStatus(1);
            brandRepository.save(brandExits);
            return new ServiceResult<>(AppConstant.SUCCESS, "The brand active succesfully!", null);
        }else {
            return new ServiceResult<>(AppConstant.BAD_REQUEST, "The brand not found!", null);
        }
    }

    private List<BrandResponse> convertToRes(List<Brand> brandList) {
        return brandList.stream().map(brand ->
                BrandResponse.builder()
                        .id(brand.getId())
                        .name(brand.getName())
                        .status(brand.getStatus())
                        .build()).collect(Collectors.toList());
    }
}
