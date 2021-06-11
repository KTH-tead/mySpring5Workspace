<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>게시판</title>
	
	<!-- Favicons -->
    <link href="${contextPath}/resources/img/favicon.png" rel="icon">
    
    <!-- Bootstrap Core CSS -->
    <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <%-- <link href="${contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet"> --%>

    <!-- DataTables Responsive CSS -->
	<%--  <link href="${contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet"> --%>

    <!-- Custom CSS -->
    <link href="${contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <%-- <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script> --%>

    <!-- Bootstrap Core JavaScript -->
    <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <%-- <script src="${contextPath}/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="${contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.js"></script> --%>

    <!-- Custom Theme JavaScript -->
    <script src="${contextPath}/resources/dist/js/sb-admin-2.js"></script>
    
</head>

<body id="me">

    <div id="wrapper">

        <!-- Navigation -->
         <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#me">My Admin Board</a> <!-- href 수정 -->
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">

                    <ul class="dropdown-menu dropdown-messages"><%-- 클래스 이름 중 dropdown-user 삭제 --%>
                    	<li><a id="myLogout" href="${contextPath}/login">
								<i class="fa fa-sign-in fa-fw"></i> 
									Sign in
							</a><!-- a 링크 수정, Sign in 으로 수정 -->
						</li>
						<li class="divider"></li>
						<li>
							<a id="myLogout" href="${contextPath}/logout">
								<i class="fa fa-sign-out fa-fw"></i>
									Sign out
							</a><!-- a 링크 수정, Sign out 으로 수정 -->
						</li>
                    </ul>
                </li>
            </ul>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="${contextPath}">
	                            <i class="fa fa-home fa-fw"></i> 
	                            	Main page
                            </a>
                        </li>
                        <li>
                            <a href="${contextPath}/myboard/list">
	                            <i class="fa fa-table fa-fw"></i> 
	                            	User Board
                            </a>
                        </li>
                        <li>
                            <a href="${contextPath}/myboard/register">
	                            <i class="fa fa-edit fa-fw"></i> 
	                            	New Board Register
                            </a>
                        </li>
                        <li>
                            <a href="${contextPath}/login">
	                            <i class="fa fa-sign-in fa-fw"></i> 
	                            	Sign in
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav> 
	</div>