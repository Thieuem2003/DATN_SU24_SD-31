package com.backend.rest;

import com.backend.request.AddressKhachLe;
import com.backend.request.AddressRequest;
import com.backend.service.AddressService;
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
@RequestMapping("/api/address")
public class AddressRest {
    @Autowired
    AddressService service;

    @GetMapping("/{id}")
    public ResponseEntity<?> getAddressByCustomer(@PathVariable("id") Integer id){
        return ResponseEntity.ok(service.getAddressByCustomer(id));
    }
    @GetMapping("/getBill/{code}")
    public ResponseEntity<?> getBill(@PathVariable("code") String code){
        return ResponseEntity.ok(service.getAddressByBill(code));
    }
    @GetMapping("/get/{id}")
    public ResponseEntity<?> getAddressById(@PathVariable("id") Integer id){
        return ResponseEntity.ok(service.getAddressById(id));
    }
    @PostMapping()
    public ResponseEntity<?> add(@RequestBody AddressKhachLe addressKhachLe){
        return ResponseEntity.ok(service.add(addressKhachLe));
    }
    @PostMapping("/add")
    public ResponseEntity<?> addAddresss(@RequestBody AddressRequest request){
        return ResponseEntity.ok(service.addAddress(request));
    }
}
