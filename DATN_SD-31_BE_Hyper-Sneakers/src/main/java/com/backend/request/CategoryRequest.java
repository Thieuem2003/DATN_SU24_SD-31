package com.backend.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryRequest {
    @Pattern(regexp = "^[\\p{L}]+(?:\\s[\\p{L}]+)*$",message = "Tên không đúng định dạng")
    @Size(max = 100,message = "Tên có độ dài nhỏ hơn hoặc bằng 100 kí tự")
    private String name;
    @Size(max = 255,message = "Mô tả có độ dài nhỏ hơn hoặc bằng 255 kí tự")
    private String description;
}
