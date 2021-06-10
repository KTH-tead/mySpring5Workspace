<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<!DOCTYPE html>
	
	<html lang="ko">
		<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>Login</title>
			<!-- Bootstrap Core CSS -->
			<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
			<!-- MetisMenu CSS -->
			<link href="${contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
			<!-- Custom CSS -->
			<link href="${contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">
			<!-- Custom Fonts -->
			<link href="${contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="login-panel panel panel-default" style="margin-top: 10%">
						<div class="panel-heading">
							<h2 class="panel-title">로그인 하세요</h2>
						</div>
						<div class="panel-body">
							<div>
								<h5 class="text-muted">
									<c:out value="${error}" />
								</h5>
							</div>
							<form role="form" method='post' action="${contextPath}/login"> <!-- method, action 속성 추가 -->
								<fieldset> <!-- fieldset 요소 추가 -->
									<h6 class="text-muted"> <c:out value="${error}" /> </h6>
									<h6 class="text-muted"> <c:out value="${logout}" /> </h6>
								</fieldset>
								<fieldset>
									<div class="form-group">
										<input class="form-control" name="username" id="username" type="text" 
										placeholder="Username 입력" required autofocus> <!-- required 속성 추가 -->
									</div>
									<div class="form-group">
										<input class="form-control" name="password" id="password" type="password" 
										placeholder="Password 입력" required> <!-- value 속성 삭제, required 속성 추가 -->
									</div>
									<div class="checkbox">
										<label> 
											<input name="remember-me" type="checkbox">자동로그인(Remember Me) <!-- name 속성 확인, value 속성 삭제 -->
										</label>
									</div>
									<div>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /><!-- div 추가 됨 -->
									</div>
									<!-- Change this to a button or input when using this as a form -->
									<!-- <a href="index.html" class="btn btn-lg btn-success btn-block">Login</a> -->
									<!-- a 요소를 주석처리 후 -->
									<div>
										<button type='submit' class="btn btn-lg btn-success btn-block">Sign in</button> <!-- button 으로 수정 -->
									</div>
								</fieldset>
								<fieldset>
									<hr>
										<h6 class="text-muted text-center"> 
											<c:out value="${normal}" /> <!-- fieldset 내용 추가 -->
										</h6>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<!-- myheader.jsp에서 복사 붙여넣기 -->
		<!-- Bootstrap Core JavaScript -->
		<script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!-- Metis Menu Plugin JavaScript -->
		<script src="${contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>
		<!-- Custom Theme JavaScript -->
		<script src="${contextPath}/resources/dist/js/sb-admin-2.js"></script>
	</body>
	</html>