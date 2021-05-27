<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	
	<!-- ======= Footer ======= -->
	<footer id="footer">

		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-6 footer-contact">
						<a href="#me"><img src="assets/img/logoKrS.png" alt=""
							class="img-fluid mb-2" style="height: 10vh;"></a>
						<p class="nanum-bold">주식회사올띵스 / 사업자번호 : 123-45-67890 / 대표이사 :
							홍길동</p>
						<p class="nanum-bold">
							서울시 구로구 시흥대로 163길 33 주호타워 2층 (구로동 1129-1) <br> <br> <strong>Phone:</strong>
							02-123-4567<br> <strong>Email:</strong> info@allthings.com<br>
						</p>
					</div>
					<div class="col-6  footer-links">
						<h4>Links</h4>
						<ul class="row">
							<li><i class="bx bx-chevron-right"></i> <a
								class="nanum-bold" href="#me">상품올리기</a></li>
							<li><i class="bx bx-chevron-right"></i> <a
								class="nanum-bold" href="#me">상품들</a></li>
							<li><i class="bx bx-chevron-right"></i> <a
								class="nanum-bold" href="#me">내 근처</a></li>
							<li><i class="bx bx-chevron-right"></i> <a
								class="nanum-bold" href="#me">자유게시판</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="container d-md-flex py-4">

			<div class="me-md-auto text-center text-md-start">
				<div class="copyright">
					&copy; Copyright <strong class="nanum-bold"><span
						class="nanum-bold">올띵스</span></strong>. All Rights Reserved
				</div>
				<!-- <div class="credits">
           All the links in the footer should remain intact.
           You can delete the links only if you purchased the pro version.
           Licensing information: https://bootst7rapmade.com/license/
           Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/tempo-free-onepage-bootstrap-theme/
           Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div> -->
			</div>
			<div class="social-links text-center text-md-right pt-3 pt-md-0">
				<a href="#me" class="twitter"><i class="bx bxl-twitter"></i></a> <a
					href="#me" class="facebook"><i class="bx bxl-facebook"></i></a> <a
					href="#me" class="instagram"><i class="bx bxl-instagram"></i></a>
			</div>
		</div>
		<a href="#me"
			class="back-to-top d-flex align-items-center justify-content-center"><i
			class="bi bi-arrow-up-short"></i></a>

	</footer>
	<!-- End Footer -->

	<script>
    const container = document.getElementById('map');
    const options = {
      center: new kakao.maps.LatLng(37.481979, 126.898294),
      level: 2
    };

    const map = new kakao.maps.Map(container, options);
    const markerPosition = new kakao.maps.LatLng(37.481979, 126.898294);

      // 마커를 생성합니다
      const marker = new kakao.maps.Marker({
        position: markerPosition
      });

      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);
  </script>



</body>

</html>