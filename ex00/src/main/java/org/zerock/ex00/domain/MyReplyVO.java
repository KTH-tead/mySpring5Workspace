package org.zerock.ex00.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyReplyVO {

	private long bno;
	private long rno;
	private String rcontent;
	private String rwriter;
	private Timestamp rregDate;
	private Timestamp rmodDate;
	private long prno;
	private int lvl; //계층 쿼리의 레벨 값을 저장할 필드
	
}
