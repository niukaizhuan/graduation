package com.example.demo.mapper.sys;

import com.example.demo.entity.sys.BankFillQue;
import com.example.demo.entity.sys.BankFillQueExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BankFillQueMapper {
    int countByExample(BankFillQueExample example);

    int deleteByExample(BankFillQueExample example);

    int deleteByPrimaryKey(Integer fillId);

    int insert(BankFillQue record);

    int insertSelective(BankFillQue record);

    List<BankFillQue> selectByExample(BankFillQueExample example);

    BankFillQue selectByPrimaryKey(Integer fillId);

    int updateByExampleSelective(@Param("record") BankFillQue record, @Param("example") BankFillQueExample example);

    int updateByExample(@Param("record") BankFillQue record, @Param("example") BankFillQueExample example);

    int updateByPrimaryKeySelective(BankFillQue record);

    int updateByPrimaryKey(BankFillQue record);

    List<BankFillQue> getFillQueListByPaperId(Integer paperId);

    List<BankFillQue> getRandomFillByCountAndLangId(@Param("langId") Integer langId, @Param("fillNum") Integer fillNum);
}