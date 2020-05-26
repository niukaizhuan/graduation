package com.example.demo.mapper.sys;

import com.example.demo.entity.sys.PaperQue;
import com.example.demo.entity.sys.PaperQueExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PaperQueMapper {
    int countByExample(PaperQueExample example);

    int deleteByExample(PaperQueExample example);

    int deleteByPrimaryKey(Integer queId);

    int insert(PaperQue record);

    int insertSelective(PaperQue record);

    List<PaperQue> selectByExample(PaperQueExample example);

    PaperQue selectByPrimaryKey(Integer queId);

    int updateByExampleSelective(@Param("record") PaperQue record, @Param("example") PaperQueExample example);

    int updateByExample(@Param("record") PaperQue record, @Param("example") PaperQueExample example);

    int updateByPrimaryKeySelective(PaperQue record);

    int updateByPrimaryKey(PaperQue record);
}