package com.backend.repository;

import com.backend.entity.SoleType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SoleTypeRepository extends JpaRepository<SoleType,Integer> {
    @Query(value = "Select e from SoleType e where e.Status = 0 order by e.CreateDate desc ")
    public List<SoleType> getAll();
    @Query(value = "Select e from SoleType e where e.Status = 0 and e.Name like :name")
    public List<SoleType> searchByName(@Param("name") String name);
    @Query(value = "select e from SoleType e where e.Id = :id")
    public SoleType getById(@Param("id") Integer Id);
}
