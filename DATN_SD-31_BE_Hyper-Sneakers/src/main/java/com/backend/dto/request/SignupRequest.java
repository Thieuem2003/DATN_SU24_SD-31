package com.backend.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class SignupRequest {

    private String name;

    private String code;

    private String email;

    private String password;

    private String avata;

    private LocalDate createdAt;

    private LocalDate updatedAt;

    private Integer status;

    private Set<String> quyenHan;

    public Set<String> getRole() {
        return this.quyenHan;
    }

    public void setRole(Set<String> role){
        this.quyenHan = role;
    }
}
