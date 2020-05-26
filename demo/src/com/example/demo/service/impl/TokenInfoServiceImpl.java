package com.example.demo.service.impl;

//import com.example.demo.entity.video.TokenExample;
import com.example.demo.entity.video.TokenInfo;
import com.example.demo.mapper.video.TokenInfoMapper;
import com.example.demo.service.TokenInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TokenInfoServiceImpl implements TokenInfoService {
    @Autowired
    private TokenInfoMapper tokenInfoMapper;

    @Override
    public PageInfo<TokenInfo> listByTokenInfo(TokenInfo tokenInfo, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<TokenInfo> tokenInfoList = tokenInfoMapper.listByTokenInfo(tokenInfo);
        PageInfo<TokenInfo> pageInfo = new PageInfo<>(tokenInfoList);
        return pageInfo;
    }

    @Override
    public void insert(TokenInfo tokenInfo) {
        tokenInfoMapper.insert(tokenInfo);
    }

    @Override
    public void update(TokenInfo tokenInfo) {
        tokenInfoMapper.update(tokenInfo);
    }

    @Override
    public void delete(Integer id) {
        tokenInfoMapper.delete(id);
    }

//    @Override
//    public void deleteTokens(Integer userId) {
//        TokenExample tokenExample = new TokenExample();
//        TokenExample.Criteria criteria = tokenExample.createCriteria();
//        criteria.andUserIdEqualTo(userId);
//        tokenInfoMapper.deleteByExample(tokenExample);
//    }
//
//    @Override
//    public TokenInfo findToken(String token) {
//        TokenExample tokenExample = new TokenExample();
//        TokenExample.Criteria criteria = tokenExample.createCriteria();
//        criteria.andTokenEqualTo(token);
////        List<TokenInfo> tokenList = tokenInfoMapper.selectByExample(tokenExample);
//        List<TokenInfo> tokenList = tokenInfoMapper.selectByToken(token);
//        System.out.println("token数据："+tokenList);
//        if (tokenList.size() == 0) {
//            return null;
//        } else {
//            return tokenList.get(0);
//        }
//    }
}
