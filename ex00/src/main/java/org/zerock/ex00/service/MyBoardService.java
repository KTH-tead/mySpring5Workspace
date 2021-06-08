package org.zerock.ex00.service;

import java.util.List;

import org.zerock.ex00.common.paging.MyBoardPagingDTO;
import org.zerock.ex00.domain.MyBoardAttachFileVO;
import org.zerock.ex00.domain.MyBoardVO;

public interface MyBoardService {

	//게시물 목록 조회 서비스1
	//public List<MyBoardVO> getBoardList();

	//게시물 목록 조회 서비스2 - 페이징 고려
	public List<MyBoardVO> getBoardList(MyBoardPagingDTO myBoardPagingDTO);
	
	//게시물 총 개수 조회 서비스 - 페이징 시 필요
	public Long getRowAmountTotal(MyBoardPagingDTO myBoardPagingDTO);
	
	//게시물 등록
	public long registerBoard(MyBoardVO myBoard);
	
	//게시물 조회
	public MyBoardVO getBoard(Long bno);
	
	//게시물 수정
	public boolean modifyBoard(MyBoardVO myBoard);
	
	//게시물 삭제 - 사용자
	public boolean setBoardDeleted(Long bno);
	
	//게시물 삭제 - 관리자, 실제 삭제
	public boolean removeBoard(Long bno);
	
	//게시물 삭제(관리자) 사용자 삭제 요청된 게시물 전체 삭제
	public int removeAllDeletedBoard();
	
	//게시물의 첨부파일 조회
	public List<MyBoardAttachFileVO> getAttachFilesByBno( Long bno);
}
