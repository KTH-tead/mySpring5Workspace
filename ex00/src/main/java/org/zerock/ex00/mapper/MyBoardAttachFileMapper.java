package org.zerock.ex00.mapper;

import java.util.List;

import org.zerock.ex00.domain.MyBoardAttachFileVO;

public interface MyBoardAttachFileMapper{
	
	public void insertAttachFile(MyBoardAttachFileVO boardAttachFile);
	
	public void deleteAttachFile(String uuid);
	
	public List<MyBoardAttachFileVO> selectAttachFilesByBno(Long bno);
	
	public void deleteAttachFilesByBno(Long bno);
}