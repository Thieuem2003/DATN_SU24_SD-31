package com.backend.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChangeForm {
    @NotBlank(message = "Không được bỏ trống")
    private String PasswordCu;
    @NotBlank(message = "Không được bỏ trống")
    @Size(min = 8,max = 16,message = "Mật khẩu có độ dài từ 8 đến 16 kí tự")
    private String PasswordMoi;
    @NotBlank(message = "Không được bỏ trống")
    @Size(min = 8,max = 16,message = "Mật khẩu có độ dài từ 8 đến 16 kí tự")
    private String RePasswordMoi;
}
