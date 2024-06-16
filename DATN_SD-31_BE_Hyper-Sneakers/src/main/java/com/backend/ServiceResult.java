package com.backend;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class ServiceResult<T> implements Serializable {
    private int status;
    private String message;
    private T data;

=======
import java.io.Serializable;

public class ServiceResult<T> implements Serializable {

    private int status;

    private String message;

    private T data;

    public ServiceResult() {
    }

    public ServiceResult(int status, String message, T data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public ServiceResult(int status, String message) {
        this.status = status;
        this.message = message;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
