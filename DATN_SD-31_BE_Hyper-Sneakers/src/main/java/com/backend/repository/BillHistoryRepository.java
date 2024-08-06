package com.backend.repository;

import com.backend.entity.BillHistory;
import com.backend.response.BillHistoryResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BillHistoryRepository extends JpaRepository<BillHistory,Integer> {
    @Query(value = "Select e.CreateDate, e.CreateBy, e.Note, e.Status from BillHistory e " +
            "join Bill b on b.Id = e.IdOrder where b.Code = :code order by e.CreateDate asc",nativeQuery = true)
    public List<BillHistoryResponse> getAllByBill(@Param("code") String code);
    @Query(value = "select e from BillHistory e where e.bill.Code = :code")
    public List<BillHistory> getAllByBillCode(@Param("code") String code);
}
