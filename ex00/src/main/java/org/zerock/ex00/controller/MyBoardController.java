package org.zerock.ex00.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.ex00.common.paging.MyBoardPagingCreatorDTO;
import org.zerock.ex00.common.paging.MyBoardPagingDTO;
import org.zerock.ex00.domain.MyBoardAttachFileVO;
import org.zerock.ex00.domain.MyBoardVO;
import org.zerock.ex00.service.MyBoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j //롬복 어노테이션
@RequestMapping("/myboard")
public class MyBoardController {

	//롬복 사용해서 빈 주입
	@Setter(onMethod_ = @Autowired)
	private MyBoardService myBoardService;
	
	//게시물 목록 조회
//	@GetMapping("/list")
//	public void showBoardList(Model model) {
//		log.info("컨트롤러 - 게시물 목록 조회...");
//		model.addAttribute("boardList", myBoardService.getBoardList());
//	}

	//게시물 목록 조회2 - 페이징 고려
	@GetMapping("/list")
	public void showBoardList(Model model, MyBoardPagingDTO myBoardPagingDTO) {
		log.info("컨트롤러 - 게시물 목록 조회...");
		log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + myBoardPagingDTO);
		model.addAttribute("boardList", myBoardService.getBoardList(myBoardPagingDTO));
		
		Long rowAmountTotal = myBoardService.getRowAmountTotal(myBoardPagingDTO);
		log.info("컨트롤러에 전달된 게시물 총 개수: " + rowAmountTotal);
		
		MyBoardPagingCreatorDTO myBoardPagingCreatorDTO =
		new MyBoardPagingCreatorDTO(rowAmountTotal, myBoardPagingDTO);
		
		log.info("컨트롤러에서 생성된 MyBoardCreaingPagingDTO 객체 정보: " + myBoardPagingCreatorDTO.toString());
		model.addAttribute("pagingCreator", myBoardPagingCreatorDTO );
		
		//model.addAttribute("myBoardCreatingPagingDTO", new MyBoardCreaingPagingDTO(rowAmountTotal,myBoardPagingDTO));
		
		log.info("컨트롤러 - 게시물 목록 (페이징 고려) 조회 완료.....");
	}
	
	//게시물 등록 - 페이지 호출
	@GetMapping("/register")
	public void showBoardRegisterPage() {
		log.info("컨트롤러 - 게시물 등록 페이지 호출");
	}
	
	//게시물 등록 - 처리
	@PostMapping("/register")
	public String registerNewBoard(MyBoardVO myBoard, RedirectAttributes redirectAttr) {
		log.info("컨트롤러 : 게시물등록(전달된vo 내용):" +myBoard.toString());
		
		System.out.println("===== attachFileInfo======");
		if (myBoard.getAttachFileList() !=null) {
			myBoard.getAttachFileList().forEach(attachFile -> System.out.println("첨부파일 정보:" + attachFile.toString()));
		}
		
		System.out.println("==============");
		
		log.info("컨트롤러 - 게시물 등록 : " + myBoard);
		
		long bno = myBoardService.registerBoard(myBoard);
		log.info("등록된 게시물의 bno : " + bno);
		
		//redirectAttr.addFlashAttribute("result", myBoard.getBno());
		redirectAttr.addFlashAttribute("result", bno);
		
		return "redirect:/myboard/list";
	}
	
	//게시물 조회 - 수정 페이지 호출
//	@GetMapping({"/detail", "/modify"})
//	public void showBoardDetail(@RequestParam("bno") Long bno, Model model) {
//		log.info("컨트롤러 - 게시물 조회/수정 페이지 호출 : " + bno);
//		model.addAttribute("board", myBoardService.getBoard(bno));
//		log.info("컨토롤러 - 화면으로 전달할 model : " + model);
//	}

	//게시물 조회 페이지 호출
	@GetMapping("/detail")
	public void showBoardDetail(@RequestParam("bno") Long bno, 
								@ModelAttribute("myBoardPagingDTO") MyBoardPagingDTO myBoardPagingDTO,
								Model model) {
		log.info("컨트롤러 - 게시물 조회/수정 페이지 호출 : " + bno);
		log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
		model.addAttribute("board", myBoardService.getBoard(bno));
		log.info("컨토롤러 - 화면으로 전달할 model : " + model);
	}
	
	//게시물 수정 페이지 호출
	@GetMapping("/modify")
	public void showBoardModify(@RequestParam("bno") Long bno, 
								@ModelAttribute("myBoardPagingDTO") MyBoardPagingDTO myBoardPagingDTO,
								Model model) {
		log.info("컨트롤러 - 게시물 조회/수정 페이지 호출 : " + bno);
		log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
		model.addAttribute("board", myBoardService.getBoard(bno));
		log.info("컨토롤러 - 화면으로 전달할 model : " + model);
	}
	
	//게시물 수정 처리
	@PostMapping("/modify")
	public String modifyBoard(MyBoardVO myBoard, 
							  MyBoardPagingDTO myBoardPagingDTO, 
							  RedirectAttributes redirectAttr) {
		log.info("컨트롤러 - 게시물 수정 전달된 myBoard 값" + myBoard);
		log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
		
		if(myBoardService.modifyBoard(myBoard)) {
			redirectAttr.addFlashAttribute("result", "successModify");
		}
		
		redirectAttr.addAttribute("bno", myBoard.getBno());
		redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());
		redirectAttr.addAttribute("scope", myBoardPagingDTO.getScope());
		redirectAttr.addAttribute("keyword", myBoardPagingDTO.getKeyword());
		
		//return "redirect:/myboard/detail?bno=" + myBoard.getBno();
		return "redirect:/myboard/detail";
	}
	
	//게시물 삭제 - 실제 삭제는 아님
	@PostMapping("/delete")
	public String setBoardDeleted(@RequestParam("bno") Long bno, 
								  MyBoardPagingDTO myBoardPagingDTO,
								  RedirectAttributes redirectAttr) {
		log.info("컨트롤러 - 게시물 삭제(bdelFlag 값 변경 글 번호) : " + bno);
		log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
		
		if(myBoardService.setBoardDeleted(bno)) {
			redirectAttr.addFlashAttribute("result", "successRemove");
		}
		
//		redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
//		redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());
//		redirectAttr.addAttribute("scope", myBoardPagingDTO.getScope());
//		redirectAttr.addAttribute("keyword", myBoardPagingDTO.getKeyword());
		
		return "redirect:/myboard/list"+ myBoardPagingDTO.addPagingParamsToURI();
	}
	
	//게시물 삭제 - 특정 게시물 삭제 : 실제 삭제 발생
	@PostMapping("/remove")
	public String removeBoard(@RequestParam("bno") Long bno,
							  MyBoardPagingDTO myBoardPagingDTO,
							  RedirectAttributes redirectAttr) {
		log.info("컨트롤러 - 게시물 삭제 : 삭제되는 글 번호 : " + bno);
		log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
		
		if(myBoardService.removeBoard(bno) ) {
			redirectAttr.addFlashAttribute("result", "successRemove");
		}
		
		redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());
		redirectAttr.addAttribute("scope", myBoardPagingDTO.getScope());
		redirectAttr.addAttribute("keyword", myBoardPagingDTO.getKeyword());
		
		return "redirect:/myboard/list";
	}
	
	//게시물 삭제 - 삭제 설정된 모든 게시물 삭제 - By 관리자 : 실제 삭제 발생
	@PostMapping("/removeAll")
	public String removeAllDeletedBoard(MyBoardPagingDTO myBoardPagingDTO,//전달된 페이징 값들을 받음
										RedirectAttributes redirectAttr) {//전달할 페이징 값을 저장하는 객체
		log.info("컨트롤러 - 전달된 MyBoardPagingDTO: "+ myBoardPagingDTO);
		
		//삭제된 행수를 removedRowCnt 이름으로 반환
		redirectAttr.addFlashAttribute("removedRowCnt", myBoardService.removeAllDeletedBoard());
		
		log.info("관리자에 의해 삭제된 총 행수: " + redirectAttr.getAttribute("removedRowCnt"));
		
		redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());
		redirectAttr.addAttribute("scope", myBoardPagingDTO.getScope());
		redirectAttr.addAttribute("keyword", myBoardPagingDTO.getKeyword());
	
		return "redirect:/myboard/list";
	}
	
	//특정 게시물의 첨부파일 정보를 JSON으로 전달 
	
	@GetMapping(value = "/getFiles", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public ResponseEntity<List<MyBoardAttachFileVO>> showAttachFiles(Long bno){
		System.out.println("컨트롤러: 조회할 첨부파일의 게시물 번호(bno) :" +bno);
		
		return new ResponseEntity<List<MyBoardAttachFileVO>>(myBoardService.getAttachFilesByBno(bno), HttpStatus.OK);
	}
	
	
}