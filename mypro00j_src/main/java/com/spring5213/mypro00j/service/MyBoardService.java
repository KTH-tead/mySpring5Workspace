package com.spring5213.mypro00j.service;

import java.util.List;

import com.spring5213.mypro00j.common.paging.MyBoardPagingDTO;
import com.spring5213.mypro00j.domain.MyBoardVO;

public interface MyBoardService {
	
    //게시물 목록 조회 서비스1
    //public List<MyBoardVO> getBoardList();
    
    //게시물 목록 조회 서비스 2 - 페이징 고려
    public List<MyBoardVO> getBoardList(MyBoardPagingDTO myBoardPagingDTO);
    
    //게시물 총 개수 조회 서비스 - 페이징 시 필요
    public Long getRowAmountTotal(MyBoardPagingDTO myBoardPagingDTO);
    
    //게시물 등록: selectKey이용
    //public void register(MyBoardVO myBoard);
    public long registerBoard(MyBoardVO myBoard);
    
    //게시물 조회: 게시물 목록 페이지 -> 게시물 조회 페이지 호출(by bno), 조회수 +1 증가
    public MyBoardVO getBoardDetail(Long bno);

    //게시물 조회: 게시물 조회 페이지 -> 게시물 수정 페이지 호출(by bno), 조회수 변화 없음
    public MyBoardVO getBoardModify(Long bno);

    //게시물 조회: 게시물 수정 후 -> 게시물 조회 페이지 호출(by bno), 조회수 증가 없음
    public MyBoardVO getBoardDetailMod(Long bno) ;
    
    //게시물 수정
    public boolean modifyBoard(MyBoardVO myBoard);
    
    //게시물 삭제 - By 사용자: bdelFlag 컬럼만 1로 수정
    public boolean setBoardDeleted(Long bno);
    
    //게시물 삭제 - By 관리자: 실제 삭제 발생
    public boolean removeBoard(Long bno);
    
    //게시물 삭제(관리자) – 사용자 삭제 요청된 게시물 전체 삭제: bdelFlag = 1
    public int removeAllDeletedBoard();
    
    //특정 게시물의 첨부파일 조회
    //public List<BoardAttachVO> getAttachList(Long bno);
    
    //게시물 등록(REST)
    //public int registerRest(MyBoardVO myBoard);
    
    //게시물 목록(REST)
    //public BoardPageDTO getListRestPage(Criteria cri) ;
}
