package com.backend.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class EmailRequest {

    private Long id;
    private String subject;
    private Integer mailType;
    private String mailContent;

    public EmailRequest(Integer mailType, String mailContent) {
        this.mailType = mailType;
        this.mailContent = mailContent;
    }
}
