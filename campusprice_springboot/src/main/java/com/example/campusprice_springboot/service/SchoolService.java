package com.example.campusprice_springboot.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.campusprice_springboot.entity.SqlEntity.SchoolEntity;
import com.example.campusprice_springboot.mapper.SchoolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SchoolService {

    @Autowired
    private SchoolMapper schoolMapper;

    public List<SchoolEntity> getSchoolList(String province){
        System.out.println(province);
        QueryWrapper<SchoolEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("province_name",province);

        return schoolMapper.selectList(queryWrapper);
    }

}
