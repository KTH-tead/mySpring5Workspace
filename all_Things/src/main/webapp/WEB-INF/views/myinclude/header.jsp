<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>All Things(만물상회)</title>

<!-- Favicons -->
<link href="${contextPath}/resources/assets/img/favicon.png" rel="icon">
<link href="${contextPath}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans:300,300i,400,400i,600,600i,700,700i|Noto+Sans+KR:300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="${contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Icon Fonts -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${contextPath}/resources/assets/css/style.css" rel="stylesheet">
<link href="${contextPath}/resources/assets/css/style1.css" rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="${contextPath}/resources/assets/css/animate.css">

 <!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->

	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

	<!-- kakaoMap JS File -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9a347490ad194d4505b9eb81535c914"></script>
		
</head>
<body id="me">

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
		<div
			class="container d-flex align-items-center justify-content-between">

			<h1 class="col-2 logo">
				<a class="img-fluid" href="index.html"> <img
					src="assets/img/logoKrH.png" alt="" class="w-100">
				</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto " href="#me">Home</a></li>
					<li><a class="nav-link scrollto" href="#me">상품올리기</a></li>
					<li><a class="nav-link scrollto" href="blog.html">상품들</a></li>
					<li><a class="nav-link scrollto" href="#me">내 근처</a></li>
					<li><a class="nav-link scrollto" href="#me">자유게시판</a></li>
					<li><a class="nav-link scrollto " href="#me">Login</a></li>
					<li><a class="nav-link scrollto " href="#me">마이페이지</a></li>
					<li><a class="nav-link scrollto " href="">관리자</a></li>
					<!-- <li class="dropdown"><a href="#me"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#me">Drop Down 1</a></li>
              <li class="dropdown"><a href="#me"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#me">Deep Drop Down 1</a></li>
                  <li><a href="#me">Deep Drop Down 2</a></li>
                  <li><a href="#me">Deep Drop Down 3</a></li>
                  <li><a href="#me">Deep Drop Down 4</a></li>
                  <li><a href="#me">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#me">Drop Down 2</a></li>
              <li><a href="#me">Drop Down 3</a></li>
              <li><a href="#me">Drop Down 4</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li> -->
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->
	