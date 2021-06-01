package com.spring5213.mypro00j.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring5213.mypro00j.common.paging.MyCmtPagingDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.spring5213.mypro00j.config.MyMybatisConfig.class} )
@Log4j
public class MyCmtMapperTests {
	
    @Setter(onMethod_ = @Autowired)
    private MyCommentMapper myCommentMapper;
    
//    //매퍼인스턴스 생성 테스트
//    @Test
//    public void testMapper() {
//        log.info(myCommentMapper);
//    }
//    
//    //특정 게시물에 대한 댓글 목록 조회 테스트
//    @Test
//    public void testSelectMyCmtList() {
//        Long targetBno = 262143L;
//        myCommentMapper.selectMyCmtList(targetBno).forEach(myComment -> System.out.println(myComment));
//    }
//
    //특정 게시물에 대한 댓글 목록 조회(페이징) 테스트
    @Test
    public void testSelectMyCmtListPaging() {
    	
    	Long targetBno = 262143L;
    	
    	MyCmtPagingDTO myCmtPaging = new MyCmtPagingDTO(targetBno, 1);
    	
    	long totalCmtCnt = myCommentMapper.selectCmtTotalByBno(myCmtPaging);
    	log.info("댓글 총 개수: "+ totalCmtCnt);

    	myCommentMapper.selectMyCmtList(myCmtPaging).forEach(myComment -> System.out.println(myComment));
    }
//
//    //댓글 등록 테스트
//    @Test
//    public void testInsertMyCmt() {
//    	
//        MyCommentVO myComment = new MyCommentVO();
//        myComment.setBno(262143L);
//        myComment.setCcontent("매퍼 댓글 입력 테스트 ");
//        myComment.setCwriter("user7");
//        
//        log.info("매퍼 - 추가 전 댓글 객체: " + myComment);
//        myCommentMapper.insertMyCmt(myComment);
//        
//        log.info("매퍼 - 추가 후 댓글 객체: " + myComment);
//        myCommentMapper.selectMyCmtReply(262143L, myComment.getCno());
//    }
//    
//    //댓글의 답글 등록 테스트
//    @Test
//    public void testInsertMyReply() {
//    	
//        MyCommentVO myComment = new MyCommentVO();
//        
//        myComment.setBno(262143L);
//        myComment.setCcontent("매퍼 댓글의 댓글 입력 테스트 ");
//        myComment.setCwriter("user3");
//        myComment.setPcno(1L);
//        
//        log.info("매퍼 - 추가 전 댓글 객체: " + myComment);
//        myCommentMapper.insertMyReply(myComment);
//        
//        log.info("매퍼 - 추가 후 답글 객체: " + myComment);
//        myCommentMapper.selectMyCmtReply(262143L, myComment.getCno());
//    }
//    
//    //댓글-답글 조회 테스트
//    @Test
//    public void testSelectMyCmt() {
//        Long targetBno = 262143L;
//        Long targetCno = 2L;
//        
//        //262143L
//        MyCommentVO myComment = myCommentMapper.selectMyCmtReply(targetBno, targetCno);
//        log.info(myComment);
//    }
//    
//    //댓글-답글 수정 테스트
//    @Test
//    public void testUpdateMyCmtReply() {
//        Long targetBno = 262143L;
//        Long targetCno = 4L;
//        
//        MyCommentVO myComment = myCommentMapper.selectMyCmtReply(targetBno, targetCno);
//        myComment.setCcontent("매퍼 - 수정 테스트..");
//        
//        int count = myCommentMapper.updateMyCmtReply(myComment);
//        log.info("UPDATE COUNT: " + count);
//        log.info(myCommentMapper.selectMyCmtReply(targetBno, targetCno));
//    }
//    
//    //댓글-답글 삭제(cdelFlg=1로 수정) 테스트
//    @Test
//    public void testUpdateCdelFlg() {
//        Long targetBno = 262143L;
//        Long targetCno = 3L;
//        
//        int count = myCommentMapper.updateCdelFlg(targetBno, targetCno);
//        log.info("DELETE COUNT: " + count);
//        log.info(myCommentMapper.selectMyCmtReply(targetBno, targetCno));
//
//	}
//    
//    //댓글-답글 삭제: 실제삭제
//    @Test
//    public void testDeleteMyCmtReply() {
//        Long targetBno = 262143L;
//        Long targetCno = 3L;
//        
//        int count = myCommentMapper.deleteMyCmtReply(targetBno, targetCno);
//        log.info("DELETE COUNT: " + count);
//        log.info(myCommentMapper.selectMyCmtReply(targetBno, targetCno));
//    }

}

