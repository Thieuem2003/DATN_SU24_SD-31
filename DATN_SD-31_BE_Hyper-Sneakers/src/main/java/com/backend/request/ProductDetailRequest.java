package com.backend.request;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
public class ProductDetailRequest {
    private Double Weight;
    private BigDecimal Price;
    private Integer Discount;
    private String Description;
    private String CreateBy;
    private String UpdateBy;
    private Integer IdProduct;
    private Integer IdBrand;
    private Integer IdToe;
    private Integer IdCategory;
    private Integer IdSoleType;
    private Integer IdSole;
    private Integer IdHeelcushion;
    private Integer IdDesign;
    private Integer IdShoelace;
    private Date DiscountDate;
    private Integer status;
}
