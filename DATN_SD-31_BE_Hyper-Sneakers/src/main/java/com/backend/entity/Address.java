package com.backend.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "account_id")
    private Account account;

    @Column(name = "name")
    private String name;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "specific_address")
    private String specificAddress;

    @Column(name = "ward")
    private String ward;

    @Column(name = "district")
    private Integer district;

    @Column(name = "province")
    private Integer province;

    @Column(name = "note")
    private String note;

    @Column(name = "default_address")
    private String defaultAddress;

    @CreationTimestamp
    @Column(name = "created_time")
    private Date createdAt;

    @UpdateTimestamp
    @Column(name = "updated_time")
    private Date updatedAt;

    @Column(name = "status")
    private Integer status;

}
