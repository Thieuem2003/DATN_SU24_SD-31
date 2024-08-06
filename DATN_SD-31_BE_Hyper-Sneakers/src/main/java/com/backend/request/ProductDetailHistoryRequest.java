package com.backend.request;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
public class ProductDetailHistoryRequest {
    private String ImageMain;
    private String ImageList;
    private Date UpdateDate;
    private String UpdateBy;
    private String Name;
    private Double Weight;
    private BigDecimal Price;
    private String Description;
    private Integer IdCategory;
    private Integer IdSoleType;
    private Integer IdBrand;
    private Integer IdToe;
    private Integer IdSole;
    private  Integer IdShoelace;
    private Integer IdHeelcushion;
    private Integer IdDesign;
    private String IdMaterial;
    private String IdColor_Size_Quantity;
    private Integer IdProductDetail;
    private String IdVoucher;
    private Integer Discount;
    private Date DiscountDate;
    private String SupplierName;
    private String SupplierPhone;
    private String SupplierAddress;
    private String SupplierAgree;

}
