package com.spring5213.mypro00j.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyBoardVO {
	
	private long bno ;
	private String btitle ;
	private String bcontent ;
	private String bwriter ;
	private int bviewsCnt ; 
	private int bcommentCnt ;
	private int bdelFlag ;  //1: 삭제요청됨, 0: 유지
	private Timestamp bregDate ;
	private Timestamp bmodDate ;


}


