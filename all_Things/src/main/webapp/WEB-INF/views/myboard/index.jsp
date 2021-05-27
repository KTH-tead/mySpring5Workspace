<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../myinclude/header.jsp" %>

	<!-- ======= 메인 설명 Section ======= -->
	<section id="hero">
		<div class="hero-container">
			<h3>
				Welcome to <strong>올띵스</strong>
			</h3>
			<h2 class="mb-0">당신에겐 당장 필요치 않은 물건이,</h2>
			<h2 class="mt-1">누군가에겐 당장 필요하다면?</h2>
			<a href="#me" class="btn-get-started scrollto ">올띵스와 함께하세요</a>
		</div>
	</section>
	<!-- End 메인 설명 -->

	<main id="main">

		<!-- ======= 간단안내 Section ======= -->
		<section id="about" class="about">
			<div class="container">

				<div class="section-title">

					<h3>
						<span>올띵스는?</span>
					</h3>
					<p class="mb-1">
						효율성 최고 상품부터, 다양한 이야기 공유까지, <br>모두가 행복해지는 올띵스
					</p>
					<p class="mt-1"></p>
				</div>

				<div class="row content">
					<div class="col-lg-2"></div>
					<div class="col-lg-4 col-6">
						<p></p>
						<ul class="justify-content-end"
							style="top: 50px; margin-top: 100px;">
							<li><i class="ri-check-double-line"></i>최고의 상품을 저렴하게 구매하고
								싶나요?</li>
							<li><i class="ri-check-double-line"></i>집에서 자리만 차지하는 물건을
								처분하고 싶나요?</li>
							<li><i class="ri-check-double-line"></i>다양한 친구와 이야기를 나누고
								싶나요?</li>
						</ul>
					</div>
					<div class="col-lg-6 pt-4 pt-lg-0">
						<img src="./assets/img/logoBig.png" alt="" style="height: 30vh;">
						<!-- <a href="#me" class="btn-learn-more">Learn More</a> -->
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
				<div class="" id="map" style="border: 0; width: 100%; height: 50vh;">
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
		<!-- End 지도 Section -->

		<!-- ======= 상품  Section ======= -->
		<section id="services" class="services">
			<div class="container">
				<div class="text-center">
					<h2 class="nanum-bold">전자제품, 책, 의류 등 모든 것들을 찾을 수 있는 올띵스</h2>
				</div>
				<!-- 최고 인기 상품 -->
				<div class="my-3">
					<div class="dropdown ">
						<button class="btn btn-primary dropdown-toggle fw-bold"
							type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">최고 인기 상품</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="#me">의류</a></li>
							<li><a class="dropdown-item" href="#me">전자기기</a></li>
							<li><a class="dropdown-item" href="#me">액세서리</a></li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img"
								style="background-image: url(./assets/images/item-6.jpg);">
								<p class="tag"></p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="cart.html"><i
												class="fas fa-shopping-cart"></i></a></span> <span><a
											href="product-detail.html"><i class="fas fa-eye"></i></a></span> <span><a
											href="#me"><i class="fas fa-heart"></i></a></span> <span><a
											href="add-to-wishlist.html">10</a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a class="nanum-bold" href="shop.html">목걸이</a>
								</h3>
								<p class="price">
									<span>50,000</span>원
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img"
								style="background-image: url(./assets/images/item-7.jpg);">
								<p class="tag"></p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="cart.html"><i
												class="fas fa-shopping-cart"></i></a></span> <span><a
											href="product-detail.html"><i class="fas fa-eye"></i></a></span> <span><a
											href="#me"><i class="fas fa-heart"></i></a></span> <span><a
											href="add-to-wishlist.html">10</a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a class="nanum-bold" href="shop.html">선글라스</a>
								</h3>
								<p class="price">
									<span>20,000</span>원
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img"
								style="background-image: url(./assets/images/item-8.jpg);">
								<p class="tag"></p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="cart.html"><i
												class="fas fa-shopping-cart"></i></a></span> <span><a
											href="product-detail.html"><i class="fas fa-eye"></i></a></span> <span><a
											href="#me"><i class="fas fa-heart"></i></a></span> <span><a
											href="add-to-wishlist.html">10</a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a class="nanum-bold" href="shop.html">트레이닝복</a>
								</h3>
								<p class="price">
									<span>30,000</span>원
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img"
								style="background-image: url(./assets/images/item-9.jpg);">
								<p class="tag"></p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="cart.html"><i
												class="fas fa-shopping-cart"></i></a></span> <span><a
											href="product-detail.html"><i class="fas fa-eye"></i></a></span> <span><a
											href="#me"><i class="fas fa-heart"></i></a></span> <span><a
											href="add-to-wishlist.html">10</a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a class="nanum-bold" href="shop.html">남성 정장</a>
								</h3>
								<p class="price">
									<span>60,000</span>원
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- 최신 상품 -->
				<div class="my-3">
					<div class="dropdown ">
						<button class="btn dropdown-toggle fw-bold"
							style="background: #e9607a; color: white;" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">카테고리별로 보기</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="#me">의류</a></li>
							<li><a class="dropdown-item" href="#me">전자기기</a></li>
							<li><a class="dropdown-item" href="#me">액세서리</a></li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img"
								style="background-image: url(./assets/images/item-10.jpg);">
								<p class="tag">
									<span class="new">New</span>
								</p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="cart.html"><i
												class="fas fa-shopping-cart"></i></a></span> <span><a
											href="product-detail.html"><i class="fas fa-eye"></i></a></span> <span><a
											href="#me"><i class="fas fa-heart"></i></a></span> <span><a
											href="add-to-wishlist.html">10</a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a class="nanum-bold" href="shop.html">티셔츠</a>
								</h3>
								<p class="price">
									<span>10,000</span>원
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img"
								style="background-image: url(./assets/images/item-11.jpg);">
								<p class="tag">
									<span class="new">New</span>
								</p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="cart.html"><i
												class="fas fa-shopping-cart"></i></a></span> <span><a
											href="product-detail.html"><i class="fas fa-eye"></i></a></span> <span><a
											href="#me"><i class="fas fa-heart"></i></a></span> <span><a
											href="add-to-wishlist.html">10</a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a class="nanum-bold" href="shop.html">스트라이프 티셔츠</a>
								</h3>
								<p class="price">
									<span>20,000</span>원
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img"
								style="background-image: url(./assets/images/item-12.jpg);">
								<p class="tag">
									<span class="new">New</span>
								</p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="cart.html"><i
												class="fas fa-shopping-cart"></i></a></span> <span><a
											href="product-detail.html"><i class="fas fa-eye"></i></a></span> <span><a
											href="#me"><i class="fas fa-heart"></i></a></span> <span><a
											href="add-to-wishlist.html">10</a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a class="nanum-bold" href="shop.html">니트</a>
								</h3>
								<p class="price">
									<span>30,000</span>원
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img"
								style="background-image: url(./assets/images/item-13.jpg);">
								<p class="tag">
									<span class="new">New</span>
								</p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="cart.html"><i
												class="fas fa-shopping-cart"></i></a></span> <span><a
											href="product-detail.html"><i class="fas fa-eye"></i></a></span> <span><a
											href="#me"><i class="fas fa-heart"></i></a></span> <span><a
											href="add-to-wishlist.html">10</a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a class="nanum-bold" href="shop.html">자켓</a>
								</h3>
								<p class="price">
									<span>60,000</span>원
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- End 상품 Section -->

		<!-- =======footer위 Section ======= -->
		<section id="cta" class="cta">
			<div class="container">

				<div class="text-center">
					<h3>올띵스와 함께하세요</h3>
					<h6 class="mb-3 text-white">
						당신에겐 당장 필요치 않은 물건이,
						</h2>
						<h6 class="mt-3 text-white">
							누군가에겐 당장 필요하다면?
							</h2>
							<!-- <a class="cta-btn" href="#me">Call To Action</a> -->
				</div>

			</div>
		</section>
		<!-- End  footer위 Section -->


	</main>
	<!-- End #main -->


<%@ include file="../myinclude/footer.jsp" %>