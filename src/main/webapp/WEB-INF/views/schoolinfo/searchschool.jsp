<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Generic - Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style>
			div.search-condition {
				margin: 3% auto;
			}
			input#searchInput {
			  background-image : url('images/search.PNG'); 
			  background-position:center right; 
			  background-repeat:no-repeat;
		  	}
		  	div.hr-sect {
				display: flex;
				flex-basis: 100%;
				align-items: center;
				color: black;
				font-size: 1em;
				margin: 8px 0px;
			}
			div.hr-sect::before,
			div.hr-sect::after {
				content: "";
				flex-grow: 1;
				background: rgba(0, 0, 0, 0.35);
				height: 1px;
				font-size: 0px;
				line-height: 0px;
				margin: 0px 16px;
			}
			div.adis-content {
				padding: 2% 2%;
				margin: 0 2em;
			}
			p.simpleInfo {
				margin: 0 2em;
			}
			span.school-name {
				font-size: 2em;
			}
			span.school-name:hover {
				cursor: pointer;
				text-decoration: underline;
			}
			span.location {
				color: black;
			}
			span.url:hover {
				cursor: pointer;
				text-decoration: underline;
			}
			div.search-condition select:hover {
				border-color: #f56a6a;
				box-shadow: 0 0 0 1px #f56a6a;
			}
			input:hover {
				border-color: #f56a6a;
				box-shadow: 0 0 0 1px #f56a6a;
			}
		</style>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="index.html" class="logo"><strong>학교검색</strong></a>
									<!-- <ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul> -->
								</header>

							<!-- Content -->
								<section>
									<header class="main">
										<h1>조건 검색</h1>
									</header>
					
									<hr class="major" />
				
									<div class="row search-condition">
										<div class="col-2 col-12-small">
											<label>학교 구분</label>
											<select name="test">
												<option value="high" selected="selected">고등학교</option>
												<option value="uni">대학교</option>
											</select>
										</div>
										<div class="col-2 col-12-small">
											<label>검색</label>
											<select name="test">
												<option value="high" selected="selected">학교 이름</option>
												<option value="uni">관할 교육청</option>
											</select>
										</div>
										<div class="col-8 col-12-small">
											<label>&nbsp;</label>
											<input type="text" id="searchInput"/>
										</div>
									</div>
									<div class="row search-condition">
										<div class="col-2 col-12-small">
											<label>지역 구분</label>
											<select name="test">
												<option value="all" selected="selected">전체</option>
												<option value="seoul">서울</option>
												<option value="incheon">인천</option>
												<option value="busan">부산</option>
											</select>
										</div>
										<div class="col-2 col-12-small">
											<label>학교 유형1</label>
											<select name="test">
												<option value="all" selected="selected">전체</option>
												<option value="1">일반고</option>
												<option value="2">자율고</option>
												<option value="3">특성화고</option>
												<option value="4">마이스터고</option>
											</select>
										</div>
										<div class="col-2 col-12-small">
											<label>학교 유형2</label>
											<select name="test">
												<option value="all" selected="selected">전체</option>
												<option value="1">과학계열</option>
												<option value="2">예술체육계열</option>
											</select>
										</div>
										<div class="col-2 col-12-small">
											<label>남녀 공학 구분</label>
											<select name="test">
												<option value="all" selected="selected">전체</option>
												<option value="1">남녀 공학</option>
												<option value="2">남고</option>
												<option value="3">여고</option>
											</select>
										</div>
										<div class="col-2 col-12-small">
										</div>
										<div class="col-2 col-12-small" style="text-align: right;">
											<label>&nbsp;</label>
											<a href="#" class="button primary">검색</a>
										</div>
									</div>

									<div class="hr-sect">검색결과</div>

									<div class="adis-contents">
										<div class="adis-content">
											<div class="row">
												<div class="col-12 col-12-small">
													<span class="school-name"><strong>대덕소프트웨어마이스터고등학교</strong></span><span class="location">&nbsp;&nbsp;서울 특별시 강남구</span>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-12-small">
													<p class="simpleInfo"><span class="juris">서울특별시교육청</span>&#9475;<span class="estab">국립</span>&#9475;<span class="kind">일반고등학교</span>&#9475;<span class="coeducation">남고</span></p>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-12-small">
													<p class="simpleInfo"><span>학교 홈페이지 주소 : </span><span class="url">http://www.naver.com</span></p>
												</div>
											</div>
											<hr/>
										</div>
										<div class="adis-content">
											<div class="row">
												<div class="col-12 col-12-small">
													<span class="school-name"><strong>대덕소프트웨어마이스터고등학교</strong></span><span class="location">&nbsp;&nbsp;서울 특별시 강남구</span>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-12-small">
														<p class="simpleInfo"><span class="juris">서울특별시교육청</span>&#9475;<span class="estab">국립</span>&#9475;<span class="kind">일반고등학교</span>&#9475;<span class="coeducation">남고</span></p>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-12-small">
													<p class="simpleInfo"><span>학교 홈페이지 주소 : </span><span class="url">http://www.naver.com</span></p>
												</div>
											</div>
											<hr/>
										</div>
										<div class="adis-content">
											<div class="row">
												<div class="col-12 col-12-small">
													<span class="school-name"><strong>대덕소프트웨어마이스터고등학교</strong></span><span class="location">&nbsp;&nbsp;서울 특별시 강남구</span>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-12-small">
													<p class="simpleInfo"><span class="juris">서울특별시교육청</span>&#9475;<span class="estab">국립</span>&#9475;<span class="kind">일반고등학교</span>&#9475;<span class="coeducation">남고</span></p>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-12-small">
													<p class="simpleInfo"><span>학교 홈페이지 주소 : </span><span class="url">http://www.naver.com</span></p>
												</div>
											</div>
											<hr/>
										</div>
									</div>

								</section>

						</div>
					</div>

				<%@ include file="sidebar.jsp" %>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Ante interdum</h2>
									</header>
									<div class="mini-posts">
										<article>
											<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
									</div>
									<ul class="actions">
										<li><a href="#" class="button">More</a></li>
									</ul>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
									<ul class="contact">
										<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
										<li class="icon solid fa-phone">(000) 000-0000</li>
										<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
										Nashville, TN 00000-0000</li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>