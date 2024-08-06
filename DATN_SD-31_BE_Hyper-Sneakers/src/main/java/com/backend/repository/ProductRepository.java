package com.backend.repository;

import com.backend.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product,Integer> {

    @Query("Select e from Product  e where e.Id = :id")
    public Product getById(@Param("id") Integer id);
}
