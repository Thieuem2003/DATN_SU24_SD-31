package com.backend.repository;

import com.backend.entity.Brand;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface BrandRepository extends JpaRepository<Brand, Long> {
    @Query("SELECT b FROM Brand b WHERE b.name = :nameBrand")
    Optional<Brand> findByNameBrand(@Param("nameBrand") String nameBrand);
}
