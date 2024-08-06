package com.backend.request;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
public class BillTaiQuayUpdateRequest {
    private BigDecimal TotalPrice;
    private BigDecimal ShipPrice;
    private BigDecimal TotalPriceLast;
    private String Note;
    private Integer PayType;
    private Integer PayStatus;
    private Integer IdCoupon;
    private Integer IdAddress;
    private Integer IdVoucher;
    private Integer Status;
    private Date PaymentDate;
    private Date DelyveryDate;
    private Integer IdCustomer;
    private Integer TypeStatus;
}
