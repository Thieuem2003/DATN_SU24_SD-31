package com.backend.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BillHistoryRequest {
    private String CreateBy;
    private String Note;
    private Integer Status;
    private Integer IdBill;
}
