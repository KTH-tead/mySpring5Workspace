package com.spring5213.mypro00j.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring5213.mypro00j.common.paging.MyCmtPagingDTO;
import com.spring5213.mypro00j.domain.MyCommentVO;

public interface MyCommentMapper {
	
    //댓글-답글 목록 조회(by bno)
    //public List<MyCommentVO> selectMyCmtList(@Param("bno") Long bno);
	
    //특정 게시물에 대한 댓글 목록 조회(페이징): bno를 myCmtPagingDTO에 포함
    public List<MyCommentVO> selectMyCmtList(@Param("myCmtPaging") MyCmtPagingDTO myCmtPaging);
	
    //교재: 
    //public List<MyCommentVO> selectMyCmtList(@Param("myCmtPaging") MyCmtPagingDTO myCmtPaging,
    //                                         @Param("bno") Long bno);
	
    //특정 게시물의 댓글 총 개수확인
    public int selectCmtTotalByBno(@Param("myCmtPaging") MyCmtPagingDTO myCmtPaging);
	
    //댓글 등록: selectKey로 등록된 댓글 번호(cno) 반환
    public long insertMyCmt(MyCommentVO myComment);
    
    //답글 등록: selectKey로 등록된 답글 번호(cno) 반환
    public long insertMyReply(MyCommentVO myComment);
    
    //댓글-답글 조회(by bno,cno)
    public MyCommentVO selectMyCmtReply(@Param("bno") Long bno, @Param("cno") Long cno);
    
    //댓글-답글 수정(by bno,cno)
    public int updateMyCmtReply(MyCommentVO myComment);
    
    //댓글-답글 삭제(cdelFlg update)
    public int updateCdelFlg(@Param("bno") Long bno, @Param("cno") Long cno);
    
    //댓글-답글 삭제(실제삭제)
    public int deleteMyCmtReply(@Param("bno") Long bno, @Param("cno") Long cno);
    
    //특정 게시물에 대한 모든 댓글 삭제  - myreply.bno어 컬럼의 F.K에 ON DELETE CASCADE를 사용하는 경우, 필요 없음
    //public int deleteAllCmt(@Param("bno") Long bno);


}