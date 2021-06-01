<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="./myinclude/myheader.jsp" %>

<div id="page-wrapper">
    <div class="row">
	    <div class="col-lg-12">
		    <h3 class="page-header">Hello world!</h3>
	    </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">
                <!-- 로그인 하지 않은 경우-principle: anonymousUser String 객체-->
                <!-- 로그인 한  경우-principle: 로그인 사용자의 Authentication 객체  -->
            <sec:authentication property="principal" var="principal"/>
                <c:choose>
                    <c:when test="${principal eq 'anonymousUser' }">
                        <span>반갑습니다.</span>
                    </c:when>
                    <c:otherwise>
                        <span>${principal.username}님, 반갑습니다.</span>
                    </c:otherwise>
                </c:choose>
		    </h3>
	    </div>
    </div>
    <p> 현재 시간은, <strong>${serverTime}</strong>입니다 </p>
</div>


<%-- 로그아웃으로 홈페이지 이동한 경우에만 실행됨 --%>
    <c:if test="${param.logout != null}">
       <script type="text/javascript">
         $(document).ready(function(){
             alert("로그아웃하였습니다.");
         });
         
       </script>
    </c:if>



<%@ include file="./myinclude/myfooter.jsp" %>

<%-- 
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
 --%>