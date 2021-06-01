<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../myinclude/myheader.jsp" %>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Board - List</h3>
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row -->
    
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-6" style="font-size:18px; height: 45px; padding-top:14px;">게시글 목록</div>
                        <div class="col-md-6" style="height: 47px; padding-top:8px;">
                            <button type="button" id="btnMoveRegister" class="btn btn-primary btn-sm pull-right">새글 등록</button>
                        </div>
                    </div>
                </div>
                
                <div class="panel-body">
                
<%-- 목록 화면에서 상세 페이지 이동(방법2, 3에서), 페이징 화면 이동, 검색 결과의 페이징 이동 시에 사용됨 --%>
<%-- 표시 행수/검색유형/검색어 입력 form 시작 --%>
<form class="form-inline" id="frmSendValue" action="${contextPath}/myboard/myBoardList" method="get">
    <div class="form-group">
        <label class="sr-only">frmSendValues</label>
        <select class="form-control" id="selectAmount" name="rowAmountPerPage">
          <option value="10" <c:out value="${pagingCreator.myBoardPagingDTO.rowAmountPerPage eq '10' ? 'selected' : ''}"/>>10개</option>
          <option value="20" <c:out value="${pagingCreator.myBoardPagingDTO.rowAmountPerPage eq '20' ? 'selected' : ''}"/>>20개</option>
          <option value="50" <c:out value="${pagingCreator.myBoardPagingDTO.rowAmountPerPage eq '50' ? 'selected' : ''}"/>>50개</option>
          <option value="100" <c:out value="${pagingCreator.myBoardPagingDTO.rowAmountPerPage eq '100' ? 'selected' : ''}"/>>100개</option>
        </select>

        <select class="form-control" id="selectScope" name="scope">
            <option value="" <c:out value="${pagingCreator.myBoardPagingDTO.scope == null ? 'selected':''}"/>>검색범위</option>
            <option value="T" <c:out value="${pagingCreator.myBoardPagingDTO.scope eq 'T' ? 'selected' : ''}"/>>제목</option>
            <option value="C" <c:out value="${pagingCreator.myBoardPagingDTO.scope eq 'C' ? 'selected' : ''}"/>>내용</option>
            <option value="W" <c:out value="${pagingCreator.myBoardPagingDTO.scope eq 'W' ? 'selected' : ''}"/>>작성자</option>
            <option value="TC" <c:out value="${pagingCreator.myBoardPagingDTO.scope eq 'TC' ? 'selected' : ''}"/>>제목 + 내용</option>
            <option value="TW" <c:out value="${pagingCreator.myBoardPagingDTO.scope eq 'TW' ? 'selected' : ''}"/>>제목 + 작성자</option>
            <option value="TCW" <c:out value="${pagingCreator.myBoardPagingDTO.scope eq 'TCW' ? 'selected' : ''}"/>>제목 + 내용 + 작성자
            </option>
        </select>
	
        <div class="input-group">
           <input class="form-control" id="inputKeyword" name="keyword" type="text"
                   placeholder="검색어를 입력하세요" value='<c:out value="${pagingCreator.myBoardPagingDTO.keyword}"/>' />
           <span class="input-group-btn">
               <button class="btn btn-info" type="button" id="btnSearchGo">검색 &nbsp;<i class="fa fa-search"></i></button>
           </span>
        </div>

        <div class="input-group">
            <button id="btnReset" class="btn btn-warning" type="reset">검색초기화</button>
        </div>
    </div><%-- /.form-group --%>

    <input type='hidden' name='pageNum' value='${pagingCreator.myBoardPagingDTO.pageNum}'> 
    <input type='hidden' name='lastPageNum' value='${pagingCreator.lastPageNum}'>
</form>
<%-- END 검색범위 및 검색어 입력 폼 --%>
<br>

<%-- 게시물 목록 표시 테이블 시작 --%>
<table class="table table-striped table-bordered table-hover" style="width:100%;text-align:center;">
    <thead>
        <tr>
            <th style="text-align:center;white-space: nowrap;">번호</th>
            <th style="text-align:center;white-space: nowrap;">제목</th>
            <th style="text-align:center;white-space: nowrap;">작성자</th>
            <th style="text-align:center;white-space: nowrap;">작성일</th>
            <th style="text-align:center;white-space: nowrap;">수정일</th>
            <th style="text-align:center;white-space: nowrap;">조회수</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${boardList}" var="board"><%-- 컨트롤러에서 보낸 목록객체 이름: boardList --%>
            <c:if test="${board.bdelFlag == 1}">
                <tr style="background-color:Moccasin; text-align:center;">
                    <td style="vertical-align: middle;"><c:out value="${board.bno}" /></td>
                    <td style="vertical-align: middle;" colspan="5">
                        <em>작성자에 의하여 삭제된 게시글입니다.</em>
                    </td>
                </tr>
            </c:if>
            <c:if test="${board.bdelFlag == 0}">
                <%-- 상세 페이지 이동-방법3:  tr에 data-bno 속성과 폼, jQuery 이용 --%>
                <tr class="moveDetail" data-bno='<c:out value="${board.bno}"/>'>
                    <td style="vertical-align: middle;"><c:out value="${board.bno}" /></td>
                    <td style="vertical-align: middle;text-align:left;">
                        <%-- 상세 페이지 이동-방법1: a 태그만 이용. --%><%--
                        <a class='move' target="_blank" href='${contextPath}/myboard/detail?bno=<c:out value="${board.bno}"/>'>
                            <c:out value="${board.btitle}"/>
                        </a>--%>
                        <%-- 상세 페이지 이동-방법2: a 태그와 form, jQuery 이용.  --%><%--
                        <a class='move' target="_self" href='<c:out value="${board.bno}" />'>
                            <c:out value="${board.btitle}"/>
                        </a>--%>
                        <c:out value="${board.btitle}"/>
                        <small>[댓글수: <strong><c:out value="${board.bcommentCnt}"/></strong>]</small>
                    </td>
                    <td style="vertical-align: middle;"><c:out value="${board.bwriter}" /></td>
                    <td style="vertical-align: middle;">
                        <fmt:formatDate pattern="yyyy/MM/dd" value="${board.bregDate}" />
                        <%-- <br>${board.bregDate} --%>
                    </td>
                    <td style="vertical-align: middle;">
                        <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${board.bmodDate}" />
                        <%-- <br>${board.bmodDate} --%>
                    </td>
                    <td style="vertical-align: middle;">${board.bviewsCnt}</td>
                </tr>
            </c:if>
        </c:forEach>
    </tbody>
</table><!-- /.table-responsive -->
                    

<!-- Pagination 시작 -->
<div class="text-center"><!-- <div class='pull-right'> -->
    <ul class="pagination pagination-sm">
        <!-- 아래의 페이징 버튼 클릭 시, jQuery에 페이지 번호가 전달되도록 a 태그에 전달된 pagingCreator 객체의 필드 지정  -->
        <!-- 맨 앞으로 -->
        <c:if test="${pagingCreator.prev}">
            <li class="paginate_button previous">
                <a href="1">&laquo;</a>
            </li>
        </c:if>
        
        <c:if test="${pagingCreator.prev}">
            <li class="paginate_button previous">
                <a href="${pagingCreator.startPagingNum - 1}">이전</a>
            </li>
        </c:if>
        
        <c:forEach var="pageNum" begin="${pagingCreator.startPagingNum}" end="${pagingCreator.endPagingNum}">
            <!-- 선택된 숫자의 경우, Bootstrap의 active 클래스 이름 추가  -->
            <li class='paginate_button ${pagingCreator.myBoardPagingDTO.pageNum == pageNum ? "active":"" }'>
                <a href="${pageNum}">${pageNum}</a>
            </li>
        </c:forEach>
        
        <c:if test="${pagingCreator.next}">
            <li class="paginate_button next">
                <a href="${pagingCreator.endPagingNum +1}">다음</a>
            </li>
        </c:if>
        
        <%-- 맨 마지막으로 --%>
        <c:if test="${pagingCreator.next}">
           <li class="paginate_button next">
               <a href="${pagingCreator.lastPageNum}">&raquo;</a>
           </li>
       </c:if>
    </ul>
</div>
<!-- Pagination 끝 -->

<%-- 삭제 설정된 게시물 삭제 화면 테스트 용 요소 --%><%-- 
<div>
    <form method="post" action="${contextPath}/myboard/myBoardRemoveAll">
        <button type="submit" id="btnRemoveAllSetDelted" class="btn btn-danger">
            <span>삭제요청된 게시물 일괄 삭제</span>
        </button>
    </form>
    
    <h4><span>삭제된 행 수:</span>${removedRowCnt}</h4>
</div>--%>                    
                    
                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row -->
</div><!-- /#page-wrapper -->

<%-- 상세 페이지 이동-방법2, 3에서 사용되는 form: 목록화면에서 상세 화면 호출 시, 전달할 값들이 저장됨 --%>
<%-- 검색페이징 시 상단 이동 --%><%-- 
<form id="frmSendValue">
    <input type='hidden' name='pageNum' value='${pagingCreator.myBoardPagingDTO.pageNum}'> 
    <input type='hidden' name='rowAmountPerPage' value='${pagingCreator.myBoardPagingDTO.rowAmountPerPage}'>
    <input type='hidden' name='lastPageNum' value='${pagingCreator.lastPageNum}'>
</form> --%>


<script>
<%--//새글 등록 버튼 클릭 이벤트 처리: 게시물 등록 화면 이동--%> 
$("#btnMoveRegister").on("click", function(){
    self.location = "${contextPath}/myboard/myBoardRegister";
})


<%--게시물 행이나 제목 클릭 이벤트 처리: 게시물 상세 화면 이동--%>
var frmSendValue = $("#frmSendValue");

<%--방법2: 글제목 클릭 시(a 태그), 폼을 통해 detail 화면 요청--%> 
//$(".move").on( "click", function(e) {
    	
<%--방법3: tr 태그 클릭 시 폼을 통해 detail 화면 요청--%> 
$(".moveDetail").on( "click", function(e) {

	<%--방법2에서 <a> 태그 기능 방지를 위해 필요--%>
    //e.preventDefault();    
    
    <%--방법3에서 tr 태그의 bno 값을 변수에 저장--%>
    var bno = $(this).data("bno");
    alert("클릭된 행의 bno" + bno);
    
    <%--방법2: a 링크의 값을 전송할 form에 추가 --%> 
    //frmCallDetailPage.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'/>");
    
    <%--방법3: bno 변수에 저장된 값을 전송할 form에 추가--%> 
    frmSendValue.append("<input type='hidden' name='bno' value='" + bno + "'/>");
    
    <%--방법2와 3에서 공통 사용--%>
    frmSendValue.attr("action", "${contextPath}/myboard/myBoardDetail");
    frmSendValue.attr("method", "get");
    frmSendValue.submit();
});

<%--//페이징 버튼 클릭 이벤트 처리: 폼에 저장된 페이지번호를 클릭한 페이지번호로 변경한 후, 전송 --%>
<%--//페이징 화면이동--%>
$(".paginate_button a").on( "click", function(e) {

    e.preventDefault();   <%--a 태그의 동작 막음--%>
    //alert("페이징번호 클릭함");
    
    <%--폼에 저장된 현재 화면의 페이지번호를 클릭한 페이징 버튼의 페이지번호로 변경--%>
    frmSendValue.find("input[name='pageNum']").val($(this).attr("href"));
    frmSendValue.attr("action", "${contextPath}/myboard/myBoardList");
    frmSendValue.attr("method", "get");
    frmSendValue.submit();
});

<%--//표시행수 변경 이벤트 처리--%>
$("#selectAmount").on("change", function(){

    frmSendValue.find("input[name='pageNum']").val(1);
    frmSendValue.attr("action", "${contextPath}/myboard/myBoardList");
    frmSendValue.attr("method", "get");
    frmSendValue.submit();
});

<%--검색버튼 클릭 이벤트 처리--%>
$("#btnSearchGo").on("click", function(e) {

    if (!$("#selectScope").find("option:selected").val()) {
        alert("검색범위를 선택하세요");
        return false;
    }

    if (!frmSendValue.find("input[name='keyword']").val()) {
        alert("검색어를 입력하세요");
        return false;
    }

    frmSendValue.find("input[name='pageNum']").val("1");
    //e.preventDefault();
    frmSendValue.submit();
}); 

<%--검색초기화 버튼 이벤트처리--%>
$("#btnReset").on("click", function(){

    $("#selectAmount").val(10);
    $("#selectScope").val("");
    $("#inputKeyword").val("") ;
    $("#hiddenPageNum").val(1);
    $("#hiddenLastPageNum").val("");

    frmSendValue.submit();
});

</script>

<%@ include file="../myinclude/myfooter.jsp" %>         