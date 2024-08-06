package com.backend.repository;

import com.backend.entity.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GetVoucherRepo extends JpaRepository<Voucher,Integer> {
    @Query(value = "select e from Voucher e where e.Status = 0")
    List<Voucher> getAll();
}
