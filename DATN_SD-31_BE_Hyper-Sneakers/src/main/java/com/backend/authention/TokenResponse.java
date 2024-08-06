package com.backend.authention;

public class TokenResponse {
    private String token;
    private Integer id;
    private String username;
    private Integer status;

    public TokenResponse(String token, Integer id, String username, Integer status) {
        this.token = token;
        this.id = id;
        this.username = username;
        this.status = status;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
