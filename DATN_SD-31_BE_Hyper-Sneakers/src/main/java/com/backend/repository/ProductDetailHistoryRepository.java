package com.backend.repository;

import com.backend.entity.ProductDetailHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductDetailHistoryRepository extends JpaRepository<ProductDetailHistory,Integer> {
    @Query("select e from ProductDetailHistory e where e.productDetail.Id = :id order by e.UpdateDate desc ")
    public List<ProductDetailHistory> getAllById(@Param("id") Integer id);
    @Query("select e from ProductDetailHistory e where e.Id = :id")
    public ProductDetailHistory getById(@Param("id") Integer id);
}
