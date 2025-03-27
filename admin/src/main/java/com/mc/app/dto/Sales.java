package com.mc.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Sales {
    private int salesId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date salesRdate;
    private int salesPrice;
    private String salesGender;
}
