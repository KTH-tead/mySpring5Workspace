package org.zerock.ex00.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.ex00.common.paging.MyBoardPagingCreatorDTO;
import org.zerock.ex00.common.paging.MyBoardPagingDTO;
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
//	@GetMapping("/list")
//	public void showBoardList(Model model) {
//		log.info("컨트롤러 - 게시물 조회 ....");
//		model.addAttribute("boardList", myBoardService.getBoardList());
//	}

	// 게시물 목록 조회 2 - 페이징 고려
	// @Override
//	@GetMapping("/list")
//	public void showBoardList(MyBoardPagingDTO myBoardPagingDTO, Model model) {
//	log.info("컨트롤러 - 게시물 목록 조회 시작.....");
//	log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + myBoardPagingDTO);
//	model.addAttribute("boardList", myBoardService.getBoardList(myBoardPagingDTO));
//	log.info("컨트롤러 - 게시물 목록 조회 완료.....");
//	}

	// 게시물 목록 조회 2 - 페이징 고려
	//@Override
	@GetMapping("/list")
	public void showBoardList(MyBoardPagingDTO myBoardPagingDTO, Model model) {
		log.info("컨트롤러 - 게시물 목록 조회 시작.....");
		log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + myBoardPagingDTO);
		model.addAttribute("boardList", myBoardService.getBoardList(myBoardPagingDTO));
		
		Long rowAmountTotal = myBoardService.getRowAmountTotal(myBoardPagingDTO);
		log.info("컨트롤러에 전달된 게시물 총 개수: " + rowAmountTotal);
		
		MyBoardPagingCreatorDTO myBoardCreaingPagingDTO = new MyBoardPagingCreatorDTO(rowAmountTotal, myBoardPagingDTO);
		log.info("컨트롤러에서 생성된 MyBoardCreaingPagingDTO 객체 정보: " + myBoardCreaingPagingDTO.toString());
		
		model.addAttribute("pagingCreator", myBoardCreaingPagingDTO);
		// model.addAttribute("myBoardCreatingPagingDTO", new
		// MyBoardCreaingPagingDTO(rowAmountTotal,myBoardPagingDTO));
		
		log.info("컨트롤러 - 게시물 목록 조회 완료.....");
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

		log.info("등록된 개시물의 bno: " + bno);

		redirectAttr.addFlashAttribute("result", bno);
		// addFlashAttribute -> 값 전달 후 사라짐,
		// addAttribute -> 값 전달 후에도 유지.

		return "redirect:/myboard/list";
	}

//게시물 조회-수정 페이지 호출
	@GetMapping({ "/detail", "modify" })
	public void showBoardDetail(@RequestParam("bno") Long bno, 
			@ModelAttribute("myBoardPagingDTO") MyBoardPagingDTO myBoardPagingDTO,
			Model model) {
		log.info("컨트롤러 - 게시물 조회/수정 페이지 호출:" + bno);
		log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
		model.addAttribute("board", myBoardService.getBoard(bno));
		log.info("컨트롤러 - 화면으로 전달함 model:" + model);
	}


////게시물 수정 처리
	@PostMapping("/modify")
	// @PutMapping("/modify")
	public String modifyBoard(MyBoardVO myBoard, MyBoardPagingDTO myBoardPagingDTO, //전달된 페이징 값들을 받음.
			RedirectAttributes redirectAttr) { //전달할 페이징 값을 저장하는 객체.
		log.info("컨트롤러 - 게시물 수정 전달된 myBoard 값:" + myBoard);
		log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);

		if (myBoardService.modifyBoard(myBoard)) {
			redirectAttr.addFlashAttribute("result", "successModify");
		}

		redirectAttr.addAttribute("bno", myBoard.getBno());
		redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());

		log.info("컨트롤러 - 게시물 수정 처리결과(Boolean):" + myBoardService.modifyBoard(myBoard));

		return "redirect:/myboard/detail";
	}

////게시물 삭제 - By 사용자 : 실제 삭제는 안됨.
	@PostMapping("/delete")
	public String setBoardDeleted(@RequestParam("bno") Long bno, 
			//MyBoardVO myBoard,
			MyBoardPagingDTO myBoardPagingDTO,//전달된 페이징 값들을 받음
			RedirectAttributes redirectAttr) {//전달할 페이징 값을 저장하는 객체
		log.info("컨트롤러 - 게시물 삭제(bdelFlag값 변경 글번호):" + bno);
		log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
		//log.info("컨트롤러 - 게시물 삭제(전달된 MyBoardVO): " + myBoard);

//		if (myBoardService.setBoardDeleted(myBoard.getBno())) {
//			redirectAttr.addFlashAttribute("result", "successRemove");
//		}
		if (myBoardService.setBoardDeleted(bno)) {
			redirectAttr.addFlashAttribute("result", "success");
			}
		
		redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());
		
		return "redirect:/myboard/list";
	}

//게시물 삭제 - 특정게시물 삭제 by 관리자 : 실제 삭제 발생
	@PostMapping("/remove")
	public String removeBoard(@RequestParam("bno") Long bno,
			MyBoardPagingDTO myBoardPagingDTO, //전달된 페이징 값들을 받음
			RedirectAttributes redirectAttr) {//전달할 페이징 값을 저장하는 객체
		
		log.info("컨트롤러 - 게시물 삭제= 삭제되는 글 번호 :" + bno);
		log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
		
		
		if (myBoardService.removeBoard(bno)) {

			redirectAttr.addFlashAttribute("result", "success");

		}
		
		redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());
		
		return "redirect:/myboard/list";
	}

//게시물 삭제 - 삭제 설정된 모든 게시물 삭제 - BY 관리자 : 실제 삭제 발생
	@PostMapping("removeAll")
	public String removeAllDeletedBoard(MyBoardPagingDTO myBoardPagingDTO,//전달된 페이징 값들을 받음
			RedirectAttributes redirectAttr) {//전달할 페이징 값을 저장하는 객체
		
		log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
		
		// 삭제된 행수를 removeRowCnt 이름으로 반환
		redirectAttr.addFlashAttribute("removeRowCnt", myBoardService.removeAllDeletedBoard());
		
		log.info("관리자에 의해 삭제된 총 행수:" + redirectAttr.getAttribute("removeRowCnt"));
		
		redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());

		return "redirect:/myboard/list";
	}

}
