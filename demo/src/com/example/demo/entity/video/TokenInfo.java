package com.example.demo.entity.video;

import lombok.Data;

import java.util.Date;

/**
 * 授权记录
 */
@Data
public class TokenInfo {
    private Integer id;

    /**
     * 用户标识
     */
    private Integer userId;

    /**
     * 授权码
     */
    private String token;
    /**
     * 申请时间
     */
    private Date applyTime;
    /**
     * 失效时间
     */
    private Date expireTime;
    /**
     * 授权次数
     */
    private Integer countAuth;
    /**
     * 最大授权次数
     */
    private Integer maxCountAuth;
    /**
     * 用途
     */
    private String ussage;
    /**
     * 状态
     */
    private String state;

    public TokenInfo() {
        this.id = id;
        this.userId = userId;
        this.token = token;
        this.applyTime = applyTime;
        this.expireTime = expireTime;
        this.countAuth = countAuth;
        this.maxCountAuth = maxCountAuth;
        this.ussage = ussage;
        this.state = state;
    }

}