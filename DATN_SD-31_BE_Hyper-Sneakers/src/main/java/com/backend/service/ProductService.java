package com.backend.service;

import com.backend.entity.Product;
import com.backend.repository.ProductRepository;
import com.backend.request.ProductReqest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.Date;

@Service
public class ProductService {
    @Autowired
    ProductRepository repository;
    public String genCode() {
        // Tạo đối tượng Random
        long timestamp = Instant.now().getEpochSecond();
        String code = "SP" + timestamp;
        return code;
    }
    public Product add(ProductReqest reqest){
        Product product = new Product();
        product.setCode(genCode());
        product.setName(reqest.getName());
        product.setDescription(reqest.getDescription());
        product.setCreateDate(new Date());
        product.setStatus(0);
        return repository.save(product);
    }
    public Product update(Integer id,ProductReqest reqest){
        Product product = repository.getById(id);
        product.setName(reqest.getName());
        product.setDescription(reqest.getDescription());
        product.setUpdateDate(new Date());
        return repository.save(product);
    }
}
