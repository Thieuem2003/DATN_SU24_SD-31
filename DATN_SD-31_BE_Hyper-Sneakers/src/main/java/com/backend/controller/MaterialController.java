package com.backend.controller;

import com.backend.dto.request.brand.BrandRequest;
import com.backend.dto.request.brand.BrandRequestUpdate;
import com.backend.dto.request.material.MaterialRequest;
import com.backend.dto.request.material.MaterialRequestUpdate;
import com.backend.service.IBrandService;
import com.backend.service.IMaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/material")
public class MaterialController {
    @Autowired
    private IMaterialService iMaterialService;

    @GetMapping("/getAllMaterial")
    public ResponseEntity<?> getAllMaterial() {
        return ResponseEntity.ok(iMaterialService.getAll());
    }

    @PostMapping("/addNewMaterial")
    public ResponseEntity<?> addNewMaterial(@RequestBody MaterialRequest materialRequest){
        return ResponseEntity.ok(iMaterialService.addNewMaterial(materialRequest));
    }

    @PostMapping("/updateMaterial")
    public ResponseEntity<?> updateMaterial(@RequestBody MaterialRequestUpdate materialRequestUpdate){
        return ResponseEntity.ok(iMaterialService.updateMaterial(materialRequestUpdate));
    }

    @PostMapping("/deleteMaterial")
    public ResponseEntity<?> deleteMaterial(@RequestBody MaterialRequestUpdate materialRequestUpdate){
        return ResponseEntity.ok(iMaterialService.deleteMaterial(materialRequestUpdate));
    }

    @PostMapping("/activeMaterial")
    public ResponseEntity<?> activeMaterial(@RequestBody MaterialRequestUpdate materialRequestUpdate){
        return ResponseEntity.ok(iMaterialService.activeMaterial(materialRequestUpdate));
    }
}
