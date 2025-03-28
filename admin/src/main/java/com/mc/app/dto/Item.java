package com.mc.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Item {
    private int itemId;
    private String itemName;
    private int itemPrice;
    private String itemImgname;
    private Date itemRdate;
    private MultipartFile image;
}
