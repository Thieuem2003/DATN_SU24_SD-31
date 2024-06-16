package com.backend.dto.request.account;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
public class AccountAddress {

    private BigInteger idAddress;
    private BigInteger idAccount;
    private BigInteger idRole;
    private String nameAccount;
    private String code;
    private String password;
    private String avatar;
    private String createTime;
    private String updateTime;
    private Integer status;
    private String nameAddress;
    private String phoneNumber;
    private String specificAddress;
    private String ward;
    private Integer district;
    private Integer province;
    private String note;
    private String defaultAddress;

    public void setFormattedDatesCreateTime(Timestamp createTime) {
        this.createTime = formatTimeStamp(createTime);
    }

    public void setFormattedDatesUpdateTime(Timestamp updateTime) {
        this.updateTime = formatTimeStamp(updateTime);
    }

    private String formatTimeStamp(Timestamp timestamp){
        if (timestamp == null){
            return null;
        }

        Date date = new Date(timestamp.getTime());

        String dateFormatPattern = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat dateFormat = new SimpleDateFormat(dateFormatPattern);

        return dateFormat.format(date);

    }


}
