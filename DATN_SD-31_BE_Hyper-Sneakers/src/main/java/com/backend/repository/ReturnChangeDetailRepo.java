package com.backend.repository;

import com.backend.entity.ReturnExchangeDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReturnChangeDetailRepo extends JpaRepository<ReturnExchangeDetail,Integer> {
    @Query(value = "select * from ReturnEXChangeDetail", nativeQuery = true)
    public List<ReturnExchangeDetail> findAllByIdReturn(Integer id);


}
