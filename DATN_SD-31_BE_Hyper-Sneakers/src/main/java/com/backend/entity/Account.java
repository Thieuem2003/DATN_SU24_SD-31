package com.backend.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Date;

import java.time.LocalDate;
import java.util.List;


@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "account")
@Builder
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    @Column(name = "email")
    private String email;

    @JsonIgnore
    @Column(name = "password")
    private String password;

    @Column(name = "avatar")
    private String avatar;

    @CreationTimestamp
    @Column(name = "created_time")
    private LocalDate createdAt;

    @UpdateTimestamp
    @Column(name = "updated_time")
    private LocalDate updatedAt;

    @Column(name = "status")
    private Integer status;


    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "roleaccount",
            joinColumns = @JoinColumn(name = "account_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<Role> role;


//    public Account(Long id, String name, String code, String email, String password, String avatar, Role role, Collection<? extends GrantedAuthority> authorities) {
//        this.id = id;
//        this.name = name;
//        this.code = code;
//        this.email = email;
//        this.password = password;
//        this.avatar = avatar;
//        this.role = role;
//
//        List<String> roleNames = new ArrayList<>();
//        for (GrantedAuthority authority : authorities) {
//            roleNames.add(authority.getAuthority());
//        }
//
//        if (!roleNames.isEmpty()) {
//            String roleName = roleNames.get(0);
//            this.role = new Role(roleName);
//        }
//    }
//
//    public Account(String name, String password, Collection<? extends GrantedAuthority> authorities) {
//        this.name = name;
//        this.password = password;
//
//        List<String> roleNames = new ArrayList<>();
//        for (GrantedAuthority authority : authorities) {
//            roleNames.add(authority.getAuthority());
//        }
//
//        if (!roleNames.isEmpty()) {
//            String roleName = roleNames.get(0);
//            this.role = new Role(roleName);
//        }
//    }
}
