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
            <h3 class="page-header">Board - Register</h3>
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row -->
    
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading"><h4>게시글 등록</h4></div>
                <div class="panel-body">

                    <form role="form" action="${contextPath}/myboard/myBoardRegister" method="post" >
                        <div class="form-group">
                            <label>제목</label> <input class="form-control" name="btitle">
                        </div>
                        
                        <div class="form-group">
                            <label>내용</label> <textarea class="form-control" rows="3" name="bcontent"></textarea>
                        </div>
                        
                        <div class="form-group">
                            <label>작성자</label> 
                            <input class="form-control" name="bwriter"
                                   value='<sec:authentication property="principal.username"/>'
                                   readonly="readonly">

                        </div>
                        
                        <button type="submit" class="btn btn-primary">등록</button>
                        <button type="button" data-oper="list" class="btn btn-warning"
                                onClick="location.href='${contextPath}/myboard/myBoardList'">취소
                        </button>
                        <sec:csrfInput /> 
                    </form>


                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row -->
</div><!-- /#page-wrapper -->


<%@ include file="../myinclude/myfooter.jsp" %>         