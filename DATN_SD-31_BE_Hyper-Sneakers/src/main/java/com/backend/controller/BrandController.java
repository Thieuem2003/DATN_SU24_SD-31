package com.backend.controller;

import com.backend.dto.request.brand.BrandRequest;
import com.backend.dto.request.brand.BrandRequestUpdate;
import com.backend.service.IBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/brand")
public class BrandController {

    @Autowired
    private IBrandService iBrandService;

    @GetMapping("/getAllBrand")
    public ResponseEntity<?> getAllBrand() {
        return ResponseEntity.ok(iBrandService.getAll());
    }

    @PostMapping("/addNewBrand")
    public ResponseEntity<?> addNewBrand(@RequestBody BrandRequest brandRequest){
        return ResponseEntity.ok(iBrandService.addNewBrand(brandRequest));
    }

    @PostMapping("/updateBrand")
    public ResponseEntity<?> updateBrand(@RequestBody BrandRequestUpdate brandRequestUpdate){
        return ResponseEntity.ok(iBrandService.updateBrand(brandRequestUpdate));
    }

    @PostMapping("/deleteBrand")
    public ResponseEntity<?> deleteBrand(@RequestBody BrandRequestUpdate brandRequestUpdate){
        return ResponseEntity.ok(iBrandService.deleteBrand(brandRequestUpdate));
    }

    @PostMapping("/activeBrand")
    public ResponseEntity<?> activeBrand(@RequestBody BrandRequestUpdate brandRequestUpdate){
        return ResponseEntity.ok(iBrandService.activeBrand(brandRequestUpdate));
    }

}
