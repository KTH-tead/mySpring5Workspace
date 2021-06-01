package com.spring5213.mypro00j.service;

import com.spring5213.mypro00j.common.paging.MyCmtPagingCreatorDTO;
import com.spring5213.mypro00j.common.paging.MyCmtPagingDTO;
import com.spring5213.mypro00j.domain.MyCommentVO;

public interface MyCommentService {

    //댓글 목록 조회(by bno, 페이징1-전체댓글 수 고려 안함)
    //public List<MyCommentVO> getCmtList(MyCmtPagingDTO myCmtPaging);
	
    //댓글 목록 조회(by bno, 페이징2-전체댓글 수 고려)
    public MyCmtPagingCreatorDTO getCmtList(MyCmtPagingDTO myCmtPaging);

    //댓글 총 개수 조회(by bno, 페이징)
    public int getCmtTotalCntByBno(MyCmtPagingDTO myCmtPaging);

    //댓글 등록: cno 반환
    public long registerCmt(MyCommentVO myComment);
	
    //답글 등록: cno 반환
    public long registerReply(MyCommentVO myComment);
		
    //댓글-답글 조회
    public MyCommentVO getCmtReply(long bno, long rno);
	
    //댓글-답글 수정
    public int modifyCmtReply(MyCommentVO myComment);
    
    //댓글-답글 삭제: cdelFlg = 1 로 수정
    public int setCmtReplyDeleted(long bno, long rno);
	
    //댓글-답글 삭제: 실제 삭제
    public int removeCmtReply(long bno, long rno);

}
