package com.backend.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
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
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "Voucher")
public class Voucher implements Serializable {
	@jakarta.persistence.Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private Integer Id;
	@Column(name = "CreateDate")
	private Timestamp CreateDate;
	@Column(name = "UpdateDate")
	private Timestamp UpdateDate;
	@Column(name = "CreateBy")
	private String CreateBy;
	@Column(name = "UpdateBy")
	private String UpdateBy;
	@Column(name = "Status")
	private Integer Status;
	@Column(name = "Code")
	private String Code;
	@Column(name = "Name")
	private String Name;
	@Column(name = "TypeVoucher")
	private Boolean TypeVoucher;
	@Column(name = "IsVoucher")
	private Boolean IsVoucher;
	@Column(name = "Discount")
	private Integer Discount;
	@Column(name = "Cash")
	private BigDecimal Cash;
	@Column(name = "Minimum")
	private Integer Minimum;

	@Column(name = "StartDate")
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	@Temporal(TemporalType.DATE)
	private Date StartDate;
	@Column(name = "EndDate")
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	@Temporal(TemporalType.DATE)
	private Date EndDate;
	@JsonIgnore
	@OneToMany(mappedBy = "voucher")
	private Set<Product_Voucher> product_vouchers = new HashSet<Product_Voucher>();
	@JsonIgnore
	@OneToMany(mappedBy = "voucher")
	private Set<Bill> bills = new HashSet<Bill>();
}
