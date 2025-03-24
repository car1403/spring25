package com.mc.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Cart {
    private String custId;
    private int itemId;
    private int itemCnt;
    private String itemName;
    private int itemPrice;
    private String itemImgname;
    private Date itemRdate;
}
