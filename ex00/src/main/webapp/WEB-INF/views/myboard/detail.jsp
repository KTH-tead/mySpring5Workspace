<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../myinclude/myheader.jsp"%>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">User Board - Detail</h3>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>게시글 상세 -<small>조회수: <c:out value="${board.bviewsCnt }"/></small></h4>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="form-group">
						<label>글 번호</label>
						<input class="form-control" value='<c:out value="${board.bno}"/>'
							name="bno" readonly="readonly" />
					</div>
					<div class="form-group">
						<label>글 제목</label>
						<input class="form-control" value='<c:out value="${board.btitle}"/>'
							name="btitle" readonly="readonly"/>
						</div>
					<div class="form-group">
						<label>글 내용</label>
						<textarea class="form-control" rows="3" name="bcontent"
							readonly="readonly"><c:out value="${board.bcontent}"/>
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
							 readonly="readonly"/>
					</div>
					<button type="button" id="BtnMoveModify" data-oper="modify" class="btn btn-default"> 수정</button>
					<button type="button" id="BtnMoveList" data-oper="list" class="btn btn-info">목록</button>
					
				</div>

				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>

<%-- 상세 페이지 이동-방법2, 3에서 사용되는 form: 목록화면에서 상세 화면 호출 시, 전달할 값들이 저장됨 --%>
	<form id="frmSendValue">
		<input type='hidden' name='pageNum' value='${pagingCreator.myBoardPagingDTO.pageNum}'> 
		<input type='hidden' name='rowAmountPerPage' value='${pagingCreator.myBoardPagingDTO.rowAmountPerPage}'> 
		<input type='hidden' name='lastPageNum' value='${pagingCreator.lastPageNum}'>
	</form>
	
	
<script>
const frmSendValue = $("#frmSendValue");

$("#BtnMoveModify").on("click", function(){
	//location.href='${contextPath}/myboard/modify?bno=<c:out value="${board.bno}"/>';
	frmSendValue.attr("action", "${contextPath}/myboard/modify");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
})
$("#BtnMoveList").on("click",function(){
	//location.href="${contextPath}/myboard/list";
	frmSendValue.find("#bno").remove();// 목록화면 이동 시, bno 값 삭제
	frmSendValue.attr("action", "${contextPath}/myboard/list");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
}) 
</script>
<!-- /#page-wrapper -->

<%@ include file="../myinclude/myfooter.jsp"%>