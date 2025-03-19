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
public class Item {
    private int id;
    private String name;
    private int price;
    private String imgname;
    private Date regdate;
    private Date udate;
}
