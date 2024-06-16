package com.backend.entity;

import com.backend.util.DateTimeSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Table(name = "my_order")
@Entity
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "voucher_id")
    private VoucherOrder voucherOrder;

    @ManyToOne
    @JoinColumn(name = "account_id")
    private Account account;

    @Column(name = "code")
    private String code;

    @Column(name = "type")
    private String type;

    @Column(name = "customer_name")
    private String customerName;

    @Column(name = "phone_number")
    private String phoneNumber;


    @Column(name = "email")
    private String email;

    @Column(name = "address")
    private String address;

    @Column(name = "ship_fee")
    private BigDecimal shipFee;

    @Column(name = "money_reduce")
    private BigDecimal moneyReduce;

    @Column(name = "total_money")
    private BigDecimal totalMoney;

    @Column(name = "total_revenue")
    private BigDecimal totalRevenue;

    @JsonSerialize(using = DateTimeSerializer.class)
    @Column(name = "create_date")
    private Date createdDate;

    @JsonSerialize(using = DateTimeSerializer.class)
    @Column(name = "pay_date")
    private Date payDate;

    @Column(name = "description")
    private String description;

    @JsonSerialize(using = DateTimeSerializer.class)
    @Column(name = "ship_date")
    private Date shipDate;

    @JsonSerialize(using = DateTimeSerializer.class)
    @Column(name = "desired_date")
    private Date desiredDate;

    @JsonSerialize(using = DateTimeSerializer.class)
    @Column(name = "receive_date")
    private Date receiveDate;

    @Column(name = "created_by")
    private String createdBy;

    @Column(name = "updated_by")
    private String updatedBy;

    @Column(name = "note")
    private String note;

    @Column(name = "status")
    private Integer status;
}
