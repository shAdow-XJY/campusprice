package com.example.campusprice_springboot.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.campusprice_springboot.entity.SqlEntity.SchoolEntity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface SchoolMapper extends BaseMapper<SchoolEntity> {

}
