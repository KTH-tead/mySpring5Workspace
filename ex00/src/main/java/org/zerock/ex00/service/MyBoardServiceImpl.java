package org.zerock.ex00.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.ex00.common.paging.MyBoardPagingDTO;
import org.zerock.ex00.domain.MyBoardAttachFileVO;
import org.zerock.ex00.domain.MyBoardVO;
import org.zerock.ex00.mapper.MyBoardAttachFileMapper;
import org.zerock.ex00.mapper.MyBoardMapper;
import org.zerock.ex00.mapperDAO.MyBoardDAO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MyBoardServiceImpl implements MyBoardService{

	//MyBoard 매퍼 인터페이스 주입: 생성자를 이용한 자동 주입
	private MyBoardMapper myBoardMapper;
	
	//DAO 빈 주입 : 생성자를 이용한 자동 주입
	private MyBoardDAO myBoardDAO;
	
	//MyBoardAttachFileMapper 매퍼 인터페이스 주입: 생성자를 이용한 자동 주입
	private MyBoardAttachFileMapper myBoardAttachFileMapper ;
	
	//게시물 목록 조회 서비스
//	@Override
//	public List<MyBoardVO> getBoardList() {
//		log.info("MyBoardService.getBoardList() 실행");
//		return myBoardMapper.selectMyBoardList();
//	}

	//게시물 목록 조회 서비스2 - 페이징/검색 고려
	@Override
	public List<MyBoardVO> getBoardList(MyBoardPagingDTO myBoardPagingDTO) {
		log.info("MyBoardService.getBoardList() 실행");
	
		//return myBoardMapper.selectMyBoardList(myBoardPagingDTO);
		return myBoardDAO.selectMyBoardList(myBoardPagingDTO);
	}
	
	//게시물 총 개수 조회 서비스 - 페이징 시 필요
	@Override
	public Long getRowAmountTotal(MyBoardPagingDTO myBoardPagingDTO) {
	log.info("MyBoardService.getRowAmountTotal()에 전달된 MyBoardPagingDTO: " + myBoardPagingDTO);
	//return myBoardMapper.selectRowAmountTotal(myBoardPagingDTO);
	return myBoardDAO.selectRowAmountTotal(myBoardPagingDTO);
	}
	
	//게시물 등록 - selectKey 이용
	@Transactional
	@Override
	public long registerBoard(MyBoardVO myBoard) {
		log.info("MyBoardService.registerBoard()에 전달된 MyBoardVO : " + myBoard);
		
//		myBoardMapper.insertMyBoardSelectKey(myBoard);
//		System.out.println("MyBoardService에 등록된 게시물의 bno : " + myBoard.getBno());
//		
//		return myBoard.getBno();
		myBoardDAO.insertMyBoardSelectKey(myBoard);
		System.out.println("MyBoardService에 등록된 게시물의 bno : " + myBoard.getBno());
		
		//첨부파일이 없는 경우, 메서드 종료
		if (myBoard.getAttachFileList() == null || myBoard.getAttachFileList().size() <=0) {
			return myBoard.getBno();
		}
		
		//첨부파일이 있는 경우, myBoard의 bno 값을 첨부파일 정보 VO에 저장 후, tbl_myAttachFiles 테이블에 입력
		myBoard.getAttachFileList().forEach(attachFile -> {
			attachFile.setBno(myBoard.getBno());
			myBoardAttachFileMapper.insertAttachFile(attachFile);
		});
		return myBoard.getBno();
	}
	
	//게시물 조회
	@Override
	public MyBoardVO getBoard(Long bno) {
		log.info("MyBoardService.getBoard()에 전달된 : " + bno);
		
		//조회수 증가 후 bno 게시물 데이터 반환
		myBoardMapper.updateBviewsCnt(bno);
		return myBoardMapper.selectMyBoard(bno);
	}
	
	//게시물 수정 처리
	@Transactional
	@Override
	public boolean modifyBoard(MyBoardVO myBoard) {
		log.info("서비스에서의 게시물 수정 메소드(modify) : " + myBoard);
		
		Long bno = myBoard.getBno();
		
		//게시물 변경 시, 기존 첨부파일을 모두 삭제되어 전달된 첨부파일 정보가 없는 경우도 있으므로
		//첨부파일 삭제는 무조건 처리합니다.
		myBoardAttachFileMapper.deleteAttachFilesByBno(bno);
		
		//게시물 수정: tbl_myboard 테이블에 수정
		boolean boardModifyResult = myBoardMapper.updateMyBoard(myBoard) == 1 ;
		log.info("boardModifyResult:" + boardModifyResult);
		log.info("myBoard.getAttachFileList().size():" + myBoard.getAttachFileList().size());
		//게시물 수정이 성공하고, 첨부파일이 있는 경우에만 다음작업 수행
		//첨부파일 정보 저장: tbl_myAttachFiles 테이블에 저장
		if (boardModifyResult && myBoard.getAttachFileList() != null) {
		myBoard.getAttachFileList().forEach(
		attachFile -> {
		attachFile.setBno(bno);
		myBoardAttachFileMapper.insertAttachFile(attachFile);
		});
		}
		return boardModifyResult;
		//게시물 정보 수정, 수정된 행수가 1이면 True
		//return myBoardMapper.updateMyBoard(myBoard) == 1;
	}
	
	//게시물 삭제 - 사용자(bdelFalg 컬럼만 1로 수정)
	@Override
	public boolean setBoardDeleted(Long bno) {
		log.info("MyBoardService.setBoardDeleted()에 전달된 bno : " + bno);
		return myBoardMapper.updateBdelFlag(bno) == 1;
	}
	
	//게시물 삭제 - 관리자 - 실제 삭제
	@Transactional
	@Override
	public boolean removeBoard(Long bno) {
		log.info("MyBoardService.removeBoard()에 전달된 bno : " + bno);
		//데이터베이스 첨부파일 정보 삭제
		//첨부파일이 없어도 SQL은 정상처리됨(0개 행이 삭제)
		//테이블의 외래키(FK)에 ON DELETE CASCADE 옵션이 사용된 경우,
		//첨부파일 정보 삭제는 데이터베이스에 의해 자동으로 처리되므로
		//아래의 실행문은 필요없습니다.
		myBoardAttachFileMapper.deleteAttachFilesByBno(bno);
		return myBoardMapper.deleteMyBoard(bno) == 1;
	}
	
	//게시물 삭제 - 괸리자, 사용자 삭제 요청된 게시물 전체 삭제
	@Override
	public int removeAllDeletedBoard() {
		log.info("MyBoardService.removeAllDeletedBoard() 실행");
		//삭제된 총 행수 반환
		return myBoardMapper.deleteAllBoardSetDeleted();
	}
	
	//게시물 첨부파일 조회
	@Override
	public List<MyBoardAttachFileVO> getAttachFilesByBno(Long bno) {
		System.out.println("MyBoardService.getAttachFilesByBno()에 전달된 bno:" +bno);
		return myBoardAttachFileMapper.selectAttachFilesByBno(bno);
	}
}
