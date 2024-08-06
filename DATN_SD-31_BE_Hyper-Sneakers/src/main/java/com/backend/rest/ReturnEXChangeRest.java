package com.backend.rest;

import com.backend.service.ReturnChangeDetailService;
import com.backend.service.ReturnEXChangeServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/return-ex")
public class ReturnEXChangeRest {

    @Autowired
    ReturnEXChangeServer service;

    @Autowired
    ReturnChangeDetailService detailService;

    @GetMapping("return-ex-receive")
    public ResponseEntity<?> getAllReturnExreceive(){
        System.out.println(service.getAll());
        return ResponseEntity.ok(service.getAll());
    }
    @GetMapping("return-ex-receive-desc")
    public ResponseEntity<?> getAllReturnExreceiveDESC(){
        System.out.println(service.getAllDateDESC());
        return ResponseEntity.ok(service.getAllDateDESC());
    }
    @GetMapping("return-ex-receive-asc")
    public ResponseEntity<?> getAllReturnExreceiveASC(){
        System.out.println(service.getAllDateASC());
        return ResponseEntity.ok(service.getAllDateASC());
    }
    @GetMapping("return-ex/{id}")
    public ResponseEntity<?> getById(@PathVariable(name = "id") Integer id){
        return ResponseEntity.ok(service.getRetunExchangeById(id));
    }

// day cai thang dang bi loi
    @GetMapping("return-ex-detail/{id}")
    public ResponseEntity<?> getDetailById(@PathVariable(name = "id") Integer id){
        return ResponseEntity.ok(detailService.getById(id));
    }


}
