package com.backend.repository;

import com.backend.entity.RetunExchange;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReturnExChangeRepository extends JpaRepository<RetunExchange,Integer> {
    @Query(value = "Select e from RetunExchange e where e.Status = 1")
    public List<RetunExchange> getAll();

    @Query(value = "Select e from RetunExchange e order by  e.CreateDate desc ")
    public List<RetunExchange> getRetunExchangeByOrderByCreateDateDesc();

    @Query(value = "Select e from RetunExchange e order by  e.CreateDate asc ")
    public List<RetunExchange> getRetunExchangeByOrderByCreateDateAsc();

    @Query(value = "Select e from RetunExchange e where e.Id = ?1")
    public RetunExchange getRetunExchangeById(Integer id);
}
