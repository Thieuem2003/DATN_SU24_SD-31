package com.backend.request;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RegisterForm {
    @NotBlank(message = "Tên tài khoản không được bỏ trống !")
    @Size(max = 10, message = "Tên tài khoản nhỏ hơn 10 kí tự")
    private String Username;
    @NotBlank(message = "Tên của bạn không được bỏ trống !")
    @Size(max = 100, message = "Tên của bạn nhỏ hơn 100 kí tự")
    private String Fullname;
    @Email(message = "Email không đúng định dạng !")
    @NotBlank(message = "Email không được bỏ trống !")

    private String Email;
    @NotBlank(message = "Mật khẩu không được bỏ trống !")
    @Size(min = 8,max = 16,message = "Mật khẩu có độ dài từ 8 đến 16 kí tự")
    private String Password;

}
