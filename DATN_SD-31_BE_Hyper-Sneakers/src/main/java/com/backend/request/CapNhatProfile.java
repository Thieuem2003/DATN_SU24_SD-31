package com.backend.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CapNhatProfile {
    @Pattern(regexp = "^[A-Za-z]+(?:\\s[A-Za-z]+)*$",message = "Tên không đúng định dạng")
    private String Fullname;
    private String Image;
    @NotBlank(message = "Không được bỏ trống")
    private String Phone;
    @NotBlank(message = "Không được bỏ trống")
    private String Email;
    private Boolean Gender;
}
