package com.backend.repository;

import com.backend.entity.Color;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ColorRepository extends JpaRepository<Color,Integer> {
    @Query(value = "Select e from Color e where e.Status = 0 order by e.CreateDate desc ")
    public List<Color> getAll();
    @Query(value = "Select e from Color e where e.Status = 0 and e.Name like :name")
    public List<Color> searchByName(@Param("name") String name);
    @Query(value = "select e from Color e where e.Id = :id")
    public Color getById(@Param("id") Integer Id);
    @Query(value = "Select c.Id from Color c\n" +
            "join ProductDetail_Size_Color p on p.color.Id = c.Id \n" +
            "join ProductDetail pd on pd.Id = p.productDetail.Id \n" +
            "where pd.Id = :id \n" +
            "Group by c.Id")
    public List<Integer> getColorByProduct(@Param("id") Integer id);
}
