package com.example.demo.mapper.sys;

import com.example.demo.entity.sys.StudentHomeRotationImg;
import com.example.demo.entity.sys.StudentHomeRotationImgExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentHomeRotationImgMapper {
    int countByExample(StudentHomeRotationImgExample example);

    int deleteByExample(StudentHomeRotationImgExample example);

    int deleteByPrimaryKey(Integer imgId);

    int insert(StudentHomeRotationImg record);

    int insertSelective(StudentHomeRotationImg record);

    List<StudentHomeRotationImg> selectByExample(StudentHomeRotationImgExample example);

    StudentHomeRotationImg selectByPrimaryKey(Integer imgId);

    int updateByExampleSelective(@Param("record") StudentHomeRotationImg record, @Param("example") StudentHomeRotationImgExample example);

    int updateByExample(@Param("record") StudentHomeRotationImg record, @Param("example") StudentHomeRotationImgExample example);

    int updateByPrimaryKeySelective(StudentHomeRotationImg record);

    int updateByPrimaryKey(StudentHomeRotationImg record);
}