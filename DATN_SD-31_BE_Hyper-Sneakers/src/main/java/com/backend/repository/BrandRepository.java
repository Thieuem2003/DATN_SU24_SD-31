package com.backend.repository;

import com.backend.entity.Brand;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BrandRepository extends JpaRepository<Brand,Integer> {
    @Query(value = "Select e from Brand e where e.Status = 0 order by e.CreateDate desc ")
    public List<Brand> getAll();
    @Query(value = "Select e from Brand e where e.Status = 0 and e.Name like :name")
    public List<Brand> searchByName(@Param("name") String name);
    @Query("SELECT e FROM Brand e WHERE e.Id = :id")
    Optional<Brand> getBrandById(@Param("id") Integer id);
}

