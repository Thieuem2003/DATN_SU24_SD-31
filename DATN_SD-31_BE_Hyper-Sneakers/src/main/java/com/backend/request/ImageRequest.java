package com.backend.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ImageRequest {
    private String Url;
    private Boolean MainImage;
    private Integer IdProduct;
}
