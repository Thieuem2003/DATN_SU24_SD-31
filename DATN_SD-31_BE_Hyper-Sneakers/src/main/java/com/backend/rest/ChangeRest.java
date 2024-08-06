package com.backend.rest;

import com.backend.request.ChangeForm;
import com.backend.service.CustomerService;
import com.backend.service.EmployeeService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/change")
public class ChangeRest {

    @Autowired
    CustomerService service;
    @Autowired
    EmployeeService employeeService;

    @PutMapping("/{id}")
    public ResponseEntity<?> change(@PathVariable("id") Integer id, @Valid @RequestBody ChangeForm form, BindingResult result){
        if (result.hasErrors()){
            List<ObjectError> list = result.getAllErrors();
            return ResponseEntity.badRequest().body(list);
        }
        if (!service.getById(id).getPassword().equals(form.getPasswordCu())){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("err");
        }

        return ResponseEntity.ok(service.change(id,form));
    }
    @PutMapping("/employee/{id}")
    public ResponseEntity<?> employee(@PathVariable("id") Integer id, @Valid @RequestBody ChangeForm form, BindingResult result){
        if (result.hasErrors()){
            List<ObjectError> list = result.getAllErrors();
            return ResponseEntity.badRequest().body(list);
        }
        if (!service.getById(id).getPassword().equals(form.getPasswordCu())){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("err");
        }

        return ResponseEntity.ok(employeeService.change(id,form));
    }
}
