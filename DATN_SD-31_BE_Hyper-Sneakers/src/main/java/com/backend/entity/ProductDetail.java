package com.backend.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
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
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "ProductDetail")
public class ProductDetail implements Serializable {
    @jakarta.persistence.Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer Id;
    @Column(name = "CreateDate")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @Temporal(TemporalType.TIMESTAMP)
    private Date CreateDate;
    @Column(name = "UpdateDate")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @Temporal(TemporalType.TIMESTAMP)
    private Date UpdateDate;
    @Column(name = "DiscountDate")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @Temporal(TemporalType.TIMESTAMP)
    private Date DiscountDate;
    @Column(name = "CreateBy")
    private String CreateBy;
    @Column(name = "UpdateBy")
    private String UpdateBy;
    @Column(name = "Status")
    private Integer Status;
    @Column(name = "Weight")
    private Double Weight;
    @Column(name = "Price")
    private BigDecimal Price;
    @Column(name = "Discount")
    private Integer Discount;
    @Column(name = "Description")
    private String Description;
    @ManyToOne
    @JoinColumn(name = "IdProduct")
    private Product product;
    @ManyToOne
    @JoinColumn(name = "IdBrand")
    private Brand brand;
   
    @ManyToOne
    @JoinColumn(name = "IdCategory")
    private Category category;
    
    @ManyToOne
    @JoinColumn(name = "IdSoleType")
    private SoleType soletype;
    
    @OneToMany(mappedBy = "productDetail")
    private Set<ProductFault> productFaults = new HashSet<ProductFault>();
    @OneToMany(mappedBy = "productDetail")
    private Set<ProductDetail_Material> productDetail_materials = new HashSet<ProductDetail_Material>();
    @OneToMany(mappedBy = "productDetail")
    private Set<ProductDetail_Size_Color> productDetail_size_colors = new HashSet<ProductDetail_Size_Color>();
    @OneToMany(mappedBy = "productDetail")
    private Set<ProductDetailHistory> productDetailHistories = new HashSet<ProductDetailHistory>();
    @OneToMany(mappedBy = "productDetail")
    private Set<Rating> ratings = new HashSet<Rating>();
    @JsonIgnore
    @OneToMany(mappedBy = "productDetail")
    private Set<BillDetail> billDetails = new HashSet<BillDetail>();
    @JsonIgnore
    @OneToMany(mappedBy = "productDetail")
    private Set<CartDetail> cartDetails = new HashSet<CartDetail>();

}
