package com.example.campusprice_springboot.controller;

import com.example.campusprice_springboot.entity.Response.R;
import com.example.campusprice_springboot.entity.SqlEntity.SchoolEntity;
import com.example.campusprice_springboot.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping(value = "/School")
@RestController
public class SchoolController {

    @Autowired
    private SchoolService schoolService;

    @GetMapping(value = "/{province}")
    public R getSchoolList(@PathVariable(value = "province") String province){
        List<SchoolEntity> result = schoolService.getSchoolList(province);
        return R.ok().data("Provinces",result);
    }

}
