package com.backend.dto.request.sole;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SoleRequestUpdate {
    private Long id;

    private String name;

    private Date createdAt;

    private Date updatedAt;

    private Integer status;
}
