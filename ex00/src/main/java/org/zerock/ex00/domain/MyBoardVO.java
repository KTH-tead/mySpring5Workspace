package org.zerock.ex00.domain;

import java.sql.Timestamp;
import java.util.Date;

//import org.springframework

import lombok.Data;

//@component
//@data

public class MyBoardVO {
	private long bno;
	private String bittle ;
	private String bcontent ;
	private String bwriter ;
	private int bviewsCnt ;
	private int breplyCnt ;
	private int bdelFlag ;
	private Date bregDate ;
	private Timestamp bmoDate ;
}
