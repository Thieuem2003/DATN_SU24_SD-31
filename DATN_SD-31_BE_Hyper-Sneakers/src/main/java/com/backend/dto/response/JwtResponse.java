package com.backend.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@Builder
public class JwtResponse {

    private String token;

    private String type = "Bearer";

    private Long id;

    private String name;

    private String code;

    private String email;

    private String avata;

    private LocalDate createdAt;

    private LocalDate updatedAt;

    private Integer status;

    private List<String> quyenHan;

    public JwtResponse(String token, String type, Long id, String name, String code, String email, String avata, LocalDate createdAt, LocalDate updatedAt, Integer status, List<String> quyenHan) {
        this.token = token;
        this.type = type;
        this.id = id;
        this.name = name;
        this.code = code;
        this.email = email;
        this.avata = avata;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.status = status;
        this.quyenHan = quyenHan;
    }
}
