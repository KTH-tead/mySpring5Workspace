package com.spring5213.mypro00j.common.paging;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MyCmtPagingDTO {
	
    private long bno;             //게시물 번호
    private Integer pageNum;      //현재 페이지 번호
    private int rowAmountPerPage; //페이지당 출력할 레코드 개수
    
    //생성자 - 댓글의 페이징번호 클릭 시,
    //페이지번호와 행수를 각각 사용자가 선택한 페이징번호와 5로 전달
    public MyCmtPagingDTO(long bno, Integer pageNum) {

        this.bno = bno;

        if(pageNum == null) {
            this.pageNum = 1 ;
        } else {
            this.pageNum = pageNum;
        }
        this.rowAmountPerPage = 5 ;
    }
}
