package com.backend.service;

import com.backend.entity.Material;
import com.backend.entity.ProductDetail;
import com.backend.entity.ProductDetail_Material;
import com.backend.repository.ProductDetail_MaterialRepository;
import com.backend.request.ProductDetail_MaterialRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductDetail_MaterialService {
    @Autowired
    ProductDetail_MaterialRepository repository;

    public ProductDetail_Material add(ProductDetail_MaterialRequest request){
        ProductDetail_Material productDetail_material = new ProductDetail_Material();
        productDetail_material.setProductDetail(ProductDetail.builder().Id(request.getIdProductDetail()).build());
        productDetail_material.setMaterial(Material.builder().Id(request.getIdMaterial()).build());
        return repository.save(productDetail_material);
    }
    public void delete(Integer idProductDetail){
        List<ProductDetail_Material> list = repository.getAllById(idProductDetail);
        for(ProductDetail_Material p : list){
            repository.delete(p);
        }
    }
}
