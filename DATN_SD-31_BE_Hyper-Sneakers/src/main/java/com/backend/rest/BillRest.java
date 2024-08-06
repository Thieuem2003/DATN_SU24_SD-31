package com.backend.rest;

import com.backend.request.*;
import com.backend.service.BillDetailService;
import com.backend.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/bill")
public class BillRest {

    @Autowired
    BillService service;

    @Autowired
    BillDetailService billDetailService;
    @PostMapping
    public ResponseEntity<?> addBill(@RequestBody BillRequest request){
        return ResponseEntity.ok(service.add(request));
    }
    @GetMapping("/getbill/{code}")
    public ResponseEntity<?> getBill(@PathVariable("code") String code){
        return ResponseEntity.ok(service.getBillByCode(code));
    }
    @PostMapping("/billTaiQuay")
    public ResponseEntity<?> billTaiQuay(@RequestBody BillTaiQuayRequest request){
        return ResponseEntity.ok(service.addBillTaiQuay(request));
    }
    @GetMapping("/billByCustomer")
    public ResponseEntity<?> billByCustomer(@RequestParam(value = "status",required = false) Integer status , @RequestParam("idCustomer") Integer idCustomer){
        return ResponseEntity.ok(service.getBillByCustomer(status,idCustomer));
    }
    @GetMapping("/billAll")
    public ResponseEntity<?> billAll(){
        return ResponseEntity.ok(service.getAllBill());
    }
    @GetMapping("/billAllFilter")
    public ResponseEntity<?> billAllFilter(@RequestParam(value = "status",required = false) Integer Status,
                                           @RequestParam(value = "payStatus",required = false) Integer payStatus,
                                           @RequestParam(value = "payType",required = false) Integer payType,
                                           @RequestParam(value = "typeStatus",required = false) Integer typeStatus,
                                           @RequestParam(value = "tungay",required = false) String tungay,
                                           @RequestParam(value = "denngay",required = false) String denngay){
        return ResponseEntity.ok(service.getBillFilter(Status,payStatus,payType,typeStatus,tungay,denngay));
    }
    @PostMapping("/addBillDetail")
    public ResponseEntity<?> addToBillDetail(@RequestBody BillDetailRequest billDetailRequest){
        return ResponseEntity.ok(billDetailService.addBillDetail(billDetailRequest));
    }
    @PutMapping("/updateBillDetail/{id}")
    public ResponseEntity<?> updateBillDetail(@PathVariable("id") Integer id,@RequestBody BillDetailRequest billDetailRequest){
        return ResponseEntity.ok(billDetailService.updateBillDetail(id,billDetailRequest));
    }
    @PutMapping("/updateBillTaiQuay/{code}")
    public ResponseEntity<?> updateBillTaiQuay(@PathVariable("code") String code,@RequestBody BillTaiQuayUpdateRequest request){
System.out.println(request);
        return ResponseEntity.ok(service.update(code,request));
    }
    @PutMapping("/updateStatus/{code}")
    public ResponseEntity<?> updateStatus(@PathVariable("code") String code,@RequestBody UpdateThanhToanTaiQuay request){
        service.updateStatus(code,request);
        return ResponseEntity.ok(HttpStatus.OK);
    }
    @PutMapping("/updateStatus1/{code}")
    public ResponseEntity<?> updateStatus1(@PathVariable("code") String code,@RequestBody UpdateThanhToanTaiQuay request){
        return ResponseEntity.ok(service.updateStatus1(code,request));
    }
    @PutMapping("/{code}")
    public ResponseEntity<?> addToBillDetail(@PathVariable("code") String code){
        return ResponseEntity.ok(service.updateStatusPay(code));
    }
    @PutMapping("/updatestatusbill")
    public ResponseEntity<?> updatestatus3(@RequestBody UpdateBillStatus updateBillStatus){
        service.updateStatus(updateBillStatus);
        return ResponseEntity.ok(HttpStatus.OK);
    }
    @PutMapping("/updateDiaChi")
    public ResponseEntity<?> updateDiaChi(@RequestParam("Code") String Code, @RequestParam("IdAddress") Integer IdDiachi){
        service.updateDiaChi(Code,IdDiachi);
        return ResponseEntity.ok(HttpStatus.OK);
    }
    @PutMapping("/updateTongTien")
    public ResponseEntity<?> updateTongTien(@RequestParam("Code") String Code, @RequestParam("Money")BigDecimal money){
        service.updateTongTien(Code,money);
        return ResponseEntity.ok(HttpStatus.OK);
    }
    @GetMapping("/huy/{code}")
    public ResponseEntity<?> huyBill(@PathVariable("code") String code){
        service.huyBill(code);
        return ResponseEntity.ok(HttpStatus.OK);
    }
    @GetMapping("/getbilldetail/{id}")
    public ResponseEntity<?> getbilldetail(@PathVariable("id") Integer id){
        return ResponseEntity.ok(billDetailService.getById(id));
    }
    @GetMapping("/getbycode/{code}")
    public ResponseEntity<?> getbycode(@PathVariable("code") String code){
        return ResponseEntity.ok(service.getByCode(code));
    }
    @GetMapping("/getbystatus/{status}")
    public ResponseEntity<?> getbystatus(@PathVariable("status") Integer status){
        return ResponseEntity.ok(service.getAllByStatus(status));
    }
    @GetMapping("/getallbybill/{code}")
    public ResponseEntity<?> getallbybill(@PathVariable("code") String code){
        return ResponseEntity.ok(billDetailService.getAllbyBill(code));
    }
    @GetMapping("/deleteBillDetail/{id}")
    public ResponseEntity<?> deleteBillDetail(@PathVariable("id") Integer id){
        billDetailService.deleteBillDetail(id);
        return ResponseEntity.ok(HttpStatus.OK);
    }
    @GetMapping("/getallbyproduct/{id}")
    public ResponseEntity<?> getallbyproduct(@PathVariable("id") Integer id){
        return ResponseEntity.ok(billDetailService.getAllByIdProduct(id));
    }
    @GetMapping("/getall")
    public ResponseEntity<?> getall(){
        return ResponseEntity.ok(service.getAll());
    }
    @GetMapping("/gettkngay")
    public ResponseEntity<?> gettkngay(){
        return ResponseEntity.ok(service.getTKNgay());
    }
    
    @GetMapping("/gettktuan")
    public ResponseEntity<?> gettktuan(){
        return ResponseEntity.ok(service.getTKTuan());
    }
    
    @GetMapping("/gettkthang")
    public ResponseEntity<?> gettkthang(){
        return ResponseEntity.ok(service.getTKThang());
    }
    
    @GetMapping("/gettknam")
    public ResponseEntity<?> gettknam(){
        return ResponseEntity.ok(service.getTKNam());
    }
    @GetMapping("/gettkslthang")
    public ResponseEntity<?> gettkslthang(){
        return ResponseEntity.ok(service.getTKSLThang());
    }
    @GetMapping("/gettksanpham")
    public ResponseEntity<?> gettksanpham(){
        return ResponseEntity.ok(billDetailService.getTKSanPham());
    }
    @GetMapping("/gettkkhoangngay")
    public ResponseEntity<?> gettksoluonghd(@RequestParam("tungay")String tungay,
                                            @RequestParam("denngay") String denngay){
        return ResponseEntity.ok(service.getTKSoLuongHD(tungay,denngay));
    }
    @GetMapping("/gettksoluongsp")
    public ResponseEntity<?> gettksoluongsp(@RequestParam("tungay")String tungay,
                                            @RequestParam("denngay") String denngay){
        return ResponseEntity.ok(service.getTKSoLuongSanPham(tungay,denngay));
    }

    @DeleteMapping("/deletebill/{code}")
    public ResponseEntity<?> deletebill(@PathVariable("code") String code){
        service.deleteBill(code);
         return ResponseEntity.ok(HttpStatus.OK);
    }
    @DeleteMapping("/deletebilldetail/{code}")
    public ResponseEntity<?> deletebilldetail(@PathVariable("code") String code){
        billDetailService.deleteBillDetailByCode(code);
        return ResponseEntity.ok(HttpStatus.OK);
    }




}
