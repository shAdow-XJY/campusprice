package com.example.campusprice_springboot.entity.SqlEntity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value = "school")
public class SchoolEntity {
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;
    private String school_id;
    private String school_name;
    private String province_id;
    private String province_name;
    private String city_id;
    private String city_name;
}
