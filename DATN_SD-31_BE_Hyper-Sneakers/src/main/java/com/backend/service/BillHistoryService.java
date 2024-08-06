package com.backend.service;

import com.backend.entity.Bill;
import com.backend.entity.BillHistory;
import com.backend.repository.BillHistoryRepository;
import com.backend.request.BillHistoryRequest;
import com.backend.response.BillHistoryResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class BillHistoryService {
    @Autowired
    private BillHistoryRepository repository;

    public BillHistory add(BillHistoryRequest request){
        BillHistory billHistory = new BillHistory();
        billHistory.setCreateDate(new Date());
        billHistory.setStatus(request.getStatus());
        billHistory.setNote(request.getNote());
        billHistory.setCreateBy(request.getCreateBy());
        billHistory.setBill(Bill.builder().Id(request.getIdBill()).build());
        return repository.save(billHistory);
    }
    public List<BillHistoryResponse> getAllByBill(String code){
        return repository.getAllByBill(code);
    }
    public void deleteBillDetailByCode(String code){
        List<BillHistory> list = repository.getAllByBillCode(code);
        for (BillHistory billHistory: list
        ) {
            repository.delete(billHistory);

        }
    }
}
