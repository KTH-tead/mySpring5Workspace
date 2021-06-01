package com.spring5213.mypro00j.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring5213.mypro00j.common.paging.MyBoardPagingCreatorDTO;
import com.spring5213.mypro00j.common.paging.MyBoardPagingDTO;
import com.spring5213.mypro00j.domain.MyBoardVO;
import com.spring5213.mypro00j.service.MyBoardService;

//import com.spring5213.mypro00j.common.paging.MyBoardPagingCreatorDTO;
//import com.spring5213.mypro00j.common.paging.MyBoardPagingDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/myboard")
public class MyBoardController {
	
    @Setter(onMethod_ = @Autowired)
    private MyBoardService myBoardService;

//빈 주입 방법1: 생성자 주입방법(권장), 단일 생성자만 존재해야 함.
//주의: 기본 생성자가 존재 시에 오류 발생
//        private MyBoardService myBoardService;

//        public MyBoardController(MyBoardService myBoardService) {
//            this.myBoardService = myBoardService;
//        }
			
//빈 주입 방법2: @Autowired(내부적으로 setter를 이용)
//        @Autowired
//        private MyBoardService myBoardService;
			
//빈 주입 방법3: setter 주입방법: lombok에서의 @Setter(onMethod_ = @Autowired) 이용하는 방법과 동일
//        private MyBoardService myBoardService;
//
//        @Autowired
//        public void setMyBoardService(MyBoardService myBoardService) {
//            this.myBoardService = myBoardService;
//        }
		

//    //게시물 목록 조회 1 
//    @GetMapping("/myBoardList")
//    public void showBoardList(Model model) {
//        log.info("컨트롤러 - 게시물 목록 조회.....");
//        model.addAttribute("boardList", myBoardService.getBoardList());
//    }

	
    //게시물 목록 조회 2 - 페이징 고려 
    @GetMapping("/myBoardList")
    public void showBoardList(MyBoardPagingDTO myBoardPagingDTO, Model model) {
        log.info("컨트롤러 - 게시물 목록 조회 시작.....");
        log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + myBoardPagingDTO);
        model.addAttribute("boardList", myBoardService.getBoardList(myBoardPagingDTO));
		
        Long rowAmountTotal = myBoardService.getRowAmountTotal(myBoardPagingDTO);
        log.info("컨트롤러에 전달된 게시물 총 개수: " + rowAmountTotal);
		
        MyBoardPagingCreatorDTO myBoardPagingCreatorDTO  =
        	    new MyBoardPagingCreatorDTO(rowAmountTotal, myBoardPagingDTO);
        
        log.info("컨트롤러에서 생성된  MyBoardCreaingPagingDTO 객체 정보: " + myBoardPagingCreatorDTO.toString());
        model.addAttribute("pagingCreator", myBoardPagingCreatorDTO );
        
        //model.addAttribute("pagingCreator",new MyBoardPagingCreatorDTO(rowAmountTotal, myBoardPagingDTO) );
        log.info("컨트롤러 - 게시물 목록 조회 완료.....");
    }

    //게시물 등록 - 페이지 호출
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/myBoardRegister")
    public void showBoardRegisterPage() {
        log.info("컨트롤러 - 게시물 등록 페이지 호출");
    }


    //게시물 등록 - 처리
    @PreAuthorize("isAuthenticated()")
    @PostMapping("/myBoardRegister")
    public String registerNewBoard(MyBoardVO myBoard, RedirectAttributes redirectAttr) {

        log.info("컨트롤러 - 게시물 등록: " + myBoard);

        long bno = myBoardService.registerBoard(myBoard);
	
        log.info("등록된 개시물의 bno: " + bno );

        //redirectAttr.addFlashAttribute("result", myBoard.getBno());
        redirectAttr.addFlashAttribute("result", bno);

        return "redirect:/myboard/myBoardList";
    }

  
    //게시물 조회 페이지 호출: 목록페이지에서 호출
    @GetMapping({"/myBoardDetail"})
    public void showBoardDetail(@RequestParam("bno") Long bno,
                                @ModelAttribute("myBoardPagingDTO") MyBoardPagingDTO myBoardPagingDTO,
                                //MyBoardPagingDTO myBoardPagingDTO,
                                Model model) {
        log.info("컨트롤러 - 게시물 조회 페이지 호출: "+ bno);
        log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
        //model.addAttribute("myBoardPagingDTO", myBoardPagingDTO);
        model.addAttribute("board", myBoardService.getBoardDetail(bno));
        log.info("컨트롤러 - 화면으로 전달할 model: "+ model);
    }

    
    //게시물 수정 페이지 호출: 게시물 조회페이지에서 호출
    @GetMapping({"/myBoardModify"})
    public void showBoardModify(@RequestParam("bno") Long bno,
                                //@ModelAttribute("myBoardPagingDTO") MyBoardPagingDTO myBoardPagingDTO,
                                MyBoardPagingDTO myBoardPagingDTO,
                                Model model) {
        log.info("컨트롤러 - 게시물 수정 페이지 호출: "+ bno);
        log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
        model.addAttribute("myBoardPagingDTO", myBoardPagingDTO);
        model.addAttribute("board", myBoardService.getBoardModify(bno));
        log.info("컨트롤러 - 화면으로 전달할 model: "+ model);
    }
    
    //게시물 수정 처리
    //리다이렉트를 하지 않으므로 RedirectAttributes를 사용하지 않음
    @PreAuthorize("isAuthenticated() && principal.username == #myBoard.bwriter")
    @PostMapping("/myBoardModify")
    public String modifyBoard(MyBoardVO myBoard,
                              @ModelAttribute("myBoardPagingDTO") MyBoardPagingDTO myBoardPagingDTO,//전달된 페이징 값들을 받음
                              Model model ) {
        log.info("컨트롤러 - 게시물 수정 전달된 myBoard 값: " + myBoard);
        log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);

        if (myBoardService.modifyBoard(myBoard)) {
        	//수정 후, 게시물 상세 페이지에 표시를 위해 수정된 게시물 조회 
        	model.addAttribute("board", myBoardService.getBoardModify(myBoard.getBno()));
        	model.addAttribute("result", "success");
        	log.info("컨트롤러 - 화면으로 전달할 model: "+ model);
        }

        return "myboard/myBoardDetail";
    }
    
    
//    //게시물 삭제(By 사용자): 실제 삭제는 안됨
//    //@PreAuthorize("isAuthenticated() && principal.username == #myBoard.bwriter")
//    @PostMapping("/myBoardDelete")
//    public String (//@RequestParam("bno") Long bno,  
//                                  MyBoardVO myBoard, 
//                                  MyBoardPagingDTO myBoardPagingDTO,//전달된 페이징 값들을 받음
//                                  RedirectAttributes redirectAttr ){//전달할 페이징 값을 저장하는 객체
//        //log.info("컨트롤러 - 게시물 삭제(bdelFlag값변경 글번호): " + bno);
//        log.info("컨트롤러 - 게시물 삭제(전달된 MyBoardVO): " + myBoard);
//        log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
//        //myBoardService.setBoardDeleted(bno);
//        //return "redirect:/myboard/myBoardList";
//
//        if (myBoardService.setBoardDeleted(myBoard.getBno())) {
//            redirectAttr.addFlashAttribute("result", "success");
//        }
//        
//        redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
//        redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());
//        redirectAttr.addAttribute("scope", myBoardPagingDTO.getScope());
//        redirectAttr.addAttribute("keyword", myBoardPagingDTO.getKeyword());
//        return "redirect:/myboard/myBoardList";
//        
//    }

    //게시물 삭제(By 사용자): 실제 삭제는 안됨
    @PreAuthorize("isAuthenticated() && principal.username == #myBoard.bwriter")
    @PostMapping("/myBoardDelete")
    public String setBoardDeleted(MyBoardVO myBoard, 
                                  MyBoardPagingDTO myBoardPagingDTO,//전달된 페이징 값들을 받음
                                  RedirectAttributes redirectAttr ){//전달할 페이징 값을 저장하는 객체

        if (myBoardService.setBoardDeleted(myBoard.getBno())) {
            redirectAttr.addFlashAttribute("result", "success");
        }
        
        return "redirect:/myboard/myBoardList" + myBoardPagingDTO.addPagingParamsToURI();
    }
    

    //게시물 삭제 - 특정 게시물 삭제 By 관리자: 실제 삭제 발생
    @PostMapping("/myBoardRemove")
    public String removeBoard(@RequestParam("bno") Long bno,
    		                  MyBoardPagingDTO myBoardPagingDTO,//전달된 페이징 값들을 받음
    		                  RedirectAttributes redirectAttr){ //전달할 페이징 값을 저장하는 객체
        log.info("컨트롤러 - 게시물 삭제: 삭제되는 글번호: " + bno);
        log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
        
        if (myBoardService.removeBoard(bno)) {
        	
            redirectAttr.addFlashAttribute("result", "success");
        }
        
        redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
        redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());
        redirectAttr.addAttribute("scope", myBoardPagingDTO.getScope());
        redirectAttr.addAttribute("keyword", myBoardPagingDTO.getKeyword());
        
        return "redirect:/myboard/myBoardList";
    }
	
    //게시물 삭제 - 삭제 설정된 모든 게시물 삭제  - By 관리자: 실제 삭제 발생
    @PostMapping("/myBoardRemoveAll")
    public String removeAllDeletedBoard(//Model model,
                                        MyBoardPagingDTO myBoardPagingDTO,//전달된 페이징 값들을 받음
                                        RedirectAttributes redirectAttr) {//전달할 페이징 값을 저장하는 객체
    	
        //model.addAttribute("removedRowCnt", myBoardService.removeAllDeletedBoard());
        //log.info("관리자에 의해 삭제된 총 행수: " + model.getAttribute("removedRowCnt"));
    	//redirectAttr.addFlashAttribute("result", "success");
        log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
        
        //삭제된 행수를 removedRowCnt 이름으로 반환
        redirectAttr.addFlashAttribute("removedRowCnt", myBoardService.removeAllDeletedBoard());
        log.info("관리자에 의해 삭제된 총 행수: " + redirectAttr.getAttribute("removedRowCnt"));
        
        redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
        redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());
        redirectAttr.addAttribute("scope", myBoardPagingDTO.getScope());
        redirectAttr.addAttribute("keyword", myBoardPagingDTO.getKeyword());
        return "redirect:/myboard/myBoardList";

    }
}
