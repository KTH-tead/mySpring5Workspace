<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<header id="header" class="fixed-top">
  <div class="container d-flex align-items-center justify-content-between">

    <h1 class="col-2 logo">
      <a class="img-fluid" href="index.html">
        <img src="assets/img/logoKrH.png" alt="" class="w-100">
      </a>
    </h1>
    <!-- Uncomment below if you prefer to use an image logo -->
    <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

    <nav id="navbar" class="navbar">
      <ul>
        <li><a class="nav-link scrollto " href="#">Home</a></li>
        <li><a class="nav-link scrollto" href="#">상품올리기</a></li>
        <li><a class="nav-link scrollto" href="blog.html">상품들</a></li>
        <li><a class="nav-link scrollto" href="#">내 근처</a></li>
        <li><a class="nav-link scrollto" href="#">자유게시판</a></li>
        <li><a class="nav-link scrollto " href="#">Login</a></li>
        <li><a class="nav-link scrollto " href="#">마이페이지</a></li>
        <li><a class="nav-link scrollto " href="">관리자</a></li>
        <!-- <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li> -->
      </ul>
      <i class="bi bi-list mobile-nav-toggle"></i>
    </nav><!-- .navbar -->

  </div>
</header>