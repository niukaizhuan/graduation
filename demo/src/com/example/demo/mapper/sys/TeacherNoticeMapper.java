package com.example.demo.mapper.sys;

import com.example.demo.entity.sys.TeacherNotice;
import com.example.demo.entity.sys.TeacherNoticeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherNoticeMapper {
    int countByExample(TeacherNoticeExample example);

    int deleteByExample(TeacherNoticeExample example);

    int deleteByPrimaryKey(Integer noticeId);

    int insert(TeacherNotice record);

    int insertSelective(TeacherNotice record);

    List<TeacherNotice> selectByExample(TeacherNoticeExample example);

    TeacherNotice selectByPrimaryKey(Integer noticeId);

    int updateByExampleSelective(@Param("record") TeacherNotice record, @Param("example") TeacherNoticeExample example);

    int updateByExample(@Param("record") TeacherNotice record, @Param("example") TeacherNoticeExample example);

    int updateByPrimaryKeySelective(TeacherNotice record);

    int updateByPrimaryKey(TeacherNotice record);
}