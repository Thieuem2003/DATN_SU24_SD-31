package com.backend;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ServiceResultReponse<T> implements Serializable {
    private int status;

    private Long total;

    private T data;

    private String mess;
}
