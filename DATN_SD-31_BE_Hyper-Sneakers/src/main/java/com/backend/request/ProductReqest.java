package com.backend.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductReqest {
    private String Code;
    private String Name;
    private String Description;
    private String CreateBy;
    private String UpdateBy;
}
