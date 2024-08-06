package com.backend.request;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CapNhatProfile {
    @NotBlank(message = "Không được bỏ trống")
    private String Fullname;
    private String Image;
    @NotBlank(message = "Không được bỏ trống")
    private String Phone;
    @NotBlank(message = "Không được bỏ trống")
    private String Email;
    private Boolean Gender;
}
