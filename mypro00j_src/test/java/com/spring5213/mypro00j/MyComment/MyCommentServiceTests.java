package com.spring5213.mypro00j.MyComment;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring5213.mypro00j.common.paging.MyCmtPagingCreatorDTO;
import com.spring5213.mypro00j.common.paging.MyCmtPagingDTO;
import com.spring5213.mypro00j.config.MyMybatisConfig;
import com.spring5213.mypro00j.config.MyServletConfig;
import com.spring5213.mypro00j.domain.MyCommentVO;
import com.spring5213.mypro00j.service.MyCommentService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration    //테스트 시, DispatcherServlet의 설정클래스를 사용하기 위한 어노테이션
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes ={MyMybatisConfig.class, MyServletConfig.class})
@Log4j
public class MyCommentServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private MyCommentService myCommentService;
		
////생성자 주입 방식: 테스트 시 오류(JUnit 특징)
////    private MyCommentService myCommentService;
////    public MyCommentServiceTests(MyCommentService myCommentService) {
////        this.myCommentService = myCommentService;
////    }
////    테스트 시 오류: java.lang.Exception: Test class should have exactly 
////               one public zero-argument constructor
////
////    setter를 이용한 자동 주입
////    private MyCommentService myCommentService;
////
////    @Autowired
////    public void setMyCommentService(MyCommentService myCommentService) {
////        this.myCommentService = myCommentService;
////    }
	
    //MyCommentService 빈 생성 유무 확인 테스트
    @Test
    public void testMyCommentServiceExist() {
        log.info(myCommentService);
        assertNotNull(myCommentService);
    }
    
    //댓글 목록 조회(by bno, 페이징2-전체 댓글 수 고려)
    @Test
    public void testGetCmtList() {
        MyCmtPagingCreatorDTO myCmtPagingCreator = myCommentService.getCmtList(new MyCmtPagingDTO(262143, 1));
        log.info("댓글-서비스-게시물에 대한 댓글 목록 조회 테스트- 반환된 MyCmtPagingCreatorDTO: " + myCmtPagingCreator );
    }
    
    //댓글 등록  테스트: cno 반환  <--이 때 댓글번호 메모, 삭제 테스트에서 사용
    @Test
    public void testRegisterCmt() {

        MyCommentVO myComment = new MyCommentVO();
        myComment.setBno(262143L);
        myComment.setCcontent("서비스 게시물에 대한 댓글 등록 테스트");
        myComment.setCwriter("user1");
        
        Long registeredCno = myCommentService.registerCmt(myComment);
        log.info("서비스 게시물에 대한 댓글 등록 테스트-등록된 댓글번호: "+registeredCno);
    }
    
    //답글 등록 테스트: cno 반환
    @Test
    public void testRegisterReply() {

        MyCommentVO myComment = new MyCommentVO();
        myComment.setBno(262143L);
        myComment.setCcontent("서비스 테스트 - 답글 등록 테스트");
        myComment.setCwriter("user1");
        myComment.setPcno(15L);
        
        Long registeredCno = myCommentService.registerReply(myComment);
        log.info("서비스 게시물의 댓글에 대한 댓글 등록 테스트-등록된 댓글번호: "+registeredCno);
    }
    
    //댓글-답글 조회
    @Test
    public void testGetCmtReply() {
        log.info(myCommentService.getCmtReply(262143L, 6L));
    }
    
    //댓글-답글 수정
    @Test
    public void testModifyReply() {
    
        MyCommentVO myComment = myCommentService.getCmtReply(262143L, 1L);
        
        if (myComment == null) {
            return;
        }
        
        myComment.setCcontent("서비스-댓글 수정테스트입니다.수정");
        log.info("서비스-댓글 수정테스트시 반환된 값(수정된 댓글 수): " + myCommentService.modifyCmtReply(myComment));
        log.info("서비스-댓글 수정테스트: 수정후 조회(수정된 myCommentVO): " + myCommentService.getCmtReply(262143L, 1L));
    }
    
    //댓글-답글 삭제 테스트: cdelFlg = 1 로 수정
    @Test
    public void testSetCmtReplyDeleted() {
        //댓글 목록 보기 테스트를 다시해서 댓글의 bno와 cno 존재 여부를 확인하고 테스트할 것
        log.info("서비스: 특정 게시물 삭제 테스트(cdelFlg수정): " + myCommentService.setCmtReplyDeleted(262143L, 5L));
    }
    
    //댓글-답글 삭제 테스트: 실제 삭제
    @Test
    public void testRemoveCmtReply() {
        //댓글 목록 보기 테스트를 다시해서 댓글의 bno와 cno 존재 여부를 확인하고 테스트할 것
        log.info("서비스: 특정 게시물 삭제 테스트: " + myCommentService.removeCmtReply(262143L, 21L));
    }
}
