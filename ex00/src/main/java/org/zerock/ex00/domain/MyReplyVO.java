package org.zerock.ex00.domain;

import java.sql.Timestamp;

public class MyReplyVO {

 private long bno;
 private long rno;
 private String rcontent;
 private String rwriter;
 private Timestamp rregDate;
 private Timestamp rmodDate;
 private long prno;
 private int lvl; //계층쿼리의 level 값을 저장할 필드
	
}
