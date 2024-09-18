package com.backend.service;

import com.backend.entity.Brand;
import com.backend.repository.BrandRepository;
import com.backend.request.BrandRequest;
import com.backend.rest.BrandRest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class BrandService {
    @Autowired
    BrandRepository repository;
    public List<Brand> getAll(){
        return repository.getAll();
    }

    public List<Brand> getAllbyName(String name){
        return repository.searchByName('%'+name+'%');
    }
    public Brand add(BrandRequest request){
        Brand brand = new Brand();
        brand.setDescription(request.getDescription());
        brand.setName(request.getName());
        brand.setCreateDate(new Date());
        brand.setStatus(0);
        return repository.save(brand);
    }
    public Brand update(Integer id, BrandRequest request) {
        return repository.findById(id)
                .map(brand -> {
                    brand.setDescription(request.getDescription());
                    brand.setName(request.getName());
                    brand.setUpdateDate(new Date());
                    return repository.save(brand);
                })
                .orElseThrow(() -> new RuntimeException("Brand not found"));
    }
    public Brand delete(Integer id) {
        return repository.findById(id)
                .map(brand -> {
                    brand.setStatus(1);
                    return repository.save(brand);
                })
                .orElseThrow(() -> new RuntimeException("Brand not found"));
    }
    public Brand getById(Integer id) {
        return repository.getBrandById(id)
                .orElseThrow(() -> new RuntimeException("Brand not found"));
    }
    public boolean isBrandExist(String name) {
        List<Brand> brands = repository.searchByName(name);
        return !brands.isEmpty();
    }
}

