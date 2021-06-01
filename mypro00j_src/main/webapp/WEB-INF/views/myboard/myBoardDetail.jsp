<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../myinclude/myheader.jsp" %>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header" style="white-space: nowrap;">Board - Detail: <c:out value="${board.bno}"/>번 게시물</h3>
        </div>
    </div>
<%-- 게시물 상세 표시 시작 --%>    
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-3" style="white-space: nowrap; height: 45px; padding-top:11px;">
                            <strong style="font-size:18px;">${board.bwriter}님 작성</strong>
                        </div>
                        <div class="col-md-3" style="white-space: nowrap; height: 45px; padding-top:16px;">
                            <span class="text-primary" style="font-size: smaller; height: 45px; padding-top: 19px;">
                                <span>
                                    <span>등록일:&nbsp;</span>
                                    <strong><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.bregDate}"/></strong>
                                    <span>&nbsp;&nbsp;</span>                                   
                                </span>
                                <span>조회수:&nbsp;<strong><c:out value="${board.bviewsCnt}"/></strong></span><%-- 
                                <span style="margin-bottom: 2px; display: none;">
                                    <strong>[수정일]<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.bmodDate}"/></strong>
                                </span> --%>
                            </span>
                        </div>
                        <div class="col-md-6" style="height: 45px; padding-top:6px;"><!-- vertical-align: middle; -->
                            <div class="button-group pull-right">
                            
                            
                            
                        <sec:authorize access="isAuthenticated()" >
                            <sec:authentication property="principal" var="principal"/>	  
                            <c:if test="${principal.username eq board.bwriter}">  
                                <button type="button" id="btnToModify" data-oper="modify" class="btn btn-primary"><span>수정</span></button>
                            </c:if>
                        </sec:authorize>
                                
                                
                                
                                <button type="button" id="btnToList" data-oper="list" class="btn btn-info"><span>목록</span></button>
                            </div>
                        </div>
                    </div>
                </div><!-- /.panel-heading -->
                
                <div class="panel-body form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-1 control-label" style="white-space: nowrap;">글제목</label>
                        <div class="col-sm-11">
                            <input class="form-control" value='<c:out value="${board.btitle}"/>' name="btitle" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label" style="white-space: nowrap;">글내용</label>
                        <%-- <textarea>와 </textarea>는 한 줄에 작성되어야 필요없는 공백이 포함되지 않음 --%>
                        <div class="col-sm-11">
                            <textarea class="form-control" rows="3" name="bcontent" style="resize: none;" 
                                      readonly="readonly"><c:out value="${board.bcontent}"/></textarea>
                        </div>
                    </div>
                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row -->


    <form id="frmSendValue"><!-- 폼을 추가 -->
        <input type='hidden' name='bno' id="bno" value='<c:out value="${board.bno}"/>'>
        <input type='hidden' name='pageNum' value='${myBoardPagingDTO.pageNum}'>
        <input type='hidden' name='rowAmountPerPage' value='${myBoardPagingDTO.rowAmountPerPage}'>
        <input type='hidden' name='scope' value='${myBoardPagingDTO.scope}'>
        <input type='hidden' name='keyword' value='${myBoardPagingDTO.keyword}'>
    </form>
<%-- 게시물 상세 표시 끝 --%>


<%-- 댓글 화면 표시 시작 --%>
<style>
.txtBoxCmt, .txtBoxComment {
    overflow: hidden; resize: vertical; min-height: 100px; color: black;
}
</style>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default" >
            <div class="panel-heading">
                <p style="margin-bottom: 0px; font-size: 16px;">
                    <strong style="padding-top: 2px;">
                        <span>댓글&nbsp;</span><span id="spanCmtCnt"><c:out value="${board.bcommentCnt}"/></span><span>개</span> 
                        <span>&nbsp;</span>
                        
                        
                    <sec:authorize access="isAuthenticated()" ><%-- 댓글 작성 버튼, 로그인 사용자일 때만 표시 --%>
                        <button type="button" id="btnChgCmtReg" class="btn btn-info btn-sm">댓글 작성</button>
                    </sec:authorize>
                        
                        
                        <button type="button" id="btnRegCmt" class="btn btn-warning btn-sm" style="display:none;">댓글 등록</button>
                        <button type="button" id="btnCancelRegCmt" class="btn btn-danger btn-sm" style="display:none;">취소</button>
                    </strong>
                </p>
            </div><!-- /.panel-heading -->
<!-- 권리침해, 욕설, 특정 대상을 비하하는 내용, 청소년에게 유해한 내용 등을 게시할 경우&#10;운영정책과 이용약관 및 관련 법률에 의해 제재될 수 있습니다.&#10;댓글 작성 시 상대방에 대한 배려와 책임을 담아 주세요.&#10;댓글작성을 원하시면,댓글 작성  버튼을 클릭해주세요. -->


            <div class="panel-body">
<!-- 댓글 입력창 시작 -->
            <sec:authorize access="isAuthenticated()" >
                <div class="form-group" style="margin-bottom: 5px;">
                    <textarea class="form-control" id="txtBoxCmt" name="ccontent"
                              placeholder="댓글 작성 시 상대방에 대한 배려와 책임을 담아 주세요.&#10;댓글작성을 원하시면,댓글 작성  버튼을 클릭해주세요."
                              readonly="readonly"
                        ></textarea>
                </div>
                <hr style="margin-top: 10px; margin-bottom: 10px;">
            </sec:authorize>
<!-- 댓글 입력창 끝 -->

<!-- 댓글 목록 표시 영역 시작 -->
                <ul class="chat">
                    <%-- 댓글 목록 표시 영역 --%>
    <li class="left clearfix commentLi" data-cno="12">
        <div>
            <div>
                <span class="header info-cwriter">
                    <strong class="primary-font">user00</strong>
                    <span>&nbsp;</span>
                    <small class="text-muted">2018-01-01 13:13</small>
                </span>
                <p>앞으로 사용할 기본 댓글 표시 템플릿입니다.</p>
            </div>
            <div class="btnsComment" style="margin-bottom:10px">
                <button type="button" style="display:in-block" class="btn btn-primary btn-xs btnChgReg">답글 작성</button>
                <button type="button" style="display:none" class="btn btn-warning btn-xs btnRegComment">답글 등록</button>
                <hr class="txtBoxCmtHr" style="margin-top:10px; margin-bottom:10px">
                <textarea class="form-control txtBoxCmtMod" name="ccontent" style="margin-bottom:10px"
                          placeholder="답글 작성 시 상대방에 대한 배려와 책임을 담아 주세요.&#10;답글작성을 원하시면,답글 작성  버튼을 클릭해주세요."
                 ></textarea>
            </div>
        </div>
    </li>
                    
                </ul>
<!-- 댓글 목록 표시 영역 끝 --><%-- 
                <div id="showMoreCmt">
                    <!-- 더보기버튼 생성 영역 -->
            	</div> --%>
          	
            </div><!-- /.panel-body -->

            <div class="panel-footer" id="showCmtPagingNums">
                <%-- 댓글 목록 페이징 번호 표시 영역  --%>
            </div>
        </div><!-- /.panel -->
    </div> <!-- .col-lg-12 -->
</div><!-- .row : 댓글 화면 표시 끝 -->
<!-- 댓글 페이징 데이터 저장 form -->
<form id="frmCmtPagingValue">
    <input type='hidden' name='pageNum' value='' />
    <input type='hidden' name='rowAmountPerPage' value=''/>
</form>

<form id="frmCmtCnt">
    <input type='hidden' id= 'bCmtCnt' name='bCmtCnt' value='<c:out value="${board.bcommentCnt}"/>' />
</form>
</div><!-- /#page-wrapper -->


<%-- //게시물 상세처리 JS 시작///////////////////////////////////////////////////////////////////--%>
<script>


var frmSendValue = $("#frmSendValue");

//게시물 수정 페이지로 이동: 폼의 값을 전송해서 이동하는 형태로 변경
$("#btnToModify").on("click", function(){
	//location.href='${contextPath}/myboard/modify?bno=<c:out value="${board.bno}"/>';  //주석처리
	frmSendValue.attr("action", "${contextPath}/myboard/myBoardModify");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
	
})

//게시물 목록 페이지로 이동: 폼의 값을 전송해서 이동하는 형태로 변경
$("#btnToList").on("click", function(){
	//location.href="${contextPath}/myboard/myBoardList";  //  주석처리
	frmSendValue.find("#bno").remove();//  목록화면 이동 시, bno 값 삭제
	frmSendValue.attr("action", "${contextPath}/myboard/myBoardList");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
})
</script>

<%-- 댓글처리 자바 스크립트 ////////////////////////////--%>
<script type="text/javascript" src="${contextPath}/resources/js/mycomment.js"></script>
<script type="text/javascript">
<%--csrf 헤더와 토큰을 변수에 저장 --%>
var csrfHeaderName = "${_csrf.headerName}";  <%--댓글 처리 자바스크립트 제일 위에 빨간색 코드 라인들 추가 --%>
var csrfTokenValue = "${_csrf.token}";
<%--html 문서에서 일어나는 모든 Ajax 전송 시에 --%> 
<%--각 요청에 대하여 csrf 값을 요청 헤더에 설정해서 보내도록 구성--%> 
$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});

//로그인 사용자ID를 저장
var loginUser = "";
<sec:authorize access="isAuthenticated()">
    loginUser = '<sec:authentication property="principal.username"/>'; //로그인 사용자명 변수에 저장
</sec:authorize>

alert("페이지로딩 시 loginUser변수값" + loginUser);

//게시물 번호 저장
var bnoVal = '<c:out value="${board.bno}"/>';
var commentUL = $(".chat");
var frmCmtPagingValue = $("#frmCmtPagingValue");

//댓글 목록표시: 작성자와 로그인 한 계정이 동일한 경우, 삭제 버튼 표시 구현해야 함
function showCmtList(page){
	
    myCommentClsr.getCmtList(
        {bno: bnoVal, page: page || 1 },
        function(myCmtPagingCreator) { //ajax에서 실행할 callback 함수
            console.log("서버로부터 전달된 pageNum(myCmtPagingCreator.myCmtPaging.pageNum): "
                        + myCmtPagingCreator.myCmtPaging.pageNum);

            frmCmtPagingValue.find("input[name='pageNum']")
                             .val(myCmtPagingCreator.myCmtPaging.pageNum);
            
            console.log("폼에 저장된 페이징번호 pageNum(): "
                        + frmCmtPagingValue.find("input[name='pageNum']").val());
            var str="";
            
            //댓글이 없으면 myCmtList가 null -> false -> 부정 -> true, 아래의  for문 실행 안됨.
            if( !myCmtPagingCreator.myCmtList ){
                str += '<li class="left clearfix commentLi" '
                    +  '    style="text-align: center; background-color: lightCyan;'
                    +  '           height: 35px;margin-bottom: 0px;padding-bottom:0px;'
                    +  '           padding-top:6px;border: 1px dotted;">'
                    +  '    <strong>등록된 댓글이 없습니다.</strong></li>';
                commentUL.html(str);
                return;
            }
            
            
            
            //답글 표시 for문(<ul></ul>내에 아래의 li 요소들이 for문에 의해서 생성되어 표시됨)
            for (var i = 0, len = myCmtPagingCreator.myCmtList.length; i < len; i++) {
              if(myCmtPagingCreator.myCmtList[i].cdelFlg == 1){
                str +='<li class="left clearfix commentLi" data-bno="' + bnoVal
          	        + '"   data-cno="'+myCmtPagingCreator.myCmtList[i].cno+'">'
          	        + '    <div style="height: 50px; background-color:lightgrey;vertical-align: middle;">'
          	        + '        <em style="vertical-align: middle;">삭제된 글입니다.</em>'
          	        + '    </div>'
          	        + '</li>';
            	  
              } 
              else {
            	str +='<li class="left clearfix commentLi" data-bno="' + bnoVal
            	    + '"   data-cno="'+myCmtPagingCreator.myCmtList[i].cno+'">'
            	    + '    <div>';
              //댓글에 대한 답글 들여쓰기
              if(myCmtPagingCreator.myCmtList[i].lvl == 1){//댓글 들여쓰기 안함
                str +='        <div>';
              } else if (myCmtPagingCreator.myCmtList[i].lvl == 2){//답글 들여쓰기
                str +='        <div style="padding-left:25px">';
              } else if (myCmtPagingCreator.myCmtList[i].lvl == 3){//답글의 답글 들여쓰기
                str +='        <div style="padding-left:50px">';
              } else if (myCmtPagingCreator.myCmtList[i].lvl == 4){//답글의 답글 들여쓰기
                str +='        <div style="padding-left:75px">';
              } else {//답글의 답글 레벨이 5이상이면 동일한 들여쓰기
                str +='        <div style="padding-left:100px">';
              } 
                str +='            <span class="header info-cwriter">'
                    + '                <strong class="primary-font">';
              if(myCmtPagingCreator.myCmtList[i].lvl > 1){
                str +='                    <i class="fa fa-reply fa-fw"></i>&nbsp;';	
              }
                str +=                     myCmtPagingCreator.myCmtList[i].cwriter 
                    + '                </strong>'
                    + '                <span>&nbsp;</span>'
                    + '                <small class="text-muted">' 
//                  +                      myCmtPagingCreator.myCmtList[i].cmodDate   //날짜가 정수값으로 표시.
//                  + '                    등록일: ' + myCommentClsr.displayTime(myCmtPagingCreator.myCmtList[i].cmodDate)
                    + '                    수정일: ' + myCommentClsr.showDatetime(myCmtPagingCreator.myCmtList[i].cmodDate)
                    + '                </small>';
              if(myCmtPagingCreator.myCmtList[i].lvl > 1){
                str +='                <small>&nbsp; 답글</small>';
              }
                str +='            </span>'
                    + '            <p data-bno=' + myCmtPagingCreator.myCmtList[i].bno
                    + '               data-cno=' + myCmtPagingCreator.myCmtList[i].cno
                    + '               data-cwriter=' + myCmtPagingCreator.myCmtList[i].cwriter
                    + '             >'
                    +                    myCmtPagingCreator.myCmtList[i].ccontent + '</p>'
                    + '        </div>';
            <sec:authorize access="isAuthenticated()" > //로그인 사용자일 때만 표시 
                str +='        <div class="btnsReply" style="margin-bottom:10px">'
                    + '            <button type="button" style="display:in-block" class="btn btn-primary btn-xs btnChgReplyReg"'
                    + '             ><span>답글 작성</span></button>'
                    + '        </div>';
            </sec:authorize>
                str +='    </div>'
                    + '</li>';
              }//End else
            }//End-for
			
            //UL 태그 내에 HTML 내용 표시
            commentUL.html(str); //html 사용 시, 새로운 내용으로 교체.
            //commentUL.append(str); //append 사용 시, 기존 내용 밑에 새로운 내용 추가 (페이징 대신 사용).

            //페이징번호 표시 함수 호출
            showCmtPagingNums(myCmtPagingCreator.myCmtPaging.pageNum,
           	                  myCmtPagingCreator.startPagingNum,
           	                  myCmtPagingCreator.endPagingNum,
           	                  myCmtPagingCreator.prev,
           	                  myCmtPagingCreator.next,
           	                  myCmtPagingCreator.lastPageNum); 
        }//.end 매개변수 익명 함수
    );//.end myCommentClsr.getCmtList
}//.end showCmtList


//댓글 목록에 표시할 페이징번호 생성 함수: myCmtPagingCreator로 부터 받아온 값들을 이용
function showCmtPagingNums(pageNum, startPagingNum, endPagingNum, prev, next, lastPageNum ) {
		
    if(endPagingNum >= lastPageNum){  
        endPagingNum = lastPageNum;
    }
		
    var str = "<div class='text-center'>"
            + "    <ul class='pagination pagination-sm'>";

    //맨 앞으로
    if(prev){
        str +="        <li class='page-item'>"
            + "            <a class='page-link' href='"+1+"'>"
            + "                <span aria-hidden='true'>&laquo;</span>"
            + "            </a>"
            + "        </li>" ;
    }

    //이전 페이지
    if(prev){
        str +="        <li class='page-item'>"
            + "            <a class='page-link' href='"+(startPagingNum -1)+"'>이전</a>"
            + "        </li>";
    }
	
    //선택된 페이지 번호 Bootstrap의 색상표시
    for(var i = startPagingNum ; i <= endPagingNum; i++){
        //Bootstrap의 클래스 이름
        var active = ( ( pageNum == i ) ? "active" : "" );

        str +="        <li class='page-item "+active+"'>"
            + "	           <a class='page-link' href='"+i+"'>"+i+"</a>"
            + "        </li>";
    }
    
    if(next){
        str +="        <li class='page-item'>"
            + "	           <a class='page-link' href='"+(endPagingNum + 1)+"'>다음</a>"
            + "        </li>";
    }
    
    //맨 마지막으로 
    if(next){
        str +="        <li class='page-item'>"
            + "	           <a class='page-link' href='"+(lastPageNum)+"'>&raquo;</a>"
            + "        </li>";
    }
	
        str +="    </ul>"
            + "</div>";

	$("#showCmtPagingNums").html(str);  //#showCmtPagingNums div에 표시
}


//선택된 페이징 번호의  게시물 목록 가져오는 함수: 이벤트전파이용
$("#showCmtPagingNums").on("click","ul li a", function(e){

	e.preventDefault();

	var targetPageNum = $(this).attr("href");
	console.log("targetPageNum: " + targetPageNum);
	
	showCmtList(targetPageNum);

});
    

<%--댓글 추가 요소 초기화 함수 --%> 
function chgBeforeCmtBtn() {
	$("#btnChgCmtReg").attr("style", "display:in-block");
	$("#btnRegCmt").attr("style", "display:none");
	$("#btnCancelRegCmt").attr("style", "display:none");
	$("#txtBoxCmt").val("");
	$("#txtBoxCmt").attr("readonly", true);
} 

	
	
<%--댓글 작성 버튼 클릭 - 댓글 등록 버튼으로 변경, 댓글 입력창 활성화--%>
$("#btnChgCmtReg").on("click", function(){

    chgBeforeCmtRepBtns();
    chgBeforeCmtBtn();
    chgBeforeReplyBtn()

    $(this).attr("style", "display:none");
    $("#btnRegCmt").attr("style", "display:in-block;margin-right:2px");
    $("#btnCancelRegCmt").attr("style", "display:in-block");
    $("#txtBoxCmt").attr("readonly", false);

});


<%--댓글등록 취소 클릭 --%>
$("#btnCancelRegCmt").on("click", function(){
    if(!confirm("댓글 입력을 취소하시겠습니까?")){
        return ;		
    }
    chgBeforeCmtBtn();

});





<%--댓글등록 버튼 클릭 이벤트 처리 --%>
$("#btnRegCmt").on("click", function(){
	
    <%--로그인 안한 경우--%>
     if(loginUser==null){
        alert("로그인 후, 등록이 가능합니다.");
        return ;
    } 
    console.log("댓글등록 시 loginUser: "+ loginUser );

    var txtBoxCmt = $("#txtBoxCmt").val(); 
    var comment = { bno: bnoVal,
                    ccontent: txtBoxCmt,
                    cwriter: loginUser};
      
    console.log("댓글등록: 서버전송 객체내용: " + comment);
    
    myCommentClsr.registerCmt(
        comment,
        function(serverResult){  
            $("#txtBoxCmt").val("");
            chgBeforeCmtBtn();
            
            alert("댓글이 등록되었습니다");

            showCmtList(-1); <%--댓글이 추가된 맨 마지막 페이지 표시--%>
        }
    );
});

<%--답글 관련 화면 상태 초기화--%>
function chgBeforeReplyBtn(){
    $(".btnRegReply").remove();
    $(".btnCancelRegReply").remove();
    $(".txtBoxReply").remove();
    $(".btnChgReplyReg").attr("style", "display:in-block");

} 

<%--답글 작성 버튼 클릭 이벤트--%>
<%--JSP 코드에 없는 생성된 요소, 이벤트 전파 사용 --%>
$(".chat").on("click", ".commentLi .btnChgReplyReg" ,function(){

    $("p").attr("style", "display:in-block;");
	
    chgBeforeCmtBtn();
    chgBeforeReplyBtn();
    chgBeforeCmtRepBtns();  
	
    var strTxtBoxReply =
          "<textarea class='form-control txtBoxReply' name='ccontent' style='margin-bottom:10px;'"
        + "          placeholder='답글 작성 시 상대방에 대한 배려와 책임을 담아 주세요.&#10;답글작성을 원하시면,답글 작성  버튼을 클릭해주세요.'"
        + "></textarea>"
        + "<button type='button' class='btn btn-warning btn-xs btnRegReply'>답글 등록</button>"
        + "<button type='button' class='btn btn-danger btn-xs btnCancelRegReply' style='margin-left:4px;'>취소</button>";

    $(this).after(strTxtBoxReply);
    $(this).attr("style", "display:none");
})

<%--답글등록 취소 클릭--%>
$(".chat").on("click", ".commentLi .btnCancelRegReply" ,function(){
    if(!confirm("답글 입력을 취소하시겠습니까?")){
        return ;		
    }
    chgBeforeReplyBtn();

});



<%--답글 등록 버튼 클릭 이벤트 처리: 답글이 달린 댓글이 있는 페이지 표시--%>
$(".chat").on("click", ".commentLi .btnRegReply" ,function(){

    <%--로그인 안한 경우--%> 
    if(loginUser == null){
        alert("로그인 후, 등록이 가능합니다.");
        return ;
    }  
    
    console.log("답글등록 시 loginUser: "+ loginUser );
    
    var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val();
    console.log("답글 추가가 발생된 댓글 페이지 번호: "+ pageNum);
    
    var txtBoxReply = $(this).prev().val();
    console.log("txtBoxReply: " + txtBoxReply);
    
    var pcnoVal = $(this).closest("li").data("cno");
    console.log("pcnoVal: " + pcnoVal);
    
    var reply = { bno: bnoVal,
                  ccontent: txtBoxReply,
                  cwriter: loginUser,
                  pcno: pcnoVal };
    
    console.log("답글등록: 서버전송 객체내용: " + reply);
    
    myCommentClsr.registerReply(
        reply, 
        function(serverResult){  
            alert("답글이 등록되었습니다");

            showCmtList(pageNum);<%--답글이 추가된 페이지 표시--%>
        }
    ); 
})


<%--댓글/답글 수정-삭제-취소-입력창  삭제 함수--%>
function chgBeforeCmtRepBtns(){

	$("p").attr("style","display:in-block;");
	
	$(".btnModCmt").remove();
	$(".btnDelCmt").remove();
	$(".btnCancelCmt").remove();
	$(".txtBoxMod").remove();
} 




<%--댓글-답글 수정/삭제 화면 요소 표시: p 태그 클릭 이벤트 --%>
$(".chat").on("click", ".commentLi p", function(){
	
    chgBeforeCmtBtn();<%--댓글 등록 상태 초기화--%>
    chgBeforeReplyBtn()<%--다른 답글 등록 상태 초기화--%>
    chgBeforeCmtRepBtns(); <%--다른 답글/댓글 수정 상태  초기화--%>
   
    
    <%--작성자 변수에 저장--%>
    var cwriter = $(this).data("cwriter"); 
    console.log("cwriter: " + cwriter);
    console.log("loginUser: " + loginUser);
    
    <%--로그인 안 한 경우 --%>
    if(!loginUser){
        alert("로그인 후, 수정이 가능합니다.");
        return ;
    } 	

    <%--로그인 계정과 작성자가 다른 경우--%>
    if(cwriter != loginUser){
        alert("작성자만 수정 가능합니다");
        return ;
    }

    $(this).parents("li").find(".btnChgReplyReg").attr("style", "display:none");

    var ccontent = $(this).text();
    console.log("선택된 댓글내용: " + ccontent);
	
    var strTxtBoxReply =
          "<textarea class='form-control txtBoxMod' name='ccontent' style='margin-bottom:10px;'"
        + "          placeholder='답글 작성 시 상대방에 대한 배려와 책임을 담아 주세요.&#10;답글작성을 원하시면,답글 작성  버튼을 클릭해주세요.'"
        + "></textarea>"
        + "<button type='button' class='btn btn-warning btn-sm btnModCmt'>수정</button> "
        + "<button type='button' class='btn btn-danger btn-sm btnDelCmt'>삭제</button>"
        + "<button type='button' class='btn btn-info btn-sm btnCancelCmt' style='margin-left: 4px;'>취소</button>";
    
    $(this).after(strTxtBoxReply);
    $(".txtBoxMod").val(ccontent);
    $(this).attr("style", "display:none");

});


<%--댓글-답글 수정/삭제의 취소 버튼 클릭 이벤트 --%> 
$(".chat").on("click", ".commentLi .btnCancelCmt", function(){
	chgBeforeCmtBtn();
	chgBeforeReplyBtn()
    chgBeforeCmtRepBtns()
});



<%-- 댓글-답글 수정 처리: 수정 버튼 클릭 이벤트 --%>
$(".chat").on("click", ".commentLi .btnModCmt", function(){

    <%--작성자 변수에 저장--%> 
    var cwriterVal = $(this).siblings("p").data("cwriter");
    console.log("cwriterVal: " + cwriterVal);
    console.log("loginUser: " + loginUser);
    
    <%--로그인 안 한 경우--%>
    if(!loginUser){
        alert("로그인 후, 수정이 가능합니다.");
        return ;
    }
    
    <%--로그인 계정과 작성자가 다른 경우--%>
    if(cwriterVal != loginUser){
        alert("작성자만 수정 가능합니다");
        return ;
    }

    var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val();
    console.log("답글 수정이 발생된 댓글 페이지 번호: "+ pageNum);
    
    var txtBoxComment = $(this).prev().val();
    console.log("txtBoxComment: " + txtBoxComment);
    
    var cnoVal = $(this).closest("li").data("cno");
    console.log("cnoVal: " + cnoVal);
    
    var comment = { bno: bnoVal,
                    cno: cnoVal,
                    ccontent: txtBoxComment,
                    cwriter: cwriterVal };
    
    console.log("댓글-답글수정 서버전송 객체내용: " + comment);
    
    myCommentClsr.modifyCmtReply(
            comment,
            function(serverResult){
                alert("수정되었습니다");
                
                showCmtList(pageNum); <%-- 수정된 답글이 있는 페이지 표시 --%>
            } 
    );
});


<%--댓글-답글 삭제 처리: 삭제 버튼 클릭 이벤트 --%>
$(".chat").on("click", ".commentLi .btnDelCmt", function(){
	
    <%--작성자 변수에 저장--%>
    var cwriterVal = $(this).siblings("p").data("cwriter");
    console.log("cwriterVal: " + cwriterVal);
    console.log("loginUser: " + loginUser);
    
    <%--로그인 하지 않은 경우--%>
    if(!loginUser){
        alert("로그인 후, 삭제가 가능합니다.");
        return ;
    }
    
    <%--로그인 계정과 작성자가 다른 경우--%>
    if(cwriterVal != loginUser){
        alert("작성자만 삭제 가능합니다");
        return ;
    }

    var delConfirm = confirm('삭제하시겠습니까?');
   
    if(!delConfirm){
   	    alert('삭제가 취소되었습니다.');
   	    return ;
    }

    var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val();
    console.log("답글 삭제가 발생된 댓글 페이지 번호: "+ pageNum);

    var cnoVal = $(this).closest("li").data("cno");
    console.log("cnoVal: " + cnoVal);

    var myComment = { bno: bnoVal,
                      cno: cnoVal,
                      cwriter: cwriterVal };

    console.log("답글삭제 시, 서버전송 객체내용: " + myComment);

    myCommentClsr.setCmtReplyDeleted(
        myComment,
        function(serverResult){<%--서버에서 댓글저장 성공 시, 브라우저에서 실행될 콜백함수--%>  
            alert("삭제되었습니다.");

            showCmtList(pageNum); 
        }
    );
});

    
$(document).ready(function(){//페이지 로딩 시 함수 실행, 전체 JavaScript 내용 중 제일 마지막에 위치해야 함

    showCmtList(1);
	
});


/*
//댓글 목록표시 테스트	
myCommentClsr.getCmtList(
    {bno:bnoValue, page:1},   //1번째 bnoAndPage의 인자값(JS객체)
    function(myCmtPagingCreator){  //2번째 callback 인자값: 성공 시 실행되는 함수(익명블록)
        for (var i = 0, len = myCmtPagingCreator.myCmtList.length || 0 ; i < len; i++){
            console.log(myCmtPagingCreator.myCmtList[i]);
        }
    }
);  //주석처리  */

/*
//댓글등록  테스트
myCommentClsr.registerCmt(
    {bno:bnoValue, ccontent:"JS-클로저-댓글입력테스트입니다.", cwriter: "user7"} , //1-comment인자값 
    function(result){    //2번째 callback 인자값: 성공 시 실행되는 함수
        alert("myCommentClsr.registerCmt()처리결과 " + result);
    }
); 


//답글등록 테스트
myCommentClsr.registerReply(
    {bno: bnoValue, pcno: 1, ccontent: "JS-클로저-댓글의 답글입력테스트입니다.", cwriter: "user10"}, 
    function(result){ //2번째 callback 인자값: 성공시 실행되는 함수
        alert("myCommentClsr.registerReply()처리결과 " + result); //익명블록 형태의 콜백함수
    }
);
*/

/*
//댓글-답글 조회 테스트
myCommentClsr.getCmtReply(
    {bno: bnoValue, cno: 1 },  function(data){
        console.log(data);
    }
);
*/

/*
//댓글-답글 수정 테스트 
myCommentClsr.modifyCmtReply(
    {bno : bnoValue, cno : 1, ccontent: "JS클로저에 의한 댓글 수정======="}	,
    function(modifyResult) {
        alert(modifyResult + "- ajax 처리 완료");
    }
);
*/

/*
//댓글-답글 삭제 테스트(cdelFlg=1로 변경만 함)
myCommentClsr.setCmtReplyDeleted(
    {bno : bnoValue, cno : 29, rwriter: "user7"},
    function(deleteResult) {
        console.log(deleteResult);
        if (deleteResult === "댓글 삭제 성공") {
            alert(deleteResult + ": 댓글이 삭제되었습니다.(BysetCmtReplyDeleted)");
		}
    },
    function(err) {
        alert("오류로 인한 댓글 삭제 작업 취소...");
	}
);

//댓글-답글 삭제 테스트(실제 삭제 발생)
myCommentClsr.removeCmtReply(
    {bno : bnoValue, cno : 30, cwriter: "user10"},
    function(deleteResult) {
        console.log(deleteResult);
        if (deleteResult === "댓글 삭제 성공") {
            alert(deleteResult + ": 댓글이 삭제되었습니다(ByRemoveCmtReply).");
		}
    },
    function(err) {
        alert("오류로 인한 댓글 삭제 작업 취소...");
	}
); 
*/

</script>



<%@ include file="../myinclude/myfooter.jsp" %>         