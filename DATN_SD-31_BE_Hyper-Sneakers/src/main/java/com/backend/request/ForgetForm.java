package com.backend.request;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ForgetForm {
    @NotBlank(message = "Không được bỏ trống")
    private String Username;
    @NotBlank(message = "Không được bỏ trống")
    private String Email;
}
