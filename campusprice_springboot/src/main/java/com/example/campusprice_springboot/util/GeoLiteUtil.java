package com.example.campusprice_springboot.util;
import com.maxmind.geoip2.DatabaseReader;
import org.springframework.stereotype.Service;

import java.net.InetAddress;

@Service
public class GeoLiteUtil {

    /**
     *
     * @description: 获得国家
     * @param reader GeoLite2 数据库
     * @param ip ip地址
     */
    public static String getCountry(DatabaseReader reader, String ip) throws Exception {
        return reader.city(InetAddress.getByName(ip)).getCountry().getNames().get("zh-CN");
    }

    /**
     *
     * @description: 获得省份
     * @param reader GeoLite2 数据库
     * @param ip ip地址
     */
    public static String getProvince(DatabaseReader reader, String ip) throws Exception {
        return reader.city(InetAddress.getByName(ip)).getMostSpecificSubdivision().getNames().get("zh-CN");
    }

    /**
     *
     * @description: 获得城市
     * @param reader GeoLite2 数据库
     * @param ip ip地址
     */
    public static String getCity(DatabaseReader reader, String ip) throws Exception {
        return reader.city(InetAddress.getByName(ip)).getCity().getNames().get("zh-CN");
    }

    /**
     *
     * @description: 获得经度
     * @param reader GeoLite2 数据库
     * @param ip ip地址
     */
    public static Double getLongitude(DatabaseReader reader, String ip) throws Exception {
        return reader.city(InetAddress.getByName(ip)).getLocation().getLongitude();
    }

    /**
     *
     * @description: 获得纬度
     * @param reader GeoLite2 数据库
     * @param ip ip地址
     */
    public static Double getLatitude(DatabaseReader reader, String ip) throws Exception {
        return reader.city(InetAddress.getByName(ip)).getLocation().getLatitude();
    }

}
