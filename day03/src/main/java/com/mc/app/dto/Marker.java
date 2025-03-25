package com.mc.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Marker {
    private int markerId;
    private double markerLat;
    private double markerLng;
    private String markerTitle;
    private String markerImg;
    private int markerTarget;
}
