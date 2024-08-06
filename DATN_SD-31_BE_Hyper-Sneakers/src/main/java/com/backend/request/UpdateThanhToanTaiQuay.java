package com.backend.request;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class UpdateThanhToanTaiQuay {
    private Integer Status;
    private Integer PayStatus;
    private Date PaymentDate;
    private Date DeliveryDate;
}
