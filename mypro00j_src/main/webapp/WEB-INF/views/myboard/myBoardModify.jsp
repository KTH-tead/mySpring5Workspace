<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../myinclude/myheader.jsp" %>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Board - Modify</h3>
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row -->
    
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-heading"><h4>게시글 수정-삭제</h4></div>
                </div>
                <div class="panel-body">
                
            <form id="frmModify" role="form" method="post">
                
                <div class="form-group">
                    <label>글번호</label>
                    <input class="form-control" value='<c:out value="${board.bno}"/>'
                           name="bno" readonly="readonly" />
                </div>
                <div class="form-group">
                    <label>글제목</label>
                    <input class="form-control" value='<c:out value="${board.btitle}"/>'
                           name="btitle" />
                </div>
                
                <div class="form-group">
                    <label>글내용</label>
                    <!-- <textarea>와 </textarea>는 한 줄에 작성되어야 데이터베이스 저장 시에 필요 없는 공백이 포함되지 않음 -->
                    <textarea class="form-control" rows="3" name="bcontent"
                     ><c:out value="${board.bcontent}"/></textarea>
                </div>
                
                <div class="form-group">
                    <label>작성자</label>
                    <input class="form-control" value='<c:out value="${board.bwriter}"/>'
                           name="bwriter" readonly="readonly"/>
                </div>
                
                <div class="form-group">
                    <label>최종수정일</label> [등록일시: <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
                                                                   value="${board.bregDate}"/>]
                    <input class="form-control" name="bmodDate"
                           value='<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
                                                  value="${board.bmodDate}"/>'
                           disabled="disabled" />
                </div>
        <sec:authorize access="isAuthenticated()" ><%--로그인 유무 확인--%>
            <sec:authentication property="principal" var="principal"/><%-- 로그인 계정 변수화 --%>
            <c:if test="${principal.username eq board.bwriter}">
                <button type="button" id="btnModify" data-oper="modify" class="btn btn-default" >수정</button>
                <button type="button" id="btnRemove" data-oper="remove" class="btn btn-danger">삭제</button>
            </c:if>
        </sec:authorize>
                <button type="button" id="btnList" data-oper="list" class="btn btn-info">취소(목록)</button>                <input type='hidden' name='pageNum' value='${myBoardPagingDTO.pageNum}'>
	            <input type='hidden' name='rowAmountPerPage' value='${myBoardPagingDTO.rowAmountPerPage}'>
                <input type='hidden' name='scope' value='${myBoardPagingDTO.scope}'>
                <input type='hidden' name='keyword' value='${myBoardPagingDTO.keyword}'>
                <sec:csrfInput/> 
            </form><%-- form 종료 태그 위에 csrfInput 토큰 태그 추가 --%>


                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row -->
</div><!-- /#page-wrapper -->

<script>

<%--form의 수정/삭제/목록보기 버튼에 따른 동작 제어--%>

var frmModify = $("#frmModify");

var loginUser = "";

<sec:authorize access="isAuthenticated()">
    loginUser = '<sec:authentication property="principal.username"/>';
</sec:authorize>

 
$('button').on("click", function(e){ 

    <%--각 버튼의 data-xxx 속성에 설정된 값을 저장--%>
    var operation = $(this).data("oper");  
    //alert("operation: "+ operation);
    
    var bwriterVal = '<c:out value="${board.bwriter}"/>';


<%--취소(목록)을 먼저 처리 후, 수정 삭제 처리 순서로 if 절 수정 --%>

    if (operation == "list"){

        var bnoInput = $("input[name='bno']").clone();
        var pageNumInput = $("input[name='pageNum']").clone();
        var rowAmountInput = $("input[name='rowAmountPerPage']").clone();
        var scopeInput = $("input[name='scope']").clone();
        var keywordInput = $("input[name='keyword']").clone();
    
        console.log("pageNumInput의 값 " + pageNumInput.val());
        console.log("rowAmountInput의 값 " + rowAmountInput);
    
        frmModify.empty(); //form의 모든 input을 삭제
    
        frmModify.attr("action","${contextPath}/myboard/myBoardList").attr("method","get");
        frmModify.append(bnoInput);
        frmModify.append(pageNumInput);
        frmModify.append(rowAmountInput);
        frmModify.append(scopeInput);
        frmModify.append(keywordInput);
    
    } else {
        <%--로그인 안 한 경우--%>
        if(!loginUser){
            alert("로그인 후, 수정/삭제가 가능합니다.");
            return ;
        }
        <%--로그인 계정과 작성자가 다른 경우--%>
        if(bwriterVal != loginUser){
            alert("작성자만 수정/삭제가 가능합니다");
            return ;
        }
    
        if(operation == "modify"){  //게시물 수정 요청
    	    frmModify.attr("action", "${contextPath}/myboard/myBoardModify").attr("method","post");

        } else if(operation == "remove"){  //게시물 삭제 요청
            frmModify.attr("action", "${contextPath}/myboard/myBoardDelete").attr("method","post");//bdelFlag만업데이트
            //frmModify.attr("action", "${contextPath}/myboard/remove").attr("method","post"); //삭제됨
        } 
    }

    frmModify.submit();
});

</script>




<%@ include file="../myinclude/myfooter.jsp" %>         