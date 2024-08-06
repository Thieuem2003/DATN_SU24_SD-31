package com.backend.request;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
public class VoucherRequest {
    private String Code;
    private String Name;
    private Boolean TypeVoucher;
    private Boolean IsVoucher;
    private Integer Discount;
    private BigDecimal Cash;
    private Date StartDate;
    private Date EndDate;
    private Integer Minimum;

}
