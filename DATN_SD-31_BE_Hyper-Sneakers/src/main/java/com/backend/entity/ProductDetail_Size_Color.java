package com.backend.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "ProductDetail_Color_Size")
public class ProductDetail_Size_Color implements Serializable {
    @jakarta.persistence.Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer Id;
    @ManyToOne
    @JoinColumn(name = "IdProductDetail")
    @JsonBackReference
    private ProductDetail productDetail;
    @ManyToOne
    @JoinColumn(name = "IdSize")
    private Size size;
    @ManyToOne
    @JoinColumn(name = "IdColor")
    private Color color;
    @Column(name = "Quantity")
    private Integer Quantity;

}
