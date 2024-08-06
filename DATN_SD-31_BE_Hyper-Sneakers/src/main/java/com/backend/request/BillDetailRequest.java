package com.backend.request;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class BillDetailRequest {
    private BigDecimal UnitPrice;
    private Integer IdColor ;
    private Integer IdSize;
    private Integer IdProductDetail;
    private Integer IdBill;
    private Integer Quantity;
}
