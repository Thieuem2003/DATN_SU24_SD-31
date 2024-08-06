package com.backend.repository;

import com.backend.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category,Integer> {
    @Query(value = "Select e from Category e where e.Status = 0 order by e.CreateDate desc ")
    public List<Category> getAll();
    @Query(value = "Select e from Category e where e.Status = 0 and e.Name like :name")
    public List<Category> searchByName(@Param("name") String name);
    @Query(value = "select e from Category e where e.Id = :id")
    public Category getById(@Param("id") Integer Id);
}
