package com.example.demo.mapper.sys;

import com.example.demo.entity.sys.StudentPaperScore;
import com.example.demo.entity.sys.StudentPaperScoreExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentPaperScoreMapper {
    int countByExample(StudentPaperScoreExample example);

    int deleteByExample(StudentPaperScoreExample example);

    int deleteByPrimaryKey(Integer scoreId);

    int insert(StudentPaperScore record);

    int insertSelective(StudentPaperScore record);

    List<StudentPaperScore> selectByExample(StudentPaperScoreExample example);

    StudentPaperScore selectByPrimaryKey(Integer scoreId);

    int updateByExampleSelective(@Param("record") StudentPaperScore record, @Param("example") StudentPaperScoreExample example);

    int updateByExample(@Param("record") StudentPaperScore record, @Param("example") StudentPaperScoreExample example);

    int updateByPrimaryKeySelective(StudentPaperScore record);

    int updateByPrimaryKey(StudentPaperScore record);
}