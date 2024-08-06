package com.backend.rest;

import com.backend.request.CartDetailRequest;
import com.backend.request.CartRequest;
import com.backend.service.CartDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/cart")
public class CartRest {
    @Autowired
    CartDetailService service;
    @GetMapping("/{id}")
    public ResponseEntity<?> getCartByCustomer(@PathVariable("id") Integer id){
    return ResponseEntity.ok(service.getCartByCustomer(id));
    }
    @GetMapping("/getQuantityByCartDetail/{id}")
    public ResponseEntity<?> getQuantityByCartDetail(@PathVariable("id") Integer id){
        return ResponseEntity.ok(service.getQuantityByCartDetail(id));
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteToCart(@PathVariable("id") Integer id){
        service.deleteToCart(id);
        return ResponseEntity.ok("ok");
    }
    @DeleteMapping("/deleteAllCart/{id}")
    public ResponseEntity<?> deleteAllCart(@PathVariable("id") Integer id){
        service.deleteAllCart(id);
        return ResponseEntity.ok("ok");
    }
    @PostMapping
    public ResponseEntity<?> addToCart(@RequestBody CartDetailRequest cartDetail){
        return ResponseEntity.ok(service.addToCart(cartDetail));
    }
    @PutMapping("/updateCart/{id}")
    public ResponseEntity<?> updateToCart(@RequestBody CartDetailRequest cartDetail,@PathVariable("id") Integer id){
        return ResponseEntity.ok(service.updateToCart(cartDetail,id));
    }
    @GetMapping("/getCartByCustomer/{id}")
    public ResponseEntity<?> getCartByIdCustomer(@PathVariable("id") Integer id){
        return ResponseEntity.ok(service.getByIdCustomer(id));
    }
    @PostMapping("/addCart")
    public ResponseEntity<?> addCart(@RequestBody CartRequest request){
        return ResponseEntity.ok(service.addCart(request));
    }


}
