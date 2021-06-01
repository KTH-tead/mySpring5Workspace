package com.spring5213.mypro00j.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring5213.mypro00j.common.paging.MyCmtPagingCreatorDTO;
import com.spring5213.mypro00j.common.paging.MyCmtPagingDTO;
import com.spring5213.mypro00j.domain.MyCommentVO;
import com.spring5213.mypro00j.mapper.MyBoardMapper;
import com.spring5213.mypro00j.mapper.MyCommentMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
//@AllArgsConstructor
public class MyCommentServiceImpl implements MyCommentService {

    //자동주입 방법1: 생성자 자동 주입 방식으로 주입 시	
    private MyCommentMapper myCommentMapper;

    private MyBoardMapper myBoardMapper;

    public MyCommentServiceImpl(MyCommentMapper myCommentMapper, MyBoardMapper myBoardMapper ) {
        this.myCommentMapper = myCommentMapper;
        this.myBoardMapper = myBoardMapper;
    }

////자동주입 방법2: @Autowired를 이용한 자동 주입(setter 자동 주입과 동일)
////  @Autowired
////  private MyCommentMapper myCommentMapper;
////
////자동주입 방법3: setter를 이용한 자동 주입//lombok 어노테이션 이용
////  @Setter(onMethod_ = @Autowired)
////  private MyCommentMapper myCommentMapper;
////
////
////  private MyCommentMapper myCommentMapper;
////
////  @Autowired
////  public void setMyCommentMapper(MyCommentMapper myCommentMapper;) {
////      this.myCommentMapper = myCommentMapper;
////  }

    
    
//    댓글 목록 조회(by bno, 페이징1 - 전체 댓글 수 고려 않할 때)
//    @Override
//    public List<MyCommentVO> getCmtList(MyCmtPagingDTO myCmtPaging);{
//
//        log.info("댓글-서비스-게시물에 대한 댓글 목록 조회 - 전달된 MyCmtPagingDTO: " + myCmtPaging);
//
//        return myCommentMapper.selectMyCmtList(myCmtPaging);
//    }

    //특정 게시물에 대한 댓글 목록 조회(페이징2-전체댓글 수 고려)
    @Override
    public MyCmtPagingCreatorDTO getCmtList(MyCmtPagingDTO myCmtPaging) {
    	
    	log.info("댓글-서비스-게시물에 대한 댓글 목록 조회 - 전달된 MyCmtPagingDTO: " + myCmtPaging);
    	
    	int cmtTotalByBno = myCommentMapper.selectCmtTotalByBno(myCmtPaging);
    	
    	Integer pageNum = myCmtPaging.getPageNum();
    	
    	if (cmtTotalByBno == 0) {
    		pageNum = 1 ;
    		myCmtPaging.setPageNum(pageNum);
    		log.info("댓글-서비스- 댓글이 없는 경우,  pageNum은 1: 수정된 MyCmtPagingDTO: " + myCmtPaging);
    		
    		MyCmtPagingCreatorDTO myCmtPagingCreator = new MyCmtPagingCreatorDTO(cmtTotalByBno, myCmtPaging, null);
    		return myCmtPagingCreator ;
    		
    	} else {
    		if(pageNum == -1){
        		pageNum = (int) Math.ceil(cmtTotalByBno/(myCmtPaging.getRowAmountPerPage()*1.0));
        		myCmtPaging.setPageNum(pageNum);
                log.info("댓글-서비스-댓글추가 후, pageNum -1을 마자막 페이지로 수정된 MyCmtPagingDTO: " + myCmtPaging);
    		}
    	}

    	MyCmtPagingCreatorDTO myCmtPagingCreator = 
            new MyCmtPagingCreatorDTO(cmtTotalByBno,
                                      myCmtPaging,
                                      myCommentMapper.selectMyCmtList(myCmtPaging));
        log.info("댓글-서비스-게시물에 대한 댓글 목록 조회 - 생성된 myCmtPagingCreatorDTO: " + myCmtPagingCreator);
        log.info("댓글-서비스-게시물에 대한 댓글 목록 조회 - myCmtPagingCreator가 컨트롤러로 전달됨");

        return myCmtPagingCreator;
    }
	

    //댓글 총 개수 조회(by bno, 페이징)
    @Override
    public int getCmtTotalCntByBno(MyCmtPagingDTO myCmtPaging) {
        return myCommentMapper.selectCmtTotalByBno(myCmtPaging);
    }

    //댓글 등록: cno 반환
    @Transactional
    @Override
    public long registerCmt(MyCommentVO myComment) {

        log.info("댓글-서비스-게시물에 대한 댓글 등록 시 처음 전달된 myCommentVO: " + myComment);
        //게시물 댓글 수 증가
        myBoardMapper.updateBcommentCnt(myComment.getBno(), 1);

        //게시물에 대한 댓글 등록 처리
        myCommentMapper.insertMyCmt(myComment);
        log.info("댓글-서비스 - 댓글 등록: 등록된 myComment: " + myComment);
        log.info("댓글-서비스 - 댓글 등록: 등록된 cno(byGetter): " + myComment.getCno());
        log.info("댓글-서비스 - 댓글 등록: 등록된 cno가 컨트롤러로 전달됨 ");

        return myComment.getCno();
    }

    //답글 등록: cno 반환
    @Transactional
    @Override
    public long registerReply(MyCommentVO myComment) {

        log.info("댓글-서비스-답글 등록 시 myCommentVO: " + myComment);

        //게시물 댓글 수 증가: 댓글의 답글도 게시물의 댓글로 포함
        myBoardMapper.updateBcommentCnt(myComment.getBno(), 1);

        //답글 등록 처리
        myCommentMapper.insertMyReply(myComment);

        log.info("댓글-서비스 - 답글 등록: 등록된 myComment: " + myComment);
        log.info("댓글-서비스 - 답글 등록: 등록된 cno(ByGetter): " + myComment.getCno());
        log.info("댓글-서비스 - 답글 등록: 등록된 cno가 컨트롤러로 전달됨 ");

        return myComment.getCno();
    }

    //댓글-답글 조회
    @Override
    public MyCommentVO getCmtReply(long bno, long cno) {

        log.info("댓글-서비스-댓글/답글 조회: 전달된 bno: " + bno);
        log.info("댓글-서비스-댓글/답글 조회: 전달된 cno: " + cno);

        MyCommentVO myComment = myCommentMapper.selectMyCmtReply(bno, cno);
        log.info("댓글-서비스-댓글/답글 조회: 매퍼로부터 전달된 myComment: " + myComment);
        log.info("댓글-서비스-댓글/답글 조회: myComment가 컨트롤러로 전달됨");
        return myComment;
    }

    //댓글-답글 수정: 수정된 행 수인 1 반환
    @Override
    public int modifyCmtReply(MyCommentVO myComment) {

        log.info("댓글-서비스-댓글-수정시 전달된 myCommentVO: " + myComment);
        Integer modCnt = myCommentMapper.updateMyCmtReply(myComment);
        log.info("댓글-서비스-수정된 댓글 개수: " + modCnt);

        return modCnt;
        //return myCommentMapper.updateMyCmtReply(myComment);
    }
    
    //댓글-답글 삭제: cdelFlg = 1 로 수정(수정된 행수인 1 반환)
    @Transactional
    @Override
    public int setCmtReplyDeleted(long bno, long cno) {

        log.info("댓글-서비스-댓글-삭제 시 전달된 bno: " + bno);
        log.info("댓글-서비스-댓글-삭제 시 전달된 cno: " + cno);

        //댓글 삭제: 게시물의 댓글 개수 감소
        myBoardMapper.updateBcommentCnt(bno,  -1);
        return myCommentMapper.updateCdelFlg(bno, cno);
    }

    //댓글-답글 삭제(실제 삭제): 삭제된 행수 1 반환
    //삭제요청--> 삭제인 경우, 갯수감소 없음
    //삭제요청 없이, 사용자가 실제 삭제인 경우, 갯수 감소 시킴(기준) 
    @Transactional
    @Override
    public int removeCmtReply(long bno, long cno) {

        log.info("댓글-서비스-댓글-실제삭제 시 전달된 bno: " + bno);
        log.info("댓글-서비스-댓글-실제삭제 시 전달된 cno: " + cno);

        //댓글 삭제: 게시물의 댓글 개수 감소(사용자에 의한 삭제)
        myBoardMapper.updateBcommentCnt(bno,  -1);
        return myCommentMapper.deleteMyCmtReply(bno, cno);
    }

}
