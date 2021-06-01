package com.spring5213.mypro00j.common.paging;

import java.util.List;

import com.spring5213.mypro00j.domain.MyCommentVO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class MyCmtPagingCreatorDTO {
    private MyCmtPagingDTO myCmtPaging ; //페이지번호와 행개수 저장 객체
    private int startPagingNum;          //화면에 표시되는 시작 페이징 번호
    private int endPagingNum;            //화면에 표시되는 끝 페이징 번호
    private boolean prev;                //이전 버튼 표시 여부 결정 변수(true: 표시됨, false: 표시 안됨)
    private boolean next;                //다음 버튼 표시 여부 결정 변수(true: 표시됨, false: 표시 안됨)
    private int cmtTotalByBno;           //특정 게시물의 총 댓글 개수
    private int pagingNumCnt;            //화면 하단에 표시할 기본 페이지 번호 개수(5)
    private int lastPageNum ;            //마지막 페이지 번호
    
    private List<MyCommentVO> myCmtList;
    
    public MyCmtPagingCreatorDTO(int cmtTotalByBno,
                                 MyCmtPagingDTO myCmtPaging,
                                 List<MyCommentVO> myCmtList) {
        this.myCmtPaging = myCmtPaging ;
        this.cmtTotalByBno = cmtTotalByBno;
        this.myCmtList = myCmtList ;
        this.pagingNumCnt = 2;
        
        //계산된 끝-시작 페이징 번호:
        this.endPagingNum = (int)( Math.ceil(myCmtPaging.getPageNum() / (this.pagingNumCnt * 1.0) ) ) * this.pagingNumCnt ;
        this.startPagingNum = this.endPagingNum - (this.pagingNumCnt -1);
        
        //행 총수를 기준으로 한 실제 마지막 페이지 번호
        lastPageNum = (int)( Math.ceil( (cmtTotalByBno * 1.0) / myCmtPaging.getRowAmountPerPage() ) );
        
        //계산된 끝 페이징 번호가 실제 마지막 페이지 번호보다 크면, endPagingNum 값을 lastPageNum 으로 대체
        if (lastPageNum < this.endPagingNum) {
            this.endPagingNum = lastPageNum ;
        }
        
        this.prev = this.startPagingNum > 1 ;
        this.next = this.endPagingNum < lastPageNum ;
        
        System.out.println("댓글-전달된 페이징 기본데이터-MyCmtPagingDTO: " + myCmtPaging.toString());
        System.out.println("댓글-끝 페이징번호: " + this.endPagingNum);
        System.out.println("댓글-시작 페이징번호: " + this.startPagingNum);
        System.out.println("댓글-이전버튼 표시 여부: " + this.prev);
        System.out.println("댓글-다음버튼 표시 여부: " + this.next);
    }

}
