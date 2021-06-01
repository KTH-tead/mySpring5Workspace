<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%-- 
		<footer class="navbar navbar-default bs-docs-footer" style="background-color:lightgrey; margin-bottom: 0">
			<div class="container" style="text-align:center;">
				<div class="text-muted" >
					Maintained by the 
					<a href="https://github.com/orgs/twbs/people">
						core team
					</a> 
					with the help of 
					<a href="https://github.com/twbs/bootstrap/graphs/contributors"> 
						our contributors
					</a>.<br> 
					Code licensed 
					<a href="https://github.com/twbs/bootstrap/blob/v3-dev/LICENSE" rel="license noopener" target="_blank">
						MIT
					</a>,
					docs
					<a href="https://creativecommons.org/licenses/by/3.0/" rel="license noopener" target="_blank">
						CC BY 3.0
					</a>.
				</div>
				<br>
				<div class="text-muted">
					Copyright © Your Website 2020
				</div>
			</div>
		</footer>	
 --%>


    </div><!-- /#wrapper -->

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<%--
    <script>
/*    
    //모바일크기에서 사이드바 상단 펼쳐짐 버그 수정
    function sideBarFold() {
        window.onbeforeunload = function (e) {
            $(".sidebar-nav")
                .attr("class","sidebar-nav navbar-collapse collapse")
                .attr("aria-expanded",'false')
                .attr("style","height:1px");
            
            $(".nav-second-level")
                .attr("class","nav nav-second-level collapse")
                .attr("aria-expanded","false")
                .attr("style","height: 1px");
        };
    }
*/    
    $(document).ready(function() {
        //Bootstrap의 컬럼 정렬, 페이징 기능 등 DataTable 반응기능 활성화
        $('#dataTables-example').DataTable({
            responsive: true
        });
        //sideBarFoldFix();
    });
    </script>
--%>

</body>

</html>

