<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../myinclude/myheader.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">User Board - register</h3>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>게시글 등록</h4>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form role="form" action="${contextPath}/myboard/register"
						method="post">
						
						<div class="form-group">
							<label>제목</label> <input class="form-control title" name="btitle" minlength="4">
						</div>
						
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control content" name="bcontent" style="resize : vertical"  minlength="4"></textarea>
						</div>
						
						<div class="form-group">
							<label>작성자</label> <input class="form-control writer" name="bwriter"  minlength="4">
						</div>

						<button type="submit" class="btn btn-primary submit_button">등록</button>
						<button type="button" data-oper="list" class="btn btn-warning"
							onClick="location.href='${contextPath}/myboard/list'">취소</button>
					</form>
					<!-- /.table-responsive -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->
<script>
$(function() {
	console.log($(".title").val().length);
	console.log($(".title").val()===null);
	console.log($(".title").val()==='');
	console.log($(".content").length);
	console.log($(".content").val()===null);
	console.log($(".content").val()==='');
	console.log($(".writer").val().length);
	console.log($(".writer").val()===null);
	console.log($(".writer").val()==='');
	$(".submit_button").on("click", function() {
		if($(".title").val() === '' || $(".title").val().length === 0) {
			alert("입력 요망");
			return false;
		} else {
			return;
		}
	})
})
</script>

<%@ include file="../myinclude/myfooter.jsp"%>