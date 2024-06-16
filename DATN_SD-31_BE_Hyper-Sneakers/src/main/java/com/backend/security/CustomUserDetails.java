package com.backend.security;

import com.backend.entity.Account;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDate;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@Setter
public class CustomUserDetails implements UserDetails {

    private static final long serialVersionUID = 1L;

    private Long id;
    private String name;
    private String code;
    private String email;
    @JsonIgnore
    private String password;
    private String avatar;
    private LocalDate createdAt;
    private LocalDate updatedAt;
    private Integer status;

    private Collection<? extends GrantedAuthority> authorities;


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.authorities;
    }

    public CustomUserDetails(Long id, String name, String code, String email, String password, String avatar, LocalDate createdAt, LocalDate updatedAt, Integer status, Collection<? extends GrantedAuthority> authorities) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.email = email;
        this.password = password;
        this.avatar = avatar;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.status = status;
        this.authorities = authorities;
    }

    //từ thông tin User chuyển sang thông tin CustomUserDetails
    public static CustomUserDetails mapUserToUserDetail(Account account) {
        // lấy các quyền từ đối tượng USER
        List<GrantedAuthority> listAuthorities = account.getRole().stream()
                .map(quyenHan1 -> new SimpleGrantedAuthority(quyenHan1.getName().name()))
                .collect(Collectors.toList());
        // trả về đối tượng customUserDetails
        return new CustomUserDetails(
                account.getId(),
                account.getName(),
                account.getCode(),
                account.getEmail(),
                account.getPassword(),
                account.getAvatar(),
                account.getCreatedAt(),
                account.getUpdatedAt(),
                account.getStatus(),
                listAuthorities
        );
    }

    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public String getUsername() {
        return this.name;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
