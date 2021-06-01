package com.spring5213.mypro00j.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring5213.mypro00j.common.paging.MyCmtPagingCreatorDTO;
import com.spring5213.mypro00j.common.paging.MyCmtPagingDTO;
import com.spring5213.mypro00j.domain.MyCommentVO;
import com.spring5213.mypro00j.service.MyCommentService;

import lombok.extern.log4j.Log4j;

@RequestMapping(value= {"/mycomments"})
@RestController //컨트롤러 클래스 내에 메소드들은 JSP파일을 호출할 수 없습니다.(이유: 데이터만 전달해 주므로)
@Log4j
public class MyCommentController {
	
    //생성자 자동 주입
    private MyCommentService myCommentService;

    public MyCommentController(MyCommentService myCommentService) {
        this.myCommentService = myCommentService;
    }
//// - 컨트롤로의 매핑 URL 목록
//// 댓글 목록 조회  : GET    /mycomments/{bno}/pages/{page}  <-전체 댓글 수 고려
//// 댓글 등록        : POST   /mycomments/{bno}/new           <-cno 반환
//// 답글 등록        : POST   /mycomments/{bno}/{pcno}/new    <-cno 반환
//// 댓글-답글 조회: GET    /mycomments/{bno}/{cno}
//// 댓글-답글 수정: PUT    /mycomments/{bno}/{cno}
//// 댓글-답글 삭제: DELETE /mycomments/{bno}/{cno}         <-실제 삭제
//// 댓글-답글 삭제: PATCH  /mycomments/{bno}/{cno}         <-cdelflg, 1 수정

//    //게시물에 대한 댓글 목록 조회(페이징1-전체댓글 수 고려 안함)
//    @GetMapping(value = "/{bno}/pages/{page}", 
//              //produces = {MediaType.APPLICATION_JSON_UTF8_VALUE }) //5.2부터 Deprecated 됨
//              produces = { "application/xml; charset=UTF-8",  "application/json; charset=UTF-8" })
//    public ResponseEntity<List<MyCommentVO>> showCmtList(@PathVariable("bno") Long bno,
//                                                         @PathVariable("page") Integer pageNum) {
//        log.info("댓글-컨트롤러 댓글목록 표시-URI 추출 bno: " + bno);
//        log.info("댓글-컨트롤러 댓글목록 표시-URI 추출 pageNum: " + pageNum);
//
//        MyCmtPagingDTO myCmtPaging = new MyCmtPagingDTO(bno, pageNum);
//        log.info("댓글-컨트롤러 댓글목록 표시-생성된 MyCmtPagingDTO: " + myCmtPaging);
//
//        return new ResponseEntity<>(myCommentService.getCmtList(myCmtPaging), HttpStatus.OK);
//    }

    //게시물에 대한 댓글 목록 조회(페이징2-전체 댓글 수 고려)
    @GetMapping(value = "/{bno}/pages/{page}", 
                produces = { "application/json; charset=UTF-8", "application/xml; charset=UTF-8" })
    public ResponseEntity<MyCmtPagingCreatorDTO> showCmtList(@PathVariable("bno") Long bno,
                                                             @PathVariable("page") Integer pageNum) {
        log.info("댓글-컨트롤러 - 댓글목록 표시-URI 추출 bno: " + bno);
        log.info("댓글-컨트롤러 - 댓글목록 표시-URI 추출 pageNum: " + pageNum);
        
        MyCmtPagingDTO myCmtPaging = new MyCmtPagingDTO(bno, pageNum);
        log.info("댓글-컨트롤러 - 댓글목록 표시 - 생성된 MyCmtPagingDTO: " + myCmtPaging);
        
        MyCmtPagingCreatorDTO myCmtPagingCreator = myCommentService.getCmtList(myCmtPaging);
        
        log.info("댓글-컨트롤러 - 댓글목록 표시 - 서비스가 반환한 MyCmtPagingCreatorDTO: " + myCmtPagingCreator );
        
        ResponseEntity<MyCmtPagingCreatorDTO> responseEntity = 
                new ResponseEntity<>(myCmtPagingCreator, HttpStatus.OK);
        
        log.info("댓글-컨트롤러 - 댓글목록 표시 - 브라우저로 전달되는 ResponseEntity<>: " + responseEntity);
        
        return responseEntity;
        //return new ResponseEntity<>(myCmtPagingCreator, HttpStatus.OK);
    }

    //브라우저에서 http://localhost:8080/replies/pages/4849721/1       <--XML형식으로 표시됨
    //브라우저에서 http://localhost:8080/replies/pages/4849721/1.json  <--JSON형식으로 표시됨	

    //댓글 등록(cno 반환)
    @PreAuthorize("isAuthenticated()")
    @PostMapping(value = "/{bno}/new", 
                 consumes = {"application/json; charset=UTF-8"}, //웹브라우저->서버, MIME-유형 
                 produces = {"text/plain; charset=UTF-8"})       //서버->웹브라우저, MIME-유형
    public ResponseEntity<String> registerCmt(@PathVariable("bno") Long bno,
                                              @RequestBody MyCommentVO myComment) {
        log.info("댓글-컨트롤러-댓글 등록-URI 추출 bno: " + bno);
        log.info("댓글-컨트롤러-댓글 등록-myComment.getBno: " + myComment.getBno());
        log.info("댓글-컨트롤러-댓글 등록-서비스로 전달되는 MyCommentVO: " + myComment);
	    
	    //myComment.setBno(bno);
        Long registerdCno = myCommentService.registerCmt(myComment);
        log.info("댓글-컨트롤러-댓글 등록-반환된 cno(registerdCno): " + registerdCno);
        log.info("댓글-컨트롤러-댓글 등록-myComment.getCno: " + myComment.getCno());

        //반환값을 삼항연산자로 처리
        return registerdCno != null 
                   ? new ResponseEntity<>("댓글 등록 성공", HttpStatus.OK)
                   : new ResponseEntity<>("댓글 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
	}

    //답글 등록: cno 반환
    @PreAuthorize("isAuthenticated()")
    @PostMapping(value = "/{bno}/{pcno}/new", 
                 consumes = {"application/json; charset=UTF-8"}, 
                 produces = {"text/plain; charset=UTF-8" })  //{MediaType.TEXT_PLAIN_VALUE}
    public ResponseEntity<String> registerReply(@PathVariable("bno") Long bno,
                                                @PathVariable("pcno") Long pcno,
                                                @RequestBody MyCommentVO myComment) {
        log.info("댓글-컨트롤러 - 답글 등록-URI 추출 bno: " + bno);
        log.info("댓글-컨트롤러 - 답글 등록-myComment.getCBno: " + myComment.getBno());
        log.info("댓글-컨트롤러 - 답글 등록-URI 추출 pcno: " + pcno);
        log.info("댓글-컨트롤러 - 답글 등록-myComment.getPcno: " + myComment.getPcno());
        
        log.info("댓글-컨트롤러 - 답글 등록-전달된 MyCommentVO: " + myComment);
        
        Long registerdCno = myCommentService.registerReply(myComment);
        log.info("댓글-컨트롤러 - 답글 등록-등록된 답글 cno(registerdCno): " + registerdCno);
        log.info("댓글-컨트롤러 - 답글 등록-등록된 답글 cno(myComment.getCno): " + myComment.getCno());
        
        //반환값을 삼항연산자로 처리
        return registerdCno != null
                ? new ResponseEntity<>("답글 등록 성공", HttpStatus.OK)
                : new ResponseEntity<>("답글 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    //댓글-답글 조회
    @GetMapping(value = "/{bno}/{cno}",
                produces = {"application/json; charset=UTF-8"})
    public ResponseEntity<MyCommentVO> showCmt(@PathVariable("bno") Long bno, 
                                               @PathVariable("cno") Long cno) {
        log.info("댓글-컨트롤러 - 댓글/답글 조회- URI추출 bno: " + bno);
        log.info("댓글-컨트롤러 - 댓글/답글 조회- URI추출 cno: " + cno);
        
        MyCommentVO myComment = myCommentService.getCmtReply(bno, cno);
        log.info("댓글-컨트롤러 - 댓글/답글 조회- 브라우저로 전달되는MyCommentVO: " + myComment);
        
        return new ResponseEntity<>(myComment, HttpStatus.OK);
        //return new ResponseEntity<>(myCommentService.getReply(bno, cno), HttpStatus.OK);
    }

    //HTTP, PUT: 리소스의 모든 것을 업데이트 한다,  PATCH : 리소스의 일부를 업데이트 한다.
    //      따라서, PUT은 누락된 값 --> null로 처리 -> db에서 DEFAULT 등으로 처리해서 차이가 거의 없다.

    //댓글-답글 수정
    @PreAuthorize("isAuthenticated() && principal.username == #myComment.rwriter")
    @PutMapping(value = "/{bno}/{cno}", 
                consumes = "application/json; charset=UTF-8", 
                produces = "text/plain; charset=UTF-8" )
    public ResponseEntity<String> modifyCmtReply(@PathVariable("bno") Long bno, 
                                                 @PathVariable("cno") Long cno,
                                                 @RequestBody MyCommentVO myComment) {
        log.info("댓글-컨트롤러 - 댓글/답글 수정-URI 추출 bno: " + bno);
        log.info("댓글-컨트롤러 - 댓글/답글 수정-URI 추출 cno: " + cno);
        log.info("댓글-컨트롤러 - 댓글/답글 수정-전달된 MyCommentVO: " + myComment);
        
        myComment.setBno(bno);
        myComment.setCno(cno);

        return myCommentService.modifyCmtReply(myComment) == 1
                ? new ResponseEntity<>("댓글/답글 수정 성공", HttpStatus.OK)
                : new ResponseEntity<>("댓글/답글 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    //댓글-답글 삭제(cdelFlg=1 수정)
    @PreAuthorize("isAuthenticated() && principal.username == #myComment.rwriter")
    @PatchMapping(value = "/{bno}/{cno}", 
                  consumes = "application/json; charset=UTF-8", 
                  produces = "text/plain; charset=UTF-8" )
    public ResponseEntity<String> setCmtReplyDeleted(@PathVariable("bno") Long bno, 
                                                     @PathVariable("cno") Long cno,
                                                     @RequestBody MyCommentVO myComment) {
        log.info("댓글-컨트롤러 - 댓글/답글 삭제1-cdelflag를1로수정만함");
        log.info("댓글-컨트롤러 - 댓글/답글 삭제1-URI 추출 bno: " + bno);
        log.info("댓글-컨트롤러 - 댓글/답글 삭제1-URI 추출 cno: " + cno);
        log.info("댓글-컨트롤러 - 댓글/답글 삭제1-myComment: " + myComment);
       
        return myCommentService.setCmtReplyDeleted(bno, cno) == 1
                ? new ResponseEntity<>("댓글/답글 삭제 성공", HttpStatus.OK)
                : new ResponseEntity<>("댓글/답글 삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
    }    
    
    //댓글-답글 삭제(실제 삭제 발생)
    @PreAuthorize("isAuthenticated() && principal.username == #myComment.rwriter")
    @DeleteMapping(value = "/{bno}/{cno}", 
                   produces = { "text/plain; charset=UTF-8" })
    public ResponseEntity<String> removeCmtReply(@PathVariable("bno") Long bno, 
                                                 @PathVariable("cno") Long cno,
                                                 @RequestBody MyCommentVO myComment) { 
        log.info("댓글-컨트롤러 - 댓글/답글 삭제2-실제 삭제됨");
        log.info("댓글-컨트롤러 - 댓글/답글 삭제2-URI 추출 bno: " + bno);
        log.info("댓글-컨트롤러 - 댓글/답글 삭제2-URI 추출 cno: " + cno);
        log.info("댓글-컨트롤러 - 댓글/답글 삭제2-myComment: " + myComment);
        
        return myCommentService.removeCmtReply(bno, cno) == 1
                ? new ResponseEntity<>("댓글/답글 삭제 성공", HttpStatus.OK)
                : new ResponseEntity<>("댓글/답글 삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
