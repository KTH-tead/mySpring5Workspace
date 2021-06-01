package com.spring5213.mypro00j.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyCommentVO {

    private long bno;
    private long cno;
    private String ccontent;
    private String cwriter;
    private Timestamp cregDate;
    private Timestamp cmodDate;
    private long pcno;
    private int cdelFlg; // 0: flase(유지, N), 1: true(삭제요청 됨, Y)
    private int lvl;  //계층쿼리의 level 값을 저장할 필드

}
