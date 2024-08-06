package com.backend.service;

import com.backend.entity.ReturnExchangeDetail;
import com.backend.repository.ReturnChangeDetailRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReturnChangeDetailService {

    @Autowired
    ReturnChangeDetailRepo repo;


    public List<ReturnExchangeDetail> getById(Integer id){
        return repo.findAll();
    }

}
