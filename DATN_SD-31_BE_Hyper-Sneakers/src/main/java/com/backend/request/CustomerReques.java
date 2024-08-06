package com.backend.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerReques {
    @NotBlank(message = "Mã không được bỏ trống !")
    @Size(max = 100,message = " Ma  có độ dài nhỏ hơn hoặc bằng 100 kí tự")
    private String code;
    @NotBlank(message = "Ten không được bỏ trống !")
    @Size(max = 100,message = " Ma có độ dài nhỏ hơn hoặc bằng 100 kí tự")
    private String fullname;
    @NotBlank(message = "Tai Khoan không được bỏ trống !")
    private String username;
    @NotBlank(message = "Mat Khau không được bỏ trống !")
    private String password;
    private String image;
    private Boolean gender;
    @NotBlank(message = "So Dien Thoai không được bỏ trống !")
    private String phone;
    @NotBlank(message = "Email không được bỏ trống !")
    private String email;

}
