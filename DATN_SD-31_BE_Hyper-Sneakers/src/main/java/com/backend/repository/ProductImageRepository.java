package com.backend.repository;

import com.backend.entity.ProductImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductImage,Integer> {
    @Query(value = "Select e from ProductImage  e where e.product.Id = :id and e.MainImage = true")
    List<ProductImage> getAllByIdSP(@Param("id") Integer id);
    @Query(value = "Select e from ProductImage  e where e.product.Id = :id and e.MainImage = false ")
    List<ProductImage> getAllByIdSP1(@Param("id") Integer id);
}
