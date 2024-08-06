package com.backend.rest;

import com.backend.request.BillHistoryRequest;
import com.backend.service.BillHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/billhistory")
public class BillHistoryRest {
    @Autowired
    BillHistoryService billHistoryService;
    @PostMapping
    public ResponseEntity<?> add(@RequestBody BillHistoryRequest request){
        return ResponseEntity.ok(billHistoryService.add(request));
    }
    @GetMapping("/{code}")
    public ResponseEntity<?> getallbybill(@PathVariable("code") String code){
        return ResponseEntity.ok(billHistoryService.getAllByBill(code));
    }
    @DeleteMapping("/deletebillhistory/{code}")
    public ResponseEntity<?> deletebillhistory(@PathVariable("code") String code){
        billHistoryService.deleteBillDetailByCode(code);
        return ResponseEntity.ok(HttpStatus.OK);
    }
}
