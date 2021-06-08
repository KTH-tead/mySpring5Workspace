package org.zerock.ex00.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor
public class MyBoardAttachFileVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private Long bno;
}
