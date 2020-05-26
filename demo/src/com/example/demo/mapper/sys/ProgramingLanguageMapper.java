package com.example.demo.mapper.sys;

import com.example.demo.entity.sys.ProgramingLanguage;
import com.example.demo.entity.sys.ProgramingLanguageExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProgramingLanguageMapper {
    int countByExample(ProgramingLanguageExample example);

    int deleteByExample(ProgramingLanguageExample example);

    int deleteByPrimaryKey(Integer langId);

    int insert(ProgramingLanguage record);

    int insertSelective(ProgramingLanguage record);

    List<ProgramingLanguage> selectByExample(ProgramingLanguageExample example);

    ProgramingLanguage selectByPrimaryKey(Integer langId);

    int updateByExampleSelective(@Param("record") ProgramingLanguage record, @Param("example") ProgramingLanguageExample example);

    int updateByExample(@Param("record") ProgramingLanguage record, @Param("example") ProgramingLanguageExample example);

    int updateByPrimaryKeySelective(ProgramingLanguage record);

    int updateByPrimaryKey(ProgramingLanguage record);
}