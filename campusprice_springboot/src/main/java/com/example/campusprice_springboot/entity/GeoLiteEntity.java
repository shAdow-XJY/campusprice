package com.example.campusprice_springboot.entity;

import lombok.Data;

@Data
public class GeoLiteEntity {
    private String country;
    private String province;
    private String city;

    public GeoLiteEntity(String country, String province, String city) {
        this.country = country;
        this.province = province;
        this.city = city;
    }
}
