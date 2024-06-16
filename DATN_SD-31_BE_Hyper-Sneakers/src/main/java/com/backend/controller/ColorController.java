package com.backend.controller;

import com.backend.dto.request.color.ColorRequest;
import com.backend.dto.request.color.ColorRequestUpdate;
import com.backend.service.IColorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/color")
public class ColorController {

    @Autowired
    private IColorService iColorService;

    @GetMapping("/getAllColor")
    public ResponseEntity<?> getCategory() {
        return ResponseEntity.ok(iColorService.getAll());
    }

    @PostMapping("/addColor")
    public ResponseEntity<?> addCategory(@RequestBody ColorRequest colorRequest){
        return ResponseEntity.ok(iColorService.addColor(colorRequest));
    }

    @PostMapping("/updateColor")
    public ResponseEntity<?> updateColor(@RequestBody ColorRequestUpdate colorRequestUpdate){
        return ResponseEntity.ok(iColorService.updateColor(colorRequestUpdate));
    }

    @PostMapping("/deleteColor")
    public ResponseEntity<?> deleteColor(@RequestBody ColorRequestUpdate colorRequestUpdate){
        return ResponseEntity.ok(iColorService.deleteColor(colorRequestUpdate));
    }

    @PostMapping("/activeColor")
    public ResponseEntity<?> activeColor(@RequestBody ColorRequestUpdate colorRequestUpdate){
        return ResponseEntity.ok(iColorService.activeColor(colorRequestUpdate));
    }

    @GetMapping("/getColorByName/{name}")
    public ResponseEntity<?> getColorByName(@PathVariable String name){
        return ResponseEntity.ok(iColorService.getColorByName(name));
    }
}
