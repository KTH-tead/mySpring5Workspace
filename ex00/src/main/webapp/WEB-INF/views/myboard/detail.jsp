<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../myinclude/myheader.jsp"%>


<style>
.txtBoxCmt, .txtBoxComment {
	overflow: hidden;
	resize: vertical;
	min-height: 100px;
	color: black;
}

.bigImageWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%; /* background-color: lightgray; */
	z-index: 100;
}

.bigImage {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigImage img {
	height: 100%;
	max-width: 100%;
	width: auto;
	overflow: hidden
}
</style>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header" style="white-space: nowrap;">
				Board - Detail:
				<c:out value="${board.bno}" />
				번 게시물
			</h3>
		</div>
	</div>
	<%-- 게시물 상세 표시 시작 --%>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row">
						<div class="col-md-3"
							style="white-space: nowrap; height: 45px; padding-top: 11px;">
							<strong style="font-size: 18px;">${board.bwriter}님 작성</strong>
						</div>
						<div class="col-md-3"
							style="white-space: nowrap; height: 45px; padding-top: 16px;">
							<span class="text-primary"
								style="font-size: smaller; height: 45px; padding-top: 19px;">
								<span> <span>등록일:&nbsp;</span> <strong><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm:ss" value="${board.bregDate}" /></strong> <span>&nbsp;&nbsp;</span>
							</span> <span>조회수:&nbsp;<strong><c:out
											value="${board.bviewsCnt}" /></strong></span>
							</span>
						</div>
						<div class="col-md-6" style="height: 45px; padding-top: 6px;">
							<!-- vertical-align: middle; -->
							<div class="button-group pull-right">
							<%-- 수정 버튼을 찾아서 다음의 코드를 추가: 수정버튼은 로그인 한 작성자일 경우에만 표시 --%>
							<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal" var="principal"/>
									<c:if test="${principal.username eq board.bwriter}">
									<button type="button" id="btnToModify" data-oper="modify" class="btn btn-primary">
										<span>수정</span>
									</button>
									</c:if>
								</sec:authorize>							
								<button type="button" id="btnToList" data-oper="list"
									class="btn btn-info">
									<span>목록</span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /.panel-heading -->

				<div class="panel-body form-horizontal">
					<div class="form-group">
						<label class="col-sm-1 control-label" style="white-space: nowrap;">글제목</label>
						<div class="col-sm-11">
							<input class="form-control"
								value='<c:out value="${board.btitle}"/>' name="btitle"
								readonly="readonly" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label" style="white-space: nowrap;">글내용</label>
						<%-- <textarea>와 </textarea>는 한 줄에 작성되어야 필요없는 공백이 포함되지 않음 --%>
						<div class="col-sm-11">
							<textarea class="form-control" rows="3" name="bcontent"
								style="resize: none;" readonly="readonly"><c:out
									value="${board.bcontent}" /></textarea>
						</div>
					</div>
				</div>
				<!-- /.panel-body -->

			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<!-- 첨부파일 표시 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">첨부파일</div>
				수정
				<div class="panel-body">
					<div class='form-group bigImageWrapper'>
						 원본 이미지 표시 div 추가
						<div class='bigImage'>
							<%-- 이미지파일 크게 표시되는 영역: 썸네일 클릭 시, 첨부파일 패널 영역에만 원본이미지가 표시됨.--%>
						</div>
					</div>
					<%-- 원본이미지 div 끝 --%>
					<div class="form-group fileUploadResult">
						<ul>
							<!-- 첨부파일 목록이 표시될 영역 -->
						</ul>
					</div>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<form id="frmSendValue">
		<!-- 폼을 추가 -->
		<input type='hidden' name='bno' id="bno"
			value='<c:out value="${board.bno}"/>'> <input type='hidden'
			name='pageNum' value='${myBoardPagingDTO.pageNum}'> <input
			type='hidden' name='rowAmountPerPage'
			value='${myBoardPagingDTO.rowAmountPerPage}'> <input
			type='hidden' name='scope' value='${myBoardPagingDTO.scope}'>
		<input type='hidden' name='keyword'
			value='${myBoardPagingDTO.keyword}'>
	</form>




	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<p style="margin-bottom: 0px; font-size: 16px;">
						<strong style="padding-top: 2px;"> <span>댓글&nbsp;<c:out
									value="${board.breplyCnt}" />개
						</span><span>&nbsp;</span>
						
						<sec:authorize access="isAuthenticated()" ><%-- 추가: 댓글 작성 버튼, 로그인 사용자일 때만 표시 --%>
							<button type="button" id="btnChgCmtReg" class="btn btn-info btn-sm">댓글 작성</button>
						</sec:authorize>
							<button type="button" id="btnRegCmt"
								class="btn btn-warning btn-sm" style="display: none">댓글
								등록</button>
							<button type="button" id="btnCancelRegCmt"
								class="btn btn-warning btn-sm" style="display: none">취소</button>
						</strong>
					</p>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<!-- 댓글 입력창 시작 -->
				<sec:authorize access="isAuthenticated()" ><%-- 추가: 댓글 작성 버튼, 로그인 사용자일 때만 표시 --%>
					<div class="form-group" style="margin-bottom: 5px;">
						<textarea class="form-control txtBoxCmt" name="rcontent"
							placeholder="댓글 작성 시 상대방에 대한 배려와 책임을 담아 주세요.&#10;댓글작성을 원하시면,댓글 작성 버튼을 클릭해주세요."
							readonly="readonly"></textarea>
					</div>
					<hr style="margin-top: 10px; margin-bottom: 10px;">
					</sec:authorize>
					<!-- 댓글 입력창 끝 -->
					<ul class="chat">
						<!-- 댓글 목록 표시 영역 -->
						<li class="left clearfix commentLi" data-bno="123456"
							data-rno="12">
							<div>
								<div>
									<span class="header info-rwriter"> <strong
										class="primary-font">user00</strong> <span>&nbsp;</span> <small
										class="text-muted">2018-01-01 13:13</small>
									</span>
									<p>앞으로 사용할 댓글 표시 기본 템플릿입니다.</p>
								</div>
								<div class="btnsComment" style="margin-bottom: 10px">
									<button type="button" style="display: in-block"
										class="btn btn-primary btn-xs btnChgReg">답글 작성</button>
									<button type="button" style="display: none"
										class="btn btn-warning btn-xs btnRegCmt">답글 등록</button>
									<hr class="txtBoxCmtHr"
										style="margin-top: 10px; margin-bottom: 10px">
									<textarea class="form-control txtBoxCmtMod" name="rcontent"
										style="margin-bottom: 10px"
										placeholder="답글 작성 시 상대방에 대한 배려와 책임을 담아 주세요.&#10;답글작성을 원하시면,답글 작성 버튼을 클릭해주세요."></textarea>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<!-- /.panel-body -->
				<div class="panel-footer" id="showCmtPagingNums">
					<%-- 댓글 목록의 페이징 번호 표시 영역 --%>
				</div>
			</div>
			<!-- /.panel -->
		</div>
		<!-- .col-lg-12 -->
	</div>
	<!-- .row : 댓글 화면 표시 끝 -->
	<!-- 댓글 페이징 데이터 저장 form -->
	<form id="frmCmtPagingValue">
		<input type='hidden' name='pageNum' value='' /> <input type='hidden'
			name='rowAmountPerPage' value='' />
	</form>









</div>
<!-- /#page-wrapper -->

<%-- 게시물 상세 표시 끝 --%>

<script>


var frmSendValue = $("#frmSendValue");

//게시물 수정 페이지로 이동: 폼의 값을 전송해서 이동하는 형태로 변경
$("#btnToModify").on("click", function(){
	//location.href='${contextPath}/myboard/modify?bno=<c:out value="${board.bno}"/>';  //주석처리
	frmSendValue.attr("action", "${contextPath}/myboard/modify");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
})

//게시물 목록 페이지로 이동: 폼의 값을 전송해서 이동하는 형태로 변경
$("#btnToList").on("click", function(){
	//location.href="${contextPath}/myboard/myBoardList";  //  주석처리
	frmSendValue.find("#bno").remove();//  목록화면 이동 시, bno 값 삭제
	frmSendValue.attr("action", "${contextPath}/myboard/list");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
})
</script>

<script type="text/javascript"
	src="${contextPath}/resources/js/mycomment.js"></script>



<script>

<%-- HTML에서 일어나는 모든 Ajax 전송 요청에 대하여 csrf 토큰값이 요청 헤더에 설정됨 --%>
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	})

<%--로그인 사용자명 변수에 저장하는 코드는 댓글/답글 자바스크립트 코드 시작 부분으로 이동시킵니다.--%>
var loginUser = "";
	<sec:authorize access="isAuthenticated()">
		loginUser = '<sec:authentication property="principal.username"/>';<%--로그인 사용자명 변수에 저장--%>
</sec:authorize>



var bnoValue = '<c:out value="${board.bno}"/>';
var commentUL = $(".chat");
var frmCmtPagingValue = $("#frmCmtPagingValue");

//댓글 목록 표시
function showCmtList(page){
		myCommentClsr.getCmtList(
				{bno: bnoValue, page: page || 1},
				function(replyPagingCreator) {
					//ajax에서 실행할 callback 함수
					console.log("서버로부터 전달된 pageNum(replyPagingCreator.myReplyPaging.pageNum) : "
							    + replyPagingCreator.myReplyPaging.pageNum);
					
					frmCmtPagingValue.find("input[name='pageNum']")
									 .val(replyPagingCreator.myReplyPaging.pageNum);
					
					console.log("폼에 저장된 페이징 번호 pageNum() : "
								+ frmCmtPagingValue.find("input[name='pageNum']")
								 .val());
					var str = "";
					
					//댓글이 없으면 replyList가 null -> false -> 부정 -> true, 아래의 for문 실행 안 됨
					if( ! replyPagingCreator.replyList) {
					//if(replyPagingCreator.replyList == null) {
						str += '<li class="left clearfix commentLi"'
							+ '		style="text-align: center; background-color:lightCyan;'
							+ '		height: 35px; margin-bottom: 0; padding-bottom:0;'
							+ '		padding-top: 6px; border: 1px dotted;">'
							+ '	<strong>등록된 댓글이 없습니다.</strong></li>';
						commentUL.html(str);
						return;
					}
					
					//답글 표시 for문(<ul></ul> 내에 아래의 li 요소들이 for문에 의해서 생성되어 표시됨)
					for(var i = 0, len = replyPagingCreator.replyList.length; i < len; i++) {
						str += '<li class="left clearfix commentLi" data-bno="' + bnoValue
							+ '" data-rno="' + replyPagingCreator.replyList[i].rno + '">'
							+ '<div>';
						//댓글에 대한 답글 들여쓰기
						if(replyPagingCreator.replyList[i].lvl == 1) {
							str += '<div>';
						} else if(replyPagingCreator.replyList[i].lvl == 2) {
							str += ' <div style="padding-left: 25px;">'
						} else if(replyPagingCreator.replyList[i].lvl == 3) {
							str += ' <div style="padding-left: 50px;">'
						} else if(replyPagingCreator.replyList[i].lvl == 4) {
							str += ' <div style="padding-left: 75px;">'
						} else {
							str += ' <div style="padding-left: 100px;">'
						}
							str += '<span class="header info-rwriter">'
								+ '<strong class="primary-font">';
						
						if(replyPagingCreator.replyList[i].lvl > 1) {
							str += '<i class="fa fa-reply fa-fw"></i>&nbsp;';
						}		
							str += replyPagingCreator.replyList[i].rwriter
								+ '</strong>'
								+ '<span>&nbsp;</span>'
								+ '<small class="text-muted">'
								//+ replyPagingCreator.replyList[i].rmodDate
								+ ' 수정일: ' + myCommentClsr.showDatetime(replyPagingCreator.replyList[i].rmodDate)
								+ '</small>'
								
						if(replyPagingCreator.replyList[i].lvl > 1) {
							str += '<small>&nbsp; 답글</small>';
						}
							/*  str += '</span>'
								+ '<p data-bno = ' + replyPagingCreator.replyList[i].bno
								+ ' data-rno = ' + replyPagingCreator.replyList[i].rno
								+ ' data-rwriter = ' + replyPagingCreator.replyList[i].rwriter 
								+ '>'  */
								 str += '</span>'
			                        + '<p data-bno = ' + replyPagingCreator.replyList[i].bno
			                        + ' data-rno = ' + replyPagingCreator.replyList[i].rno
			                        + ' data-rwriter = ' + replyPagingCreator.replyList[i].rwriter
			                        + '>' 
								+ replyPagingCreator.replyList[i].rcontent + '</p>'
								+ '</div>';
									<sec:authorize access="isAuthenticated()" ><%-- 추가: 답글추가 버튼, 로그인 사용자일 때만 표시 --%>
							str += '<div class="btnsReply" style="margin-bottom : 10px">'
								+ '<button type ="button" style="display:in-block" class="btn btn-primary btn-xs btnChgReplyReg"'
								+ '><span>답글 작성</span></button>'
								+ '</div>';	
									</sec:authorize>
							str +=' </div>'
								+ '</li>';
					}
					commentUL.html(str);
					
					//페이징번호 표시 함수 호출
					showCmtPagingNums(replyPagingCreator.myReplyPaging.pageNum,
					replyPagingCreator.startPagingNum,
					replyPagingCreator.endPagingNum,
					replyPagingCreator.prev,
					replyPagingCreator.next,
					replyPagingCreator.lastPageNum);
				}
				
			)
		}
				
				
function showCmtPagingNums(pageNum, startPagingNum, endPagingNum, prev, next, lastPageNum) {
		if(endPagingNum >= lastPageNum) {
			endPagingNum = lastPageNum;
		}
		
		var str = "<div class='text-center'>"
				+ " <ul class='pagination pagination-sm'>";
				
		if(prev) {
			str += "<li class='page-item'>"
				+ "		<a class='page-link' href='"+1+"'>"
				+ "			<span aria-hidden='true'>&laquo;</span>"
				+ "		</a>"
				+ "</li>";
		}
		
		if(prev) {
			str += " <li class='page-item'>"
				+ "		<a class='page-link' href='"+(startPagingNum -1)+"'>이전</a>"
				+ " </li>";
		}
		
		//선택된 페이지 번호 Bootstrap 색상 표시
		for(var i = startPagingNum; i <= endPagingNum; i++) {
			//active는 Bootstrap 이름
			var active = ((pageNum == i) ? "active" : "");
			
			str += "<li class='page-item "+ active +"'>"
				+ "<a class='page-link' href='" + i +"'>" + i + "</a>"
				+ " </li>";
		}
		
		if(next) {
			str += "<li class='page-item'>"
				+ "<a class='page-link' href='"+(endPagingNum + 1)+"'>다음</a>"
				+ "</li>";
		}
		
		if(next) {
			str += "<li class='page-item'>"
				+ "<a class='page-link' href='" + (lastPageNum) + "'>&raquo;</a>"
				+ "</li>";
		}
		
		str += "</ul>"
			+ "</div>";
		
		$("#showCmtPagingNums").html(str);
	}	
	


$("#showCmtPagingNums").on("click", "ul li a", function(e) {
	e.preventDefault();
	
	var targetPageNum =$(this).attr("href");
	console.log("targetPageNum : " + targetPageNum);
	
	showCmtList(targetPageNum);
	
	})
	
//댓글 추가 요소 초기화 함수
function chgBeforeCmtBtn() {
	$("#btnChgCmtReg").attr("style", "display: in-block");
	$("#btnRegCmt").attr("style", "display: none");
	$("#btnCancelRegCmt").attr("style", "display:none");
	$(".txtBoxCmt").val("");
	$(".txtBoxCmt").attr("readonly", true);
}

//댓글 작성 버튼 클릭, 댓글 등록 버튼으로 변경, 댓글 입력창 활성화
$("#btnChgCmtReg").on("click", function() {
	
	chgBeforeCmtRepBtns();
	chgBeforeCmtBtn();
	chgBeforeReplyBtn();
	
	$(this).attr("style", "display: none");
	$("#btnRegCmt").attr("style", "display: in-block; margin-right: 2px;")
	$("#btnCancelRegCmt").attr("style", "display: in-block");
	$(".txtBoxCmt").attr("readonly", false);
})

//댓글 등록 취소 클릭
$("#btnCancelRegCmt").on("click", function() {
	if(!confirm("댓글 입력을 취소하시겠습니까?")) {
		return ;
	}
	chgBeforeCmtBtn();
})

<%-- 아래의 댓글 등록 버튼 클릭 jQuery 실행문 코드를 찾아서 빨간색 코드 추가 --%>
//댓글등록 버튼 클릭 이벤트 처리
$("#btnRegCmt").on("click", function() {
	// var loginUser = "user9"; 
	 <%--이 실행문 주석 처리 또는 삭제 후, 아래 빨간색 코드 추가--%>
	 if(!loginUser){
		 alert("로그인 후, 등록이 가능합니다.");
		 return ;
	 }
	 console.log("댓글 등록 시 loginUser:" +loginUser);
	 
	 
	 //로그인 유무 검증
	var txtBoxCmt = $(".txtBoxCmt").val();
	var comment = {bno : bnoValue, rcontent: txtBoxCmt, rwriter: loginUser};
	
	console.log("댓글 등록 : 서버 전송 객체 내용 : " + comment);
	
	myCommentClsr.registerCmt(
		comment,
		function(serverResult) {
			$(".txtBoxCmt").val("");
			chgBeforeCmtBtn();
			
			alert("댓글이 등록되었습니다");
			
			showCmtList(-1); 
			//댓글이 추가된 맨 마지막 페이지 표시
		}
	)
})


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
	"<textarea class='form-control txtBoxReply' name='rcontent' style='margin-bottom:10px;'"
		+ " placeholder='답글 작성 시 상대방에 대한 배려와 책임을 담아 주세요.&#10;답글작성을 원하시면,답글 작성 버튼을 클릭해주세요.'"
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
	//var loginUser = "test8";
	
	//로그인 유무 검증
	<%--로그인 안 한 경우--%>
	if(!loginUser){
	alert("로그인 후, 답글 등록이 가능합니다.");
	return ;
	}
	console.log("답글 등록 시 loginUser: "+ loginUser);
	
	var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val();
	console.log("답글 추가가 발생된 댓글 페이지 번호: "+ pageNum);

	var txtBoxReply = $(this).prev().val();
	console.log("txtBoxReply: " + txtBoxReply);
	
	var prnoVal = $(this).closest("li").data("rno");
	console.log("prnoVal: " + prnoVal);
	
	var reply = { bno: bnoValue,
	rcontent: txtBoxReply,
	rwriter: loginUser,
	prno: prnoVal };
	console.log("답글등록: 서버전송 객체내용: " + reply);
	myCommentClsr.registerReply(
	reply,

	function(serverResult){
		alert("답글이 등록되었습니다");
		showCmtList(pageNum);<%--댓글이 추가된 페이지 표시--%>
		}
	);
})

	
<%--댓글/답글 수정-삭제-취소-입력창 삭제 함수--%>
function chgBeforeCmtRepBtns(){
	$("p").attr("style","display:in-block;");
	//답글 처리 관련 버튼
	$(".btnModCmt").remove();
	$(".btnDelCmt").remove();
	$(".btnCancelCmt").remove();
	$(".txtBoxMod").remove();
}

<%--댓글-답글 수정/삭제 화면 요소 표시: p 태그 클릭 이벤트 --%>
$(".chat").on("click", ".commentLi p", function(){
	chgBeforeCmtBtn();<%--댓글 등록 상태 초기화--%>
	chgBeforeReplyBtn()<%--다른 답글 등록 상태 초기화--%>
	chgBeforeCmtRepBtns(); <%--다른 답글/댓글 수정 상태 초기화--%>
	
	<%--작성자 변수에 저장--%>
	var rwriter = $(this).data("rwriter");
	console.log("rwriter: " + rwriter);
	console.log("loginUser: " + loginUser);
	
	<%--로그인 하지 않은 경우--%>
	if(!loginUser){
		alret("로그인 후, 수정이 가능합니다");
		return ;
	}
	
	<%--로그인 계정과 작성자가 다른 경우--%>
	if(rwriter != loginUser){
		alert("작성자만 수정 가능합니다");
		return ;
	}
	
	$(this).parents("li").find(".btnChgReplyReg").attr("style", "display:none");

	var rcontent = $(this).text();
	console.log("선택된 댓글내용: " + rcontent);
	var strTxtBoxReply =
		"<textarea class='form-control txtBoxMod' name='rcontent' style='margin-bottom:10px;'"
		+ " placeholder='답글 작성 시 상대방에 대한 배려와 책임을 담아 주세요.&#10;답글작성을 원하시면,답글 작성 버튼을 클릭해주세요.'"
		+ "></textarea>"
		+ "<button type='button' class='btn btn-warning btn-sm btnModCmt'>수정</button> "
		+ "<button type='button' class='btn btn-danger btn-sm btnDelCmt'>삭제</button>"
		+ "<button type='button' class='btn btn-info btn-sm btnCancelCmt' style='margin-left: 4px;'>취소</button>";

	$(this).after(strTxtBoxReply);
	$(".txtBoxMod").val(rcontent);
	$(this).attr("style", "display:none");
});
<%--댓글-답글 수정/삭제의 취소 버튼 클릭 이벤트 --%>
$(".chat").on("click", ".commentLi .btnCancelCmt", function(){
	chgBeforeCmtBtn();
	chgBeforeReplyBtn()
	chgBeforeCmtRepBtns()
});


<%-- 아래의 댓글-답글 수정 버튼 클릭 jQuery 실행문 코드를 찾아서 빨간색 코드 추가 --%>
<%-- 댓글-답글 수정 처리: 수정 버튼 클릭 이벤트 --%>
$(".chat").on("click", ".commentLi .btnModCmt", function(){
<%--작성자 변수에 저장--%>
	var rwriterVal = $(this).siblings("p").data("rwriter");
	console.log("rwriterVal:" +rwriterVal);
	console.log("loginUser:" +loginUser);
	
	<%--로그인 안 한 경우--%>
	if(!loginUser){
		alert("로그인 후, 수정이 가능합니다.");
		return;
	}
	
	<%--로그인 계정과 작성자가 다른 경우--%>
	if(rwriterVal != loginUser){
		alert("작성자만 수정 가능합니다.");
		return ;
	}
	
	var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val();
	
	console.log("댓글/답글 수정이 발생한 댓글 페이지 번호: "+ pageNum);
	
	var txtBoxComment = $(this).prev().val();
	console.log("txtBoxComment: " + txtBoxComment);
	
	var rnoVal = $(this).closest("li").data("rno");
	console.log("rnoVal: " + rnoVal);
	
	var comment = { bno: bnoValue,
					rno: rnoVal,
					rcontent: txtBoxComment,
					rwriter: rwriterVal };
	console.log("답글등록: 서버전송 객체내용: " + comment);
	
	myCommentClsr.modifyCmtReply(
		comment,
		function(serverResult){
				alert("수정되었습니다");
		showCmtList(pageNum); <%-- 답글이 추가된 페이지 표시 --%>
		}
	);
});

<%--댓글-답글 삭제 처리: 삭제 버튼 클릭 이벤트 --%>
$(".chat").on("click", ".commentLi .btnDelCmt", function(){
	
	<%--작성자 변수에 저장--%>
	var rwriterVal = $(this).siblings("p").data("rwriter");
	console.log("rwriterVal: " + rwriterVal);
	console.log("loginUser: " + loginUser);

	<%--로그인 하지 않은 경우--%>
	if(!loginUser){
	alert("로그인 후, 삭제가 가능합니다.");
	return ;
	}
	
	<%--로그인 계정과 작성자가 다른 경우--%>
	if(rwriterVal != loginUser){
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
	
	var rnoVal = $(this).closest("li").data("rno");
	console.log("rnoVal: " + rnoVal);
	
	var myComment = { bno: bnoValue,
    			 	  rno: rnoVal,
					  rwriter: rwriterVal };
	console.log("답글삭제: 서버전송 객체내용: " + myComment);
	
	myCommentClsr.removeCmtReply(
		myComment,
		function(serverResult){<%--서버에서 댓글저장 성공 시, 브라우저에서 실행될 콜백함수--%>
				alert("삭제되었습니다.");
		showCmtList(pageNum);
		}
	);
});
	
		
	/* //페이지 로딩시 함수 실행
	$(function() {
		showCmtList(1);
	}) 

	

	} */
	
	//첨부파일 정보 표시 함수
	function showUploadedFiles(uploadResult){
		//서버로 부터 결과내용이 전달되지 않으면, 함수 종료.
		if(!uploadResult || uploadResult.length == 0){
			return ;
		}
		//ul 태그 변수화
		var fileUploadResult = $(".fileUploadResult ul");
		var str = "";
		
		$(uploadResult).each(function(i, obj){ //전달받은 배열형식 데이터 각각에 대하여
			if (obj.fileType == "F"){//파일이 이미지가 아닌 경우
				//아이콘 이미지 및 원본 파일이름(uuid 없는 이름) 표시
				str += "<li data-filename='" +obj.fileName+"' data-uploadpath '" +obj.uploadPath+ "'"
					+ " data-uuid='" +obj.uuid + "'data-filetype='" +obj.fileType +"'>"
					+ "<img src='${contextPath}/resources/img/icon-attach.png'"
					+ "     alt= 'No Icon' style='height:18px; width:18px;'>"
					+ obj.fileName
					+ "</li>";
			} else if (obj.fileType == "I") {//이미지파일인 경우
				//업로드 된 썸네일 파일이름(uuid 포함된 이름, 썸네일 표시를 위해 필요): encodeURIComponent로 처리
				var thumbnailFilePath  =
					encodeURIComponent(obj.uploadPath +"/s_" +obj.uuid+ "_" +obj.fileName);
				//아이콘 이미지 및 파일이름(원본파일이름) 표시
				str += "<li data-filename='" +obj.fileName + "'data-uploadpath='" +obj.uploadPath +"'"
					+ "data-uuid='" +obj.uuid+ "'data-filetype'" +obj.fileType+ "'>"
					+ "<img src='${contextPath}/DisplayThumbnailFile?fileName=" +thumbnailFilePath+"'"
					+ "alt ='No Icon' style='height:18px; width:18px;'>"
					+ obj.fileName
					+ "</li>";
			}
		});
		//기존 페이지에 결과를 HTML로 추가
		fileUploadResult.append(str);
		}
	
	$(document).ready(function(){//페이지 로딩 시 함수 실행, 전체 JavaScript 내용 중 제일 마지막에 위치해야 함
		$.ajax({
			url : '${contextPath}/myboard/getFiles',
			data : {bno: bnoValue}, // bnoValue는 상단에 정의된 것 사용
			type : 'get',
			dataType: 'json',
			success : function (fileList){
				showUploadedFiles(fileList);
			}
		}) // ajax end
		
		showCmtList(1); //댓글목록 표시
	});
	
	
	//이미지 표시
	//display 속성의 flex 옵션을 이용하면,
	//이미지가 웹브라우저의 중앙에 표시됩니다.
	function showImage(calledPathImagefileName) {

		$(".bigImageWrapper").css("display", "flex").show();

		$(".bigImage").html(
			"<img src='${contextPath}/fileDownloadAjax?fileName=" + calledPathImagefileName + "'>")
			.animate({width: '100%', height: '100%' }, 1000);
	}
	//DIV 클릭 이벤트처리: 클릭 시 1초 후에 이미지 사라짐.
	$(".bigImageWrapper").on("click", function (e) {
			$(".bigImage").animate({ width: '0%', height: '0%' }, 1000);
			//setTimeout(() => {$(this).hide();}, 1000);
			setTimeout(function () {
				$(".bigImageWrapper").hide();
			}, 1000);
		});

	//첨부파일 다운로드 (새로 추가)
	
	$(".fileUploadResult ul").on("click", "li", function(e){
		
		var objLi = $(this);
		
		var downloadedPathFileName = encodeURIComponent(objLi.data("uploadpath") +"/" +
														objLi.data("uuid")+ "_" +objLi.data("filename"));
		
		if(objLi.data("filetype") == "I"){
			//이미지파일일 경우, 원본이미지를 다운로드 하여 결과표시 영역에 표시
			showImage(downloadedPathFileName.replace(new RegExp(/\\/g),"/"));
		} else { // else if(objLi.data("filetype") == "F"){
			//이미지가 이닐 경우, 다운로드 수행
			self.location = "${contextPath}/fileDownloadAjax?fileName=" +downloadedPathFileName ;
		}
	});

	//파일 삭제:이벤트 위임을 이용하여, 서버에서 파일 삭제, 관련된 브라우저의 항목도 삭제.
	$(".fileUploadResult").on("click", "span", function (e) {
		//$(this).parent().remove();
		//this: span
		var targetFileName = $(this).data("filename");
		var targetFileType = $(this).data("filetype");
		console.log(targetFileName);
		console.log(targetFileType);
		//var targetLi = $(this).closest("li");
		var parentLi = $(this).parent();
		$.ajax({
			url: '${contextPath}/deleteUploadedFile',
			data: {fileName: targetFileName,fileType: targetFileType},
			dataType: 'text',
			type: 'POST',
			success: function (result) {
				if (result == "success") {
					alert("파일이 정상적으로 삭제되었습니다.");
					//이벤트 위임을 이용하여, 삭제된 파일의 항목을 브라우저의 HTML 문서에서 삭제합니다.
					//$(this).parent().remove();(X)
					//$(this).closest("li").remove();(X)
					//targetLi.remove();
					parentLi.remove();
				} else {
					alert("오류: 파일 삭제 실패.");
				}
			}
		}); //End $.ajax
	});
</script>


<%@ include file="../myinclude/myfooter.jsp"%>
