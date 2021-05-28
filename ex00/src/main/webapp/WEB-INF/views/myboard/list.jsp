<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../myinclude/myheader.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">Board - List</h3>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row">
						<div class="col-md-6"
							style="font-size: 18px; height: 45px; padding-top: 14px;">게시글
							목록</div>
						<div class="col-md-6" style="height: 47px; padding-top: 8px;">
							<button type="button" id="btnMoveRegister"
								class="btn btn-primary btn-sm pull-right">새글 등록</button>
						</div>
					</div>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover"
						style="width: 100%; text-align: center;" id="dataTables-example">
						<thead>
							<tr>
								<th style="text-align: center;">번호</th>
								<th style="text-align: center;">제목</th>
								<th style="text-align: center;">작성자</th>
								<th style="text-align: center;">작성일</th>
								<th style="text-align: center;">수정일</th>
								<th style="text-align: center;">조회수</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${boardList}" var="board">
								<%-- 컨트롤러에서 보낸 목록객체 이름: boardList --%>
								<c:if test="${board.bdelFlag == 1}">
									<tr style="background-color: Moccasin; text-align: center">
										<td><c:out value="${board.bno}" /></td>
										<td colspan="5"><em>작성자에 의하여 삭제된 게시글입니다</em></td>
									</tr>
								</c:if>
								<c:if test="${board.bdelFlag ==0 }">
									<%-- 상세 페이지 이동-방법3: tr에 data-bno 속성과 폼, jQuery 이용 --%>
									<tr>
										<td><c:out value="${board.bno}" /></td>
										<td style="text-aling: left;">
											<%-- 상세 페이지 이동-방법1: a 태그만 이용. --%> <%--
											<a class='move' target="_blank" href='${contextPath}/myboard/detail?bno=<c:out value="${board.bno}"/>'>
											<c:out value="${board.btitle}"/>
											</a>
											--%> <%-- 상세 페이지 이동-방법2: a 태그와 form, jQuery 이용. --%> <%--
											<a class='move' target="_self" href='<c:out value="${board.bno}" />'>
											<c:out value="${board.btitle}"/>
											</a>
											--%> <c:out value="${board.btitle}"/>
										</td>
										<td><c:out value="${board.bwriter}" /></td>
										<td><fmt:formatDate pattern="yyyy/MM/dd"
												value="${board.bregDate}" /></td>
										<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
												value="${board.bmodDate}" /></td>
										<%--<td>${board.bregDate}</td> --%>
										<%--<td>${board.bmodDate}</td> --%>
										<td>${board.bviewsCnt}</td>
									</tr>
								</c:if>
							</c:forEach>

						</tbody>
					</table>
					<!-- /.table-responsive -->
					<%-- START 모달 --%>
<%-- Modal --%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">처리결과</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
			</div>
		</div><%-- END .modal-content --%>
	</div><%-- END .modal-dialog --%>
</div><%-- END .modal --%>
<%-- END 모달 --%>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<%-- 상세 페이지 이동-방법2, 3에서 사용되는 form: 목록화면에서 상세 화면 호출 시, 전달할 값들이 저장됨 --%>
	<form id="frmSendValue"></form>

</div>
<!-- /#page-wrapper -->



<%-- (11장: 모달 호출 및 모달을 통한 페이지 이동 문제해결) JQeury 메소드 --%>



<script>
	//새글 등록 버튼 클릭 이벤트 처리: 게시물 등록 화면 이동//////////////////////////////////
	$("#btnMoveRegister").on("click", function() {
		self.location = "${contextPath}/myboard/register";
	})

	//게시물 행이나 제목 클릭 이벤트 처리: 게시물 상세 화면 이동////////////////////////////////
	const frmSendValue = $("#frmSendValue");

	//방법2: 글제목 클릭 시(a 태그), 폼을 통해 detail 화면 요청
	//$(".move").on( "click", function(e) {
	//방법3: tr 태그 클릭 시 폼을 통해 detail 화면 요청
	$(".moveDetail")
			.on(
					"click",
					function(e) {
						//e.preventDefault(); 방법2에서 <a> 태그 기능 방지를 위해 필요
						const bno = $(this).data("bno"); //방법3에서 tr 태그의 bno 값을 변수에 저장

						alert("클릭된 행의 bno" + bno);

						//방법2: a 링크의 값을 전송할 form에 추가
						//frmCallDetailPage.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'/>");

						//방법3: bno 변수에 저장된 값을 전송할 form에 추가
						frmSendValue
								.append("<input type='hidden' name='bno' value='"+ bno +"'/>");

						frmSendValue.attr("action",
								"${contextPath}/myboard/detail");
						frmSendValue.attr("method", "get");

						frmSendValue.submit();
					});
</script>

<!-- <script type="text/javascript">
//모달을 통한 뒤로가기 비활성화 코드
// popstat 이벤트를 처리하는 리스너 추가
window.addEventListener('popstate', function(event) {
	history.pushState(null, null, location.href); //
	})

// 컨트롤러가 전달한 result값을 변수에 저장.
const result = '<c:out value="${result}"/>';

function checkModal(result) {
	if (result === '' || histroy.state){
		return;
	
	} else if (result === 'successModify'){
		const myMsg = "글이 수정되었습니다";
	
	} else if (result === 'successRemove'){
		const myMsg = "글이 삭제되었습니다";
	
	} else if  (parseInt(result) > 0){
		const myMsg = "게시글" +parseInt(result) +" 번이 등록되었습니다.";
	}
	$(".modal-body").html(myMsg);
	$("#myModal").modal("show");
	myMsg='';
	
	}
	
//모달 표시 유무 결정/모달에 표시할 내용 수정/모달 표시 실행 
$(document).ready(function(){
	
	//아래에 선언된 메소드 실행
	checkModal(result);
	
	
	//현재 목록페이지 URL을 강제로 최근URL로 히스토리 객체에 추가
	history.pushState(null, null, location.href);
	
	
	});
	
</script> -->
<%-- (11장: 모달 호출 및 모달을 통한 페이지 이동 문제해결) JQeury 메소드 --%>
<script type="text/javascript">
//모달을 통한 뒤로가기 비활성화 코드

/*//수정코드*/

//popstate 이벤트를 처리하는 리스너 추가 
window.addEventListener('popstate', function(event) {    
	history.pushState(null, null, location.href);	// 다시 push함으로 뒤로가기 Block
})


//컨트롤러가 전달한 result 값을 변수에 저장
var result = '<c:out value="${result}"/>';

function checkModal(result) {
	if (result === ''|| history.state) {
		return;

	} else if (result === 'successModify'){
		var myMsg = "글이 수정되었습니다";
		
	} else if(result === 'successRemove'){
		var myMsg = "글이 삭제되었습니다";

	} else if (parseInt(result) > 0) {
		var myMsg = "게시글 " + parseInt(result) + " 번이 등록되었습니다.";
	}
	$(".modal-body").html(myMsg);
	$("#myModal").modal("show");
	myMsg='';
}

//모달 표시 유무 결정/모달에 표시할 내용 수정/모달 표시 실행
$(document).ready(function() {
	
	//아래에 선언된 메소드 실행
	checkModal(result);
	
	//
	history.pushState(null, null, location.href);
});	

</script>
<%@ include file="../myinclude/myfooter.jsp"%>

