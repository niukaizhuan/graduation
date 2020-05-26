package com.example.demo.service;

import com.example.demo.entity.video.TokenInfo;
import com.github.pagehelper.PageInfo;

public interface TokenInfoService {
    /**
     * 查询授权记录
     * @param tokenInfo
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfo<TokenInfo> listByTokenInfo(TokenInfo tokenInfo, Integer pageNum, Integer pageSize);

    /**
     * 插入授权记录
     * @param tokenInfo
     */
    void insert(TokenInfo tokenInfo);

    /**
     * 更新
     * @param tokenInfo
     */
    void update(TokenInfo tokenInfo);

    /**
     * 删除
     * @param id
     */
    void delete(Integer id);


//    TokenInfo findToken(String token);

//    void addToken(Token token);
//
//    void updateToken(Token token);
//
//    void deleteTokens(Integer userId);
}
