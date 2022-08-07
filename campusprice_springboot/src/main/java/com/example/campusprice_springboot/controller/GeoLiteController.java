package com.example.campusprice_springboot.controller;

import com.example.campusprice_springboot.util.GeoLiteUtil;
import com.maxmind.geoip2.DatabaseReader;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.IOException;

@RequestMapping(value = "/getLocation")
@RestController
public class GeoLiteController {

    DatabaseReader reader;

    public GeoLiteController() throws IOException {
        String path = System.getProperty("user.dir") + "\\static\\GeoLite2-City_20220805\\GeoLite2-City.mmdb";
        // 创建 GeoLite2 数据库
        File database = new File(path);
        // 读取数据库内容
        reader = new DatabaseReader.Builder(database).build();
    }


    //post方法 + 请求体的参数
    @PostMapping(value = "/getCountry")
    public String getCountry(@RequestParam(value = "ip") String ip) throws Exception {
        return GeoLiteUtil.getCountry(reader,ip);
    }

    @PostMapping(value = "/getProvince")
    public String getProvince(@RequestParam(value = "ip") String ip) throws Exception {
        return GeoLiteUtil.getProvince(reader,ip);
    }

    @PostMapping(value = "/getCity")
    public String getCity(@RequestParam(value = "ip") String ip) throws Exception {
        return GeoLiteUtil.getCity(reader,ip);
    }

    @PostMapping(value = "/getLongitude")
    public double getLongitude(@RequestParam(value = "ip") String ip) throws Exception {
        return GeoLiteUtil.getLongitude(reader,ip);
    }

    @PostMapping(value = "/getLatitude")
    public double getLatitude(@RequestParam(value = "ip") String ip) throws Exception {
        return GeoLiteUtil.getLatitude(reader,ip);
    }
}
