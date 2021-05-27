<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>All Things(만물상회)</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:300,300i,400,400i,600,600i,700,700i|Noto+Sans+KR:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Icon Fonts -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/css/style1.css" rel="stylesheet">
  <!-- Animate.css -->
  <link rel="stylesheet" href="assets/css/animate.css">


  <!-- =======================================================
  * Template Name: Tempo - v4.2.0
  * Template URL: https://bootstrapmade.com/tempo-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
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
      </nav>
      <!-- .navbar -->

    </div>
  </header>
  <!-- End Header -->

  <!-- ======= 메인 설명 Section ======= -->
  <section id="hero">
    <div class="hero-container">
      <h3>Welcome to <strong>올띵스</strong></h3>
      <h2 class="mb-0">당신에겐 당장 필요치 않은 물건이,</h2>
      <h2 class="mt-1">누군가에겐 당장 필요하다면? </h2>
      <a href="#" class="btn-get-started scrollto ">올띵스와 함께하세요</a>
    </div>
  </section><!-- End 메인 설명 -->

  <main id="main">

    <!-- ======= 간단안내 Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="section-title">

          <h3><span>올띵스는?</span></h3>
          <p class="mb-1">효율성 최고 상품부터, 다양한 이야기 공유까지, <br>모두가 행복해지는 올띵스</p>
          <p class="mt-1"> </p>
        </div>

        <div class="row content">
          <div class="col-lg-2"></div>
          <div class="col-lg-4 col-6">
            <p></p>
            <ul class="justify-content-end" style="top:50px; margin-top: 100px;">
              <li><i class="ri-check-double-line"></i>최고의 상품을 저렴하게 구매하고 싶나요?</li>
              <li><i class="ri-check-double-line"></i>집에서 자리만 차지하는 물건을 처분하고 싶나요?</li>
              <li><i class="ri-check-double-line"></i>다양한 친구와 이야기를 나누고 싶나요?</li>
            </ul>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0">
            <img src="./assets/img/logoBig.png" alt="" style="height: 30vh;">
            <!-- <a href="#" class="btn-learn-more">Learn More</a> -->
          </div>
        </div>

      </div>
    </section>
    <!-- End 간단안내 Section -->

        <!-- ======= 지도 Section ======= -->
        <section id="contact" class="contact">
          <div class="container">

            <div class="section-title">
              <h3>당신의 동네가 맞나요?</h3>
            </div>

            <!-- <div>
              <iframe style="border:0; width: 100%; height: 50vh;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen></iframe>
            </div> -->
            <div class="" id="map" style="border:0; width: 100%; height: 50vh;">
              <img src="./assets/img/map.png" alt="">
            </div>

            <!-- <div class="row mt-5">

              <div class="col-lg-4">
                <div class="info">
                  <div class="address">
                    <i class="bi bi-geo-alt"></i>
                    <h4>Location:</h4>
                    <p>A108 Adam Street, New York, NY 535022</p>
                  </div>

                  <div class="email">
                    <i class="bi bi-envelope"></i>
                    <h4>Email:</h4>
                    <p>info@example.com</p>
                  </div>

                  <div class="phone">
                    <i class="bi bi-phone"></i>
                    <h4>Call:</h4>
                    <p>+1 5589 55488 55s</p>
                  </div>

                </div>

              </div>

              <div class="col-lg-8 mt-5 mt-lg-0">

                <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                  <div class="row">
                    <div class="col-md-6 form-group">
                      <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                    </div>
                    <div class="col-md-6 form-group mt-3 mt-md-0">
                      <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                    </div>
                  </div>
                  <div class="form-group mt-3">
                    <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
                  </div>
                  <div class="form-group mt-3">
                    <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
                  </div>
                  <div class="my-3">
                    <div class="loading">Loading</div>
                    <div class="error-message"></div>
                    <div class="sent-message">Your message has been sent. Thank you!</div>
                  </div>
                  <div class="text-center"><button type="submit">Send Message</button></div>
                </form>

              </div>

            </div> -->

          </div>
        </section>
        <!-- End Contact Section -->

    <!-- ======= 상품  Section ======= -->
    <section id="services" class="services">
      <div class="container">
        <div class="text-center">
          <h2 class="nanum-bold">전자제품, 책, 의류 등 모든 것들을 찾을 수 있는 올띵스</h2>
        </div>
        <!-- 최고 인기 상품 -->
        <div class="my-3">
          <div class="dropdown ">
            <button class="btn btn-primary dropdown-toggle fw-bold" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
              최고 인기 상품
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
              <li><a class="dropdown-item" href="#">의류</a></li>
              <li><a class="dropdown-item" href="#">전자기기</a></li>
              <li><a class="dropdown-item" href="#">액세서리</a></li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-md-3 text-center">
            <div class="product-entry">
              <div class="product-img" style="background-image: url(./assets/images/item-6.jpg);">
                <p class="tag"></p>
                <div class="cart">
                  <p>
                    <span class="addtocart"><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></span>
                    <span><a href="product-detail.html"><i class="fas fa-eye"></i></a></span>
                    <span><a href="#"><i class="fas fa-heart"></i></a></span>
                    <span><a href="add-to-wishlist.html">10</a></span>
                  </p>
                </div>
              </div>
              <div class="desc">
                <h3><a class="nanum-bold" href="shop.html">목걸이</a></h3>
                <p class="price"><span>50,000</span>원</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 text-center">
            <div class="product-entry">
              <div class="product-img" style="background-image: url(./assets/images/item-7.jpg);">
                <p class="tag"></p>
                <div class="cart">
                  <p>
                    <span class="addtocart"><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></span>
                    <span><a href="product-detail.html"><i class="fas fa-eye"></i></a></span>
                    <span><a href="#"><i class="fas fa-heart"></i></a></span>
                    <span><a href="add-to-wishlist.html">10</a></span>
                  </p>
                </div>
              </div>
              <div class="desc">
                <h3><a class="nanum-bold" href="shop.html">선글라스</a></h3>
                <p class="price"><span>20,000</span>원</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 text-center">
            <div class="product-entry">
              <div class="product-img" style="background-image: url(./assets/images/item-8.jpg);">
                <p class="tag"></p>
                <div class="cart">
                  <p>
                    <span class="addtocart"><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></span>
                    <span><a href="product-detail.html"><i class="fas fa-eye"></i></a></span>
                    <span><a href="#"><i class="fas fa-heart"></i></a></span>
                    <span><a href="add-to-wishlist.html">10</a></span>
                  </p>
                </div>
              </div>
              <div class="desc">
                <h3><a class="nanum-bold" href="shop.html">트레이닝복</a></h3>
                <p class="price"><span>30,000</span>원</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 text-center">
            <div class="product-entry">
              <div class="product-img" style="background-image: url(./assets/images/item-9.jpg);">
                <p class="tag"></p>
                <div class="cart">
                  <p>
                    <span class="addtocart"><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></span>
                    <span><a href="product-detail.html"><i class="fas fa-eye"></i></a></span>
                    <span><a href="#"><i class="fas fa-heart"></i></a></span>
                    <span><a href="add-to-wishlist.html">10</a></span>
                  </p>
                </div>
              </div>
              <div class="desc">
                <h3><a class="nanum-bold" href="shop.html">남성 정장</a></h3>
                <p class="price"><span>60,000</span>원</p>
              </div>
            </div>
          </div>
        </div>
        <!-- 최신 상품 -->
        <div class="my-3">
          <div class="dropdown ">
            <button class="btn dropdown-toggle fw-bold" style="background: #e9607a; color: white;" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
              카테고리별로 보기
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
              <li><a class="dropdown-item" href="#">의류</a></li>
              <li><a class="dropdown-item" href="#">전자기기</a></li>
              <li><a class="dropdown-item" href="#">액세서리</a></li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-md-3 text-center">
            <div class="product-entry">
              <div class="product-img" style="background-image: url(./assets/images/item-10.jpg);">
                <p class="tag"><span class="new">New</span></p>
                <div class="cart">
                  <p>
                    <span class="addtocart"><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></span>
                    <span><a href="product-detail.html"><i class="fas fa-eye"></i></a></span>
                    <span><a href="#"><i class="fas fa-heart"></i></a></span>
                    <span><a href="add-to-wishlist.html">10</a></span>
                  </p>
                </div>
              </div>
              <div class="desc">
                <h3><a class="nanum-bold" href="shop.html">티셔츠</a></h3>
                <p class="price"><span>10,000</span>원</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 text-center">
            <div class="product-entry">
              <div class="product-img" style="background-image: url(./assets/images/item-11.jpg);">
                <p class="tag"><span class="new">New</span></p>
                <div class="cart">
                  <p>
                    <span class="addtocart"><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></span>
                    <span><a href="product-detail.html"><i class="fas fa-eye"></i></a></span>
                    <span><a href="#"><i class="fas fa-heart"></i></a></span>
                    <span><a href="add-to-wishlist.html">10</a></span>
                  </p>
                </div>
              </div>
              <div class="desc">
                <h3><a class="nanum-bold" href="shop.html">스트라이프 티셔츠</a></h3>
                <p class="price"><span>20,000</span>원</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 text-center">
            <div class="product-entry">
              <div class="product-img" style="background-image: url(./assets/images/item-12.jpg);">
                <p class="tag"><span class="new">New</span></p>
                <div class="cart">
                  <p>
                    <span class="addtocart"><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></span>
                    <span><a href="product-detail.html"><i class="fas fa-eye"></i></a></span>
                    <span><a href="#"><i class="fas fa-heart"></i></a></span>
                    <span><a href="add-to-wishlist.html">10</a></span>
                  </p>
                </div>
              </div>
              <div class="desc">
                <h3><a class="nanum-bold" href="shop.html">니트</a></h3>
                <p class="price"><span>30,000</span>원</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 text-center">
            <div class="product-entry">
              <div class="product-img" style="background-image: url(./assets/images/item-13.jpg);">
                <p class="tag"><span class="new">New</span></p>
                <div class="cart">
                  <p>
                    <span class="addtocart"><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></span>
                    <span><a href="product-detail.html"><i class="fas fa-eye"></i></a></span>
                    <span><a href="#"><i class="fas fa-heart"></i></a></span>
                    <span><a href="add-to-wishlist.html">10</a></span>
                  </p>
                </div>
              </div>
              <div class="desc">
                <h3><a class="nanum-bold" href="shop.html">자켓</a></h3>
                <p class="price"><span>60,000</span>원</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- End 상품 Section -->

    <!-- ======= Features Section ======= -->
    <!-- <section id="features" class="features">
      <div class="container">

        <div class="row">
          <div class="col-lg-3 col-md-4 col-6 col-6">
            <div class="icon-box">
              <i class="ri-store-line" style="color: #ffbb2c;"></i>
              <h3><a href="">Lorem Ipsum</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-6">
            <div class="icon-box">
              <i class="ri-bar-chart-box-line" style="color: #5578ff;"></i>
              <h3><a href="">Dolor Sitema</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="ri-calendar-todo-line" style="color: #e80368;"></i>
              <h3><a href="">Sed perspiciatis</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-6 mt-4 mt-lg-0">
            <div class="icon-box">
              <i class="ri-paint-brush-line" style="color: #e361ff;"></i>
              <h3><a href="">Magni Dolores</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-6 mt-4">
            <div class="icon-box">
              <i class="ri-database-2-line" style="color: #47aeff;"></i>
              <h3><a href="">Nemo Enim</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-6 mt-4">
            <div class="icon-box">
              <i class="ri-gradienter-line" style="color: #ffa76e;"></i>
              <h3><a href="">Eiusmod Tempor</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-6 mt-4">
            <div class="icon-box">
              <i class="ri-file-list-3-line" style="color: #11dbcf;"></i>
              <h3><a href="">Midela Teren</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-6 mt-4">
            <div class="icon-box">
              <i class="ri-price-tag-2-line" style="color: #4233ff;"></i>
              <h3><a href="">Pira Neve</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-6 mt-4">
            <div class="icon-box">
              <i class="ri-anchor-line" style="color: #b2904f;"></i>
              <h3><a href="">Dirada Pack</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-6 mt-4">
            <div class="icon-box">
              <i class="ri-disc-line" style="color: #b20969;"></i>
              <h3><a href="">Moton Ideal</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-6 mt-4">
            <div class="icon-box">
              <i class="ri-base-station-line" style="color: #ff5828;"></i>
              <h3><a href="">Verdo Park</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-6 mt-4">
            <div class="icon-box">
              <i class="ri-fingerprint-line" style="color: #29cc61;"></i>
              <h3><a href="">Flavor Nivelanda</a></h3>
            </div>
          </div>
        </div>

      </div>
    </section> -->
    <!-- End Features Section -->

    <!-- =======  Section ======= -->
    <section id="cta" class="cta">
      <div class="container">

        <div class="text-center">
          <h3>올띵스와 함께하세요</h3>
          <h6 class="mb-3 text-white">당신에겐 당장 필요치 않은 물건이,</h2>
          <h6 class="mt-3 text-white">누군가에겐 당장 필요하다면? </h2>
          <!-- <a class="cta-btn" href="#">Call To Action</a> -->
        </div>

      </div>
    </section>
    <!-- End  Section -->

    <!-- ======= Portfolio Section ======= -->
    <!-- <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="section-title">
          <h2>Portfolio</h2>
          <h3>Check our <span>Portfolio</span></h3>
          <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque vitae autem.</p>
        </div>

        <div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All</li>
              <li data-filter=".filter-app">App</li>
              <li data-filter=".filter-card">Card</li>
              <li data-filter=".filter-web">Web</li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container">

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <img src="assets/img/portfolio/portfolio-1.jpg" class="img-fluid" alt="">
            <div class="portfolio-info">
              <h4>App 1</h4>
              <p>App</p>
              <a href="assets/img/portfolio/portfolio-1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="App 1"><i class="bx bx-plus"></i></a>
              <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <img src="assets/img/portfolio/portfolio-2.jpg" class="img-fluid" alt="">
            <div class="portfolio-info">
              <h4>Web 3</h4>
              <p>Web</p>
              <a href="assets/img/portfolio/portfolio-2.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 3"><i class="bx bx-plus"></i></a>
              <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <img src="assets/img/portfolio/portfolio-3.jpg" class="img-fluid" alt="">
            <div class="portfolio-info">
              <h4>App 2</h4>
              <p>App</p>
              <a href="assets/img/portfolio/portfolio-3.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="App 2"><i class="bx bx-plus"></i></a>
              <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <img src="assets/img/portfolio/portfolio-4.jpg" class="img-fluid" alt="">
            <div class="portfolio-info">
              <h4>Card 2</h4>
              <p>Card</p>
              <a href="assets/img/portfolio/portfolio-4.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Card 2"><i class="bx bx-plus"></i></a>
              <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <img src="assets/img/portfolio/portfolio-5.jpg" class="img-fluid" alt="">
            <div class="portfolio-info">
              <h4>Web 2</h4>
              <p>Web</p>
              <a href="assets/img/portfolio/portfolio-5.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 2"><i class="bx bx-plus"></i></a>
              <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <img src="assets/img/portfolio/portfolio-6.jpg" class="img-fluid" alt="">
            <div class="portfolio-info">
              <h4>App 3</h4>
              <p>App</p>
              <a href="assets/img/portfolio/portfolio-6.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="App 3"><i class="bx bx-plus"></i></a>
              <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <img src="assets/img/portfolio/portfolio-7.jpg" class="img-fluid" alt="">
            <div class="portfolio-info">
              <h4>Card 1</h4>
              <p>Card</p>
              <a href="assets/img/portfolio/portfolio-7.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Card 1"><i class="bx bx-plus"></i></a>
              <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <img src="assets/img/portfolio/portfolio-8.jpg" class="img-fluid" alt="">
            <div class="portfolio-info">
              <h4>Card 3</h4>
              <p>Card</p>
              <a href="assets/img/portfolio/portfolio-8.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Card 3"><i class="bx bx-plus"></i></a>
              <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <img src="assets/img/portfolio/portfolio-9.jpg" class="img-fluid" alt="">
            <div class="portfolio-info">
              <h4>Web 3</h4>
              <p>Web</p>
              <a href="assets/img/portfolio/portfolio-9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 3"><i class="bx bx-plus"></i></a>
              <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
            </div>
          </div>

        </div>

      </div>
    </section> -->
    <!-- End Portfolio Section -->

    <!-- ======= Pricing Section ======= -->
    <!-- <section id="pricing" class="pricing">
      <div class="container">

        <div class="section-title">
          <h2>Pricing</h2>
          <h3>Our Competing <span>Prices</span></h3>
          <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque vitae autem.</p>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="box">
              <h3>Free</h3>
              <h4><sup>$</sup>0<span> / month</span></h4>
              <ul>
                <li>Aida dere</li>
                <li>Nec feugiat nisl</li>
                <li>Nulla at volutpat dola</li>
                <li class="na">Pharetra massa</li>
                <li class="na">Massa ultricies mi</li>
              </ul>
              <div class="btn-wrap">
                <a href="#" class="btn-buy">Buy Now</a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mt-4 mt-md-0">
            <div class="box recommended">
              <span class="recommended-badge">Recommended</span>
              <h3>Business</h3>
              <h4><sup>$</sup>19<span> / month</span></h4>
              <ul>
                <li>Aida dere</li>
                <li>Nec feugiat nisl</li>
                <li>Nulla at volutpat dola</li>
                <li>Pharetra massa</li>
                <li class="na">Massa ultricies mi</li>
              </ul>
              <div class="btn-wrap">
                <a href="#" class="btn-buy">Buy Now</a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mt-4 mt-lg-0">
            <div class="box">
              <h3>Developer</h3>
              <h4><sup>$</sup>29<span> / month</span></h4>
              <ul>
                <li>Aida dere</li>
                <li>Nec feugiat nisl</li>
                <li>Nulla at volutpat dola</li>
                <li>Pharetra massa</li>
                <li>Massa ultricies mi</li>
              </ul>
              <div class="btn-wrap">
                <a href="#" class="btn-buy">Buy Now</a>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section> -->
    <!-- End Pricing Section -->

    <!-- ======= F.A.Q Section ======= -->
    <!-- <section id="faq" class="faq">
      <div class="container">

        <div class="section-title">
          <h2>F.A.Q</h2>
          <h3>Frequently Asked <span>Questions</span></h3>
        </div>

        <ul class="faq-list">

          <li>
            <div data-bs-toggle="collapse" class="collapsed question" href="#faq1">Non consectetur a erat nam at lectus urna duis? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq1" class="collapse" data-bs-parent=".faq-list">
              <p>
                Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq2" class="collapsed question">Feugiat scelerisque varius morbi enim nunc faucibus a pellentesque? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq2" class="collapse" data-bs-parent=".faq-list">
              <p>
                Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq3" class="collapsed question">Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq3" class="collapse" data-bs-parent=".faq-list">
              <p>
                Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq4" class="collapsed question">Ac odio tempor orci dapibus. Aliquam eleifend mi in nulla? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq4" class="collapse" data-bs-parent=".faq-list">
              <p>
                Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq5" class="collapsed question">Tempus quam pellentesque nec nam aliquam sem et tortor consequat? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq5" class="collapse" data-bs-parent=".faq-list">
              <p>
                Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq6" class="collapsed question">Tortor vitae purus faucibus ornare. Varius vel pharetra vel turpis nunc eget lorem dolor? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq6" class="collapse" data-bs-parent=".faq-list">
              <p>
                Laoreet sit amet cursus sit amet dictum sit amet justo. Mauris vitae ultricies leo integer malesuada nunc vel. Tincidunt eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor sed. Ut venenatis tellus in metus vulputate eu scelerisque. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Nibh tellus molestie nunc non blandit massa enim nec.
              </p>
            </div>
          </li>

        </ul>

      </div>
    </section> -->
    <!-- End F.A.Q Section -->

    <!-- ======= Team Section ======= -->
    <!-- <section id="team" class="team">
      <div class="container">

        <div class="section-title">
          <h2>Team</h2>
          <h3>Our Hardworking <span>Team</span></h3>
          <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque vitae autem.</p>
        </div>

        <div class="row">

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/team/team-1.jpg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>Walter White</h4>
                <span>Chief Executive Officer</span>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/team/team-2.jpg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>Sarah Jhonson</h4>
                <span>Product Manager</span>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/team/team-3.jpg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>William Anderson</h4>
                <span>CTO</span>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/team/team-4.jpg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>Amanda Jepson</h4>
                <span>Accountant</span>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section> -->
    <!-- End Team Section -->



  </main>
  <!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">
          <div class="col-6 footer-contact">
            <a href="#"><img src="assets/img/logoKrS.png" alt="" class="img-fluid mb-2" style="height: 10vh;"></a>
            <p class="nanum-bold">
              주식회사올띵스 / 사업자번호 : 123-45-67890 / 대표이사 : 홍길동
            </p>
            <p class="nanum-bold">
              서울시 구로구 시흥대로 163길 33 주호타워 2층 (구로동 1129-1) <br><br>
              <strong>Phone:</strong> 02-123-4567<br>
              <strong>Email:</strong> info@allthings.com<br>
            </p>
          </div>
          <div class="col-6  footer-links">
            <h4>Links</h4>
            <ul class="row">
              <li><i class="bx bx-chevron-right"></i> <a class="nanum-bold" href="#">상품올리기</a></li>
              <li><i class="bx bx-chevron-right"></i> <a class="nanum-bold" href="#">상품들</a></li>
              <li><i class="bx bx-chevron-right"></i> <a class="nanum-bold" href="#">내 근처</a></li>
              <li><i class="bx bx-chevron-right"></i> <a class="nanum-bold" href="#">자유게시판</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="container d-md-flex py-4">

      <div class="me-md-auto text-center text-md-start">
        <div class="copyright">
          &copy; Copyright <strong class="nanum-bold"><span class="nanum-bold">올띵스</span></strong>. All Rights Reserved
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
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
      </div>
    </div>
      <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  </footer>
  <!-- End Footer -->


  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

  <!-- kakaoMap JS File -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9a347490ad194d4505b9eb81535c914"></script>
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