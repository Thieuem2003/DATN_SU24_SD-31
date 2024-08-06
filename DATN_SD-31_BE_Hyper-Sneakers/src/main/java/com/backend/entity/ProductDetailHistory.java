package com.backend.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "ProductDetailHistory")
public class ProductDetailHistory implements Serializable {
    @jakarta.persistence.Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer Id;
    @Column(name = "UpdateDate")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @Temporal(TemporalType.TIMESTAMP)
    private Date UpdateDate;
    @Column(name = "UpdateBy")
    private String UpdateBy;
    @Column(name = "ImageMain")
    private String ImageMain;
    @Column(name = "ImageList")
    private String ImageList;
    @Column(name = "Name")
    private String Name;
    @Column(name = "Weight")
    private Double Weight;
    @Column(name = "Price")
    private BigDecimal Price;
    @Column(name = "Description")
    private String Description;
    @Column(name = "IdCategory")
    private Integer IdCategory;
    @Column(name = "IdSoleType")
    private Integer IdSoleType;
    @Column(name = "IdBrand")
    private Integer IdBrand;
    @Column(name = "IdToe")
    private Integer IdToe;
    @Column(name = "IdSole")
    private Integer IdSole;
    @Column(name = "IdShoelace")
    private  Integer IdShoelace;
    @Column(name = "IdHeelcushion")
    private Integer IdHeelcushion;
    @Column(name = "IdDesign")
    private Integer IdDesign;
    @Column(name = "IdMaterial")
    private String IdMaterial;
    @Column(name = "IdVoucher")
    private String IdVoucher;
    @Column(name = "IdColor_Size_Quantity")
    private String IdColor_Size_Quantity;
    @Column(name = "Discount")
    private Integer Discount;
    @Column(name = "DiscountDate")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @Temporal(TemporalType.TIMESTAMP)
    private Date DiscountDate;
    @Column(name = "SupplierName")
    private String SupplierName;
    @Column(name = "SupplierPhone")
    private String SupplierPhone;
    @Column(name = "SupplierAddress")
    private String SupplierAddress;
    @Column(name = "SupplierAgree")
    private String SupplierAgree;
    @ManyToOne
    @JoinColumn(name = "IdProductDetail")
    @JsonBackReference
    private ProductDetail productDetail;
}
