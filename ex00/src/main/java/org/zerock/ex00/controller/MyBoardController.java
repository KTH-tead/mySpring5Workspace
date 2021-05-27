package org.zerock.ex00.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.ex00.domain.MyBoardVO;
import org.zerock.ex00.service.MyBoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/myboard")
public class MyBoardController {

	@Setter(onMethod_ = @Autowired)
	private MyBoardService myBoardService;

// 게시물 조회 1
	@GetMapping("/list")
	public void showBoardList(Model model) {
		log.info("컨트롤러 - 게시물 조회 ....");
		model.addAttribute("boardList", myBoardService.getBoardList());
	}

//게시물 등록 - 페이지 호출
	@GetMapping("/register")
	public void showBoardRegisterPage() {
		log.info("컨트롤러 - 게시물 등록 페이지 호출");
	}

////게시물 등록 - 처리
	@PostMapping("/register")
	public String registerNewBoard(MyBoardVO myBoard, RedirectAttributes redirectAttr) {
		
		log.info("컨트롤러 - 게시물 등록:" + myBoard);
		
		long bno = myBoardService.registerBoard(myBoard);
		
		log.info("등록된 개시물의 bno: " + bno );
		
		redirectAttr.addFlashAttribute("result", bno);
		//addFlashAttribute -> 값 전달 후 사라짐,
		//addAttribute -> 값 전달 후에도 유지.

		return "redirect:/myboard/list";
	}


//게시물 조회-수정 페이지 호출
	@GetMapping({ "/detail","modify"})
	public void showBoardDetail(@RequestParam("bno") Long bno, Model model) {
		log.info("컨트롤러 - 게시물 조회/수정 페이지 호출:" + bno);
		model.addAttribute("board", myBoardService.getBoard(bno));
		log.info("컨트롤러 - 화면으로 전달함 model:" + model);
	}
	
////게시물 조회-수정 페이지 호출
	/*
	 * @GetMapping("/detail") public void showBoardDetail(@RequestParam("bno") Long
	 * bno, Model model) { log.info("컨트롤러 - 게시물 조회/수정 페이지 호출:" + bno);
	 * model.addAttribute("board", myBoardService.getBoard(bno));
	 * log.info("컨트롤러 - 화면으로 전달함 model:" + model); }
	 * 
	 * @GetMapping("modify") public void showBoardModify(@RequestParam("bno") Long
	 * bno, Model model) { log.info("컨트롤러 - 게시물 조회/수정 페이지 호출:" + bno);
	 * model.addAttribute("board", myBoardService.getBoard(bno));
	 * log.info("컨트롤러 - 화면으로 전달함 model:" + model); }
	 */
	
////게시물 수정 처리
	@PostMapping("/modify")
	//@PutMapping("/modify")
	public String modifyBoard(MyBoardVO myBoard, RedirectAttributes redirectAttr) {
		log.info("컨트롤러 - 게시물 수정 전달된 myBoard 값:" + myBoard);
		
		
		if(myBoardService.modifyBoard(myBoard)) {
			redirectAttr.addFlashAttribute("result","success");
		}
		
		
		redirectAttr.addAttribute("bno", myBoard.getBno());
		
		log.info("컨트롤러 - 게시물 수정 처리결과(Boolean):" + myBoardService.modifyBoard(myBoard));

		return "redirect:/myboard/detail";
	}
	
////게시물 삭제 - By 사용자 : 실제 삭제는 안됨.
	@PostMapping("/delete")
	public String setBoardDeleted(@RequestParam("bno") Long bno, 
								  MyBoardVO myBoard,
								  RedirectAttributes redirectAttr) {
		log.info("컨트롤러 - 게시물 삭제(bdelFlag값 변경 글번호):" + bno);
		log.info("컨트롤러 - 게시물 삭제(전달된 MyBoardVO): " +myBoard);
		
		if (myBoardService.setBoardDeleted(myBoard.getBno())) {
			redirectAttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/myboard/list";
	}
	

//게시물 삭제 - 특정게시물 삭제 by 관리자 : 실제 삭제 발생
	@PostMapping("/remove")
	public String removeBoard(@RequestParam("bno") Long bno,
								RedirectAttributes redirectAttr) {
		log.info("컨트롤러 - 게시물 삭제= 삭제되는 글 번호 :" + bno);
		if (myBoardService.removeBoard(bno)) {
			
			redirectAttr.addFlashAttribute("result", "success");
		
		}
		return "redirect:/myboard/list";
	}
	
	

//게시물 삭제 - 삭제 설정된 모든 게시물 삭제 - BY 관리자 : 실제 삭제 발생
	@PostMapping("removeAll")
	public String removeAllDeletedBoard(RedirectAttributes redirectAttr) {
		//삭제된 행수를 removeRowCnt 이름으로 반환
		redirectAttr.addFlashAttribute("removeRowCnt", myBoardService.removeAllDeletedBoard());
		log.info("관리자에 의해 삭제된 총 행수:" + redirectAttr.getAttribute("removeRowCnt"));
		
		return "redirect:/myboard/list";
	}

}
