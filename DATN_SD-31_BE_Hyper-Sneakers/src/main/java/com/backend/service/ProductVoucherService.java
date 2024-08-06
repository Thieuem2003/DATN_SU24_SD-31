package com.backend.service;

import com.backend.entity.Product;
import com.backend.entity.Product_Voucher;
import com.backend.entity.Voucher;
import com.backend.repository.ProductVoucherRepository;
import com.backend.request.ProductVoucherRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductVoucherService {
    @Autowired
    private ProductVoucherRepository repository;

    public Product_Voucher add(ProductVoucherRequest request){
        Product_Voucher product_voucher = new Product_Voucher();
        product_voucher.setVoucher(Voucher.builder().Id(request.getIdVoucher()).build());
        product_voucher.setProduct(Product.builder().Id(request.getIdProduct()).build());
        return  repository.save(product_voucher);
    }
    public void delete(Integer id){
        List<Product_Voucher> product_vouchers = repository.getByProduct(id);
        for (Product_Voucher product_voucher: product_vouchers) {
            repository.delete(product_voucher);
        }
    }
    public List<Product_Voucher> getAllByProduct(Integer id){
        return repository.getByProduct(id);
    }
}
