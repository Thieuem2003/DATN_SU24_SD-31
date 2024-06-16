package com.backend.controller;

import com.backend.dto.request.sole.SoleRequest;
import com.backend.dto.request.sole.SoleRequestUpdate;
import com.backend.service.ISoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/sole")
public class SoleController {
    @Autowired
    private ISoleService iSoleService;

    @GetMapping("/getAllSole")
    public ResponseEntity<?> getAllSole() {
        return ResponseEntity.ok(iSoleService.getAll());
    }

    @PostMapping("/addNewSole")
    public ResponseEntity<?> addNewSole(@RequestBody SoleRequest soleRequest){
        return ResponseEntity.ok(iSoleService.addNewSole(soleRequest));
    }

    @PostMapping("/updateSole")
    public ResponseEntity<?> updateSole(@RequestBody SoleRequestUpdate soleRequestUpdate){
        return ResponseEntity.ok(iSoleService.updateSole(soleRequestUpdate));
    }

    @PostMapping("/deleteSole")
    public ResponseEntity<?> deleteSole(@RequestBody SoleRequestUpdate soleRequestUpdate){
        return ResponseEntity.ok(iSoleService.deleteSole(soleRequestUpdate));
    }

    @PostMapping("/activeSole")
    public ResponseEntity<?> activeSole(@RequestBody SoleRequestUpdate soleRequestUpdate){
        return ResponseEntity.ok(iSoleService.activeSole(soleRequestUpdate));
    }
}
