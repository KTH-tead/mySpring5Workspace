<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../myinclude/myheader.jsp"%>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">User Board - Modify</h3>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>게시글 수정-삭제</h4>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
				<form id="frmModify" role="form" method="post">
					<div class="form-group">
						<label>글 번호</label>
						<input class="form-control" value='<c:out value="${board.bno}"/>'
							name="bno" readonly="readonly" />
					</div>
					<div class="form-group">
						<label>글 제목</label>
						<input class="form-control" value='<c:out value="${board.btitle}"/>'
							name="btitle"/>
					</div>
					<div class="form-group">
						<label>글 내용</label>
						<!-- <textarea>와 </textarea>는 한 줄에 작성되어야 데이터베이스 저장 시에 필요 없는 공백이 포함되지 않음 -->
						<textarea class="form-control" rows="3" name="bcontent">
							<c:out value="${board.bcontent}"/>
						</textarea>
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" value='<c:out value="${board.bwriter}"/>'
							name="bwriter" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>최종수정일</label>[등록일시: <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${board.bregDate}"/>]
						<input class="form-control" name="bmodDate" value='<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${board.bregDate}"/>'
							 disabled="disabled"/>
					</div>
					<button type="button" id="BtnModify" data-oper="modify" class="btn btn-default"> 수정</button>
					<button type="button" id="BtnRemove" data-oper="remove" class="btn btn-danger"> 삭제</button>
					<button type="button" id="BtnList" data-oper="list" class="btn btn-info">취소</button>
					<%-- 추가 --%>
					<input type='hidden' name='pageNum' value='${myBoardPagingDTO.pageNum}'>
					<input type='hidden' name='rowAmountPerPage' value='${myBoardPagingDTO.rowAmountPerPage}'>
				</form>
					
					

					
				</div>

				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>


<%-- 상세 페이지 이동-방법2, 3에서 사용되는 form: 목록화면에서 상세 화면 호출 시, 전달할 값들이 저장됨 --%>
<%-- 	<form id="frmSendValue">
		<input type='hidden' name='pageNum'
			value='${pagingCreator.myBoardPagingDTO.pageNum}'> <input
			type='hidden' name='rowAmountPerPage'
			value='${pagingCreator.myBoardPagingDTO.rowAmountPerPage}'> <input
			type='hidden' name='lastPageNum' value='${pagingCreator.lastPageNum}'>
	</form> --%>
	
<script>

//form의 수정/삭제/목록보기 버튼에 따른 동작 제어
const frmModify =$('#frmModify');
$('button').on("click",function(e){
	//e.preventDefault(); //버튼 유형이 submit이 아니므로 설정할 필요 없음
	
	const operation = $(this).data("oper"); //각 버튼의 data-xxx 속성에 설정된 값을 저장.
	
	alert("operation: " +operation);
	
	if(operation == "modify"){ //게시물 수정 요청
		frmModify.attr("action","${contextPath}/myboard/modify");
	} else if(operation == "remove") { //게시물 삭제 요청
		frmModify.attr("action", "${contextPath}/myboard/delete");
	} else if(operation == "list"){ // 게시물 목록 화면 요청
		
		const pageNumInput = $("input[name='pageNum']").clone();
		const rowAmountInput = $("input[name='rowAmountPerPage']").clone();
		
		frmModify.empty(); //form의 모든 input을 삭제
		
		frmModify.attr("action", "${contextPath}/myboard/list").attr("method","get");
		frmModify.append(pageNumInput);
		frmModify.append(rowAmountInput);
	}
	
	frmModify.submit(); // 요청 전송
});
</script>

<!-- /#page-wrapper -->

<%@ include file="../myinclude/myfooter.jsp"%>