package org.zerock.ex00.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.ex00.common.paging.MyBoardPagingDTO;
import org.zerock.ex00.domain.MyBoardVO;

public interface MyBoardMapper {
	//게시물 조회 - 목록
//	public List<MyBoardVO> selectMyBoardList();
	
	//게시물 조회 - 목록(페이징 고려)
	public List<MyBoardVO> selectMyBoardList(MyBoardPagingDTO myBoardPagingDTO);
	
	//게시물 조회 - 총 게시물 개수(페이징 데이터)
	//public Long selectRowAmountTotal();
	public Long selectRowAmountTotal(MyBoardPagingDTO myBoardPagingDTO);
	
	//게시물 등록1 - selectKey 이용 안 함
	public Integer insertMyBoard(MyBoardVO myBoard);
	
	//게시물 등록2 - selectKey 이용
	public Integer insertMyBoardSelectKey(MyBoardVO myBoard);
	
	//게시물 조회
	public MyBoardVO selectMyBoard(Long bno);
	
	//게시물 삭제 by 사용자 - 해당 글 bdelFlag 1로 수정
	public int updateBdelFlag(Long bno);
	
	//게시물 삭제 by 관리자 - 실제 삭제 발생
	public int deleteMyBoard(Long bno);
	
	//게시물 삭제(관리자) 삭제 요청된 게시물 전체 삭제
	public int deleteAllBoardSetDeleted();
	
	//게시물 수정
	public int updateMyBoard(MyBoardVO myBoard);
	
	//게시물 조회수 증가
	public void updateBviewsCnt(Long bno);
	
	//댓글 개수 증가/감소
	public void updateBReplyCnt(@Param ("bno") Long bno, @Param ("amount") int amount);
}