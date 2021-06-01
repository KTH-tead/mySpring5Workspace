package com.spring5213.mypro00j.MyComment;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring5213.mypro00j.config.MyMybatisConfig;
import com.spring5213.mypro00j.config.MyServletConfig;

//코드에서, 오류를 마우스 우클릭 --> 메시지에서 static 임포트를 수행
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
//
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.MediaType;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.setup.MockMvcBuilders;
//import org.springframework.web.context.WebApplicationContext;

//import com.google.gson.Gson;


//테스트 메소드를 실행하는 어노테이션
@RunWith(SpringJUnit4ClassRunner.class)
//DispatcherServlet의 구성설정파일을 사용하여 컨트롤러를 테스트 환경에 필요한 설정을 가져옴
@WebAppConfiguration 
@ContextConfiguration(classes = { MyMybatisConfig.class, MyServletConfig.class})
//@Log4j
public class MyCommentControllerTests {
    //private static final Logger logger = LoggerFactory.getLogger(MyReplyControllerTests.class);
	
//테스트 환경 구성
//    //컨트롤러 테스트를 위해서는 WebApplicationContext 를 객체로 주입받아야 합니다.
//    @Setter(onMethod_ = { @Autowired })
//    private WebApplicationContext ctx;
//    
//    //테스트 객체를 담을 필드
//    private MockMvc mockMvc;
//    
//    //테스트 전에 테스트 객체를 생성하여 테스트 환경 설정
//    @Before
//    public void setup() {
//        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
//    }
//테스트 환경 구성-끝

//    //댓글 목록 조회 테스트: GET /mycomments/{bno}/pages/{page}
//    @Test
//    public void testShowCmtList() throws Exception {
//    
//        int resultStatus =
//                mockMvc.perform(get("/mycomments/262143/pages/1")
//                                //서버가 보낸 것이 JSON 일 때만 처리(컨트롤러의 produces 에 대응)
//                                .accept("application/json; charset=UTF-8")
//                                //요청에 대한 문자 인코딩을 UTF-8로 지정
//                                .characterEncoding("utf-8"))
//                       .andDo(print())// 콘솔 출력
//                       .andReturn()
//                       .getResponse()
//                       .getStatus();
//        log.info("웹브라우저에 전달되는 ResponseEntiry 객체의 처리 상태 코드(resultStatus): " + resultStatus );
//    }
//    
//    //댓글 등록(cno 반환): POST /mycomments/{bno}/new
//    //JSON 형식 입력 테스트
//    @Test
//    public void testRegisterCmt() throws Exception {
//        //MyCommentVO 객체 생성
//        MyCommentVO myComment = new MyCommentVO();
//        
//        //myComment에 입력값 지정
//        myComment.setBno(262143L);
//        myComment.setCcontent("컨트롤러-게시물에 대한 댓글 등록 테스트: JSON입력테스트");
//        myComment.setCwriter("user4");
//        
//        //myComment를  JSON 스트링으로 변환
//        String myCommentJsonStr = new Gson().toJson(myComment);
//        
//        //JsonString 객체 콘솔출력
//        log.info("컨트롤러-게시물에 대한 댓글 등록 테스트: JSON-String 객체(myCommentJsonStr):"+myCommentJsonStr);
//        
//        //ResponseEntiry가 반환하는 상태값을 표시
//        int resultStatus
//            = mockMvc.perform(post("/mycomments/262143/new")
//                                  //서버가 보낸 것이 String 일 때만 처리(컨트롤러의 @*Mapping의 produces 속성에 대응)
//                             .accept("text/plain; charset=UTF-8")
//                             //서버로 보내는 것이 JSON 임을 header에 명시(컨트롤러의 @*Mapping의 consumes 속성에 대응)
//                             .contentType("application/json; charset=UTF-8")
//                             //요청에 대한 인코딩 설정
//                             .characterEncoding("utf-8")
//                             //요청-Body의 값(브라우저->서버)
//                             .content(myCommentJsonStr))//Set the request body as a UTF-8 String
//                     .andDo(print())//print()를 직접 static으로 import, 콘솔에 출력
//                     .andReturn()
//                     .getResponse()
//                     .getStatus();
//        log.info("웹브라우저에 전달되는 ResponseEntiry 객체의 처리 상태 코드(resultStatus): " + resultStatus);
//    }
//    
//    //답글 등록: (cno 반환): POST /mycomments/{bno}/{pcno}/new
//    @Test
//    public void testRegisterReply() throws Exception {
//        //replyVO 객체 생성
//        MyCommentVO myComment = new MyCommentVO();
//        
//        //replyVO에 입력값 지정
//        myComment.setBno(262143L);
//        myComment.setCcontent("컨트롤러-댓글에 대한 댓글 등록 테스트");
//        myComment.setCwriter("user11");
//        myComment.setPcno(10L);
//        
//        //myComment를  JSON 스트링으로 변환
//        String myCommentJsonStr = new Gson().toJson(myComment);
//        
//        //JsonString 객체 콘솔출력
//        log.info("컨트롤러-게시물에 대한 댓글 등록 테스트: JSON-String 객체(myCommentJsonStr):"+myCommentJsonStr);
//        
//        //ResponseEntiry가 반환하는 상태값을 표시
//        int resultStatus
//            = mockMvc.perform(post("/mycomments/262143/10/new")
//                             .accept("text/plain; charset=UTF-8")
//                             .contentType("application/json; charset=UTF-8")
//                             .characterEncoding("utf-8")
//                             .content(myCommentJsonStr))
//                     .andDo(print())
//                     .andReturn()
//                     .getResponse()
//                     .getStatus();
//        log.info("웹브라우저에 전달되는 ResponseEntiry 객체의 처리 상태 코드(resultStatus): " + resultStatus);
//    }
//	
//	
//    //댓글-답글 조회: GET /mycomments/{bno}/{cno}
//    @Test
//    public void testShowCmtReply() throws Exception{
//        int resultStatus =
//                mockMvc.perform(get("/mycomments/262143/1")
//                               .accept("application/json; charset=UTF-8")
//                               .characterEncoding("utf-8"))
//                       .andDo(print())
//                       .andReturn()
//                       .getResponse()
//                       .getStatus();
//        log.info("웹브라우저에 전달되는 ResponseEntiry 객체의 처리 상태 코드(resultStatus): " + resultStatus );
//    }
//	
//	
//    //댓글-답글 수정 테스트 : PUT /mycomments/{bno}/{cno}
//    @Test
//    public void testModifyCmtReply() throws Exception{
//    
//        MyCommentVO myComment = new MyCommentVO() ;
//        myComment.setCno(1L);
//        myComment.setCcontent("댓글-컨트롤러-수정테스트 - 댓글 수정(put)");
//        
//        //myComment를  JSON 스트링으로 변환
//        String myCommentJsonStr = new Gson().toJson(myComment);
//        System.out.println("JSON-String 객체로 변환Gson().toJson(myComment):" + myCommentJsonStr);
//        
//        int resultStatus =
//                mockMvc.perform(put("/mycomments/262143/1")
//                               .accept("text/plain; charset=UTF-8")
//                               .contentType("application/json; charset=UTF-8")
//                               .content(myCommentJsonStr))
//                       .andDo(print())
//                       .andReturn()
//                       .getResponse()
//                       .getStatus();
//        
//        log.info("웹브라우저에 전달되는 ResponseEntiry 객체의 처리 상태 코드(resultStatus): " + resultStatus);
//    }
//
//    //댓글-답글 삭제(cdelFlg를 1로 수정만함): PATCH /mycomments/{bno}/{cno}
//    @Test
//    public void testSetCmtReplyDeleted() throws Exception{
//    
//        MyCommentVO myComment = new MyCommentVO() ;
//        myComment.setBno(262143L);
//        myComment.setCno(4L);
//      
//        //myComment를  JSON 스트링으로 변환
//        String myCommentJsonStr = new Gson().toJson(myComment);
//        System.out.println("JSON-String 객체로 변환Gson().toJson(myComment):" + myCommentJsonStr);
//      
//        int resultStatus =
//                mockMvc.perform(patch("/mycomments/262143/4")
//                               .accept("text/plain; charset=UTF-8")
//                               .contentType("application/json; charset=UTF-8")
//                               .content(myCommentJsonStr))
//                       .andDo(print())
//                       .andReturn()
//                       .getResponse()
//                       .getStatus();
//      
//        log.info("웹브라우저에 전달되는 ResponseEntiry 객체의 처리 상태 코드(resultStatus): " + resultStatus);
//    }
//
//    //댓글-답글 삭제(실제 삭제): DELETE /mycomments/{bno}/{cno}
//    @Test
//    public void testRemovCmt() throws Exception{
//    
//        MyCommentVO myComment = new MyCommentVO() ;
//        myComment.setBno(262143L);
//        myComment.setCno(23L);
//        
//        String myCommentJsonStr = new Gson().toJson(myComment);
//        System.out.println("JSON-String 객체로 변환Gson().toJson(myComment):" + myCommentJsonStr);
//      
//        int resultStatus =
//                mockMvc.perform(delete("/mycomments/262143/23")
//                               .accept("text/plain; charset=UTF-8")
//                               .contentType("application/json; charset=UTF-8")
//                               .content(myCommentJsonStr))
//                       .andDo(print())
//                       .andReturn()
//                       .getResponse()
//                       .getStatus();
//      
//        log.info("웹브라우저에 전달되는 ResponseEntiry 객체의 처리 상태 코드(resultStatus): " + resultStatus);
//    }

}
