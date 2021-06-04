package org.zerock.ex00.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import lombok.Data;

/*@Component 
 * 지금은 자동으로 만들어짐*/
@Data
public class MyBoardVO {
	private long bno ;
	private String btitle ;
	private String bcontent ;
	private String bwriter ;
	private int bviewsCnt ;
	private int breplyCnt ;
	private int bdelFlag ; //1: 삭제요청됨, 0: 유지
	private Date bregDate ;
	private Timestamp bmodDate ;
	
	private List<BoardAttachFileVO> attachFileList ;
}