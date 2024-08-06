package com.backend.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmailRequest {
    private String To;
    private String Subject;
    private String BodyHtml;
}
