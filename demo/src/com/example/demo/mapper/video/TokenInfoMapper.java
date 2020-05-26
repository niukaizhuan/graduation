package com.example.demo.mapper.video;

//import com.example.demo.entity.video.TokenExample;
import com.example.demo.entity.video.TokenInfo;

import java.util.List;

public interface TokenInfoMapper {
    /**
     * 插入授权记录
     *
     * @param tokenInfo
     */
    void insert(TokenInfo tokenInfo);

    /**
     * 更新
     *
     * @param tokenInfo
     */
    void update(TokenInfo tokenInfo);

    /**
     * 删除
     *
     * @param id
     */
    void delete(Integer id);

    /**
     * 查询
     *
     * @param tokenInfo
     * @return
     */
    List<TokenInfo> listByTokenInfo(TokenInfo tokenInfo);


//    List<TokenInfo> selectByExample(TokenExample example);
//
//    long countByExample(TokenExample example);
//
//    int updateByExample(@Param("record") TokenInfo record, @Param ("example") TokenExample example);
//
//    void deleteByExample(TokenExample tokenExample);

    List<TokenInfo> selectByToken(String token);
}