package com.backend.rest;

import com.backend.request.ProductDetailHistoryRequest;
import com.backend.service.ProductDetailHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/productdetailhistory")
public class ProductDetailHistoryRest {
    @Autowired
    ProductDetailHistoryService service;
    @PostMapping
    public ResponseEntity<?> add(@RequestBody ProductDetailHistoryRequest productDetailHistory){
        return ResponseEntity.ok(service.add(productDetailHistory));
    }
    @GetMapping("/{id}")
    public ResponseEntity<?> get(@PathVariable("id") Integer id){
        return ResponseEntity.ok(service.getAllById(id));
    }
    @GetMapping("/get/{id}")
    public ResponseEntity<?> getbyid(@PathVariable("id") Integer id){
        return ResponseEntity.ok(service.getById(id));
    }
}
