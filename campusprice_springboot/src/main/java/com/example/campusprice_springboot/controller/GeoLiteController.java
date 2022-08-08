package com.example.campusprice_springboot.controller;

import com.example.campusprice_springboot.entity.GeoLiteEntity;
import com.example.campusprice_springboot.entity.Response.R;
import com.example.campusprice_springboot.util.GeoLiteUtil;
import com.maxmind.geoip2.DatabaseReader;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.IOException;

@RequestMapping(value = "/Location")
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
    public R getCountry(@RequestParam(value = "ip") String ip) throws Exception {
        return R.ok().data("country",GeoLiteUtil.getCountry(reader,ip));
    }

    @PostMapping(value = "/getProvince")
    public R getProvince(@RequestParam(value = "ip") String ip) throws Exception {
        return R.ok().data("province",GeoLiteUtil.getProvince(reader,ip));
    }

    @PostMapping(value = "/getCity")
    public R getCity(@RequestParam(value = "ip") String ip) throws Exception {
        return R.ok().data("city",GeoLiteUtil.getCity(reader,ip));
    }

    @PostMapping(value = "/getLongitude")
    public R getLongitude(@RequestParam(value = "ip") String ip) throws Exception {
        return R.ok().data("longitude",GeoLiteUtil.getLongitude(reader,ip));
    }

    @PostMapping(value = "/getLatitude")
    public R getLatitude(@RequestParam(value = "ip") String ip) throws Exception {
        return R.ok().data("latitude",GeoLiteUtil.getLatitude(reader,ip));
    }

    @PostMapping(value = "/getCountryProvinceCity")
    public R getCountryProvinceCity(@RequestParam(value = "ip") String ip) throws Exception {
        System.out.println(ip);
        String country = GeoLiteUtil.getCountry(reader,ip);
        String province = GeoLiteUtil.getProvince(reader,ip);
        String city = GeoLiteUtil.getCity(reader,ip);
        return R.ok().data("location",new GeoLiteEntity(country,province,city));
    }
}
