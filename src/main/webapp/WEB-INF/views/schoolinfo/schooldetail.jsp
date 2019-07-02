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
		<link rel="stylesheet" href="assets/css/morris.css">
		<style>
			h2.schooldetail {
				text-align: center;
			}
			section span>img {
				max-width: 100%;
				height: inherit;
			}
			p>span.adis:hover {
				cursor: pointer;
				color: black;
				font-weight: bold;
			}
			p.adis {
				vertical-align: middle !important;
			}
			div.textarea {
				border: 1px solid red;
				margin: 1% auto;
			}
			ul.school-detail {
				text-align: center;
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
									<a href="index.html" class="logo"><strong>학교 상세 정보</strong></a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Content -->
								<section>
									<header class="main">
										<h2 class="schooldetail">대덕소프트웨어마이스터고등학교</h2>
									</header>
										<div class="row">
											<div class="col-8 col-12-small">
												<span class="image main"><img src="images/pic11.jpg" alt="" /></span>
											</div>
											<div class="col-4 col-12-small">
												<p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis. Praesent rutrum sem diam, vitae egestas enim auctor sit amet. Pellentesque leo mauris, consectetur id ipsum sit amet, fergiat. Pellentesque in mi eu massa lacinia malesuada et a elit. Donec urna ex, lacinia in purus ac, pretium pulvinar mauris. Curabitur sapien risus, commodo eget turpis at, elementum convallis elit. Pellentesque enim turpis, hendrerit.</p>
											</div>
										</div>


									<hr class="major" />

									<div class="row">
					                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
											<h2>항목별 학교 평가 지수</h2>
					                    <!-- ============================================================== -->
					                    <!--line chart  -->
					                    <!-- ============================================================== -->
					                            <div class="card">
					                                <div class="card-body dateLineChart">
					                                    <div id="morris_line"></div>
					                                </div>
					                            </div>
					                        </div>
					                    <!-- ============================================================== -->
					                    <!--end line chart  -->
					                    <!-- ============================================================== -->
					            	</div>

									<hr class="major" />
									
									<div class="row">
										<h2>학교 위치</h2>
										<span class="image main"><img src="images/pic11.jpg" alt="" /></span>
										<p>대전 어딘가</p>
									</div>
									<hr class="major" />

									<h2>학교 장단점</h2>
									<div class="row">
										<div class="col-1 col-12-small">
										</div>
										<div class="col-3 col-12-small">
											<p id="adis"><span class="adis" style="color: black; font-weight: bold;">공감 비율 순</span>&#9475;<span class="adis">공감 순</span>&#9475;<span class="adis">최신순</span></p>
										</div>
										<div class="col-5 col-12-small">
										
										</div>
										<div class="col-3 col-12-small">
												<a href="" class="button primary" id="advantages">장점</a>
												<a href="" class="button" id="disadvantages">단점</a>
										</div>
									</div>
									<hr/>
									<div class="adis-contents">
										<div class="adis-content">
											<div class="row">
												<div class="col-8 col-12-small">
													<span class="id">&nbsp;&nbsp;<strong>sdfi****</strong></span>
												</div>
												<div class="col-4 col-12-small">
													<a href="#" class="button btn-success small">공감:1165</a>
													<a href="#" class="button primary small">비공감:78</a>
													<a href="#" class="button primary small">신고</a>
												</div>
											</div>
											<div class="row">
												<div class="col-1 col-12-small">
												</div>
												<div class="col-10 col-12-small">
													<div class="textarea">
														<p>최신식 기숙사!!</p>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-12-small">
													<span>2019-06-21 11:23</span>
												</div>
											</div>
											<hr/>
										</div>
										<div class="adis-content">
											<div class="row">
												<div class="col-8 col-12-small">
													<span class="id">&nbsp;&nbsp;<strong>rrdf****</strong></span>
												</div>
												<div class="col-4 col-12-small">
													<a href="#" class="button btn-success small">공감:833</a>
													<a href="#" class="button primary small">비공감:93</a>
													<a href="#" class="button primary small">신고</a>
												</div>
											</div>
											<div class="row">
												<div class="col-1 col-12-small">
												</div>
												<div class="col-10 col-12-small">
													<div class="textarea">
														<p>가장 중요한건 한 학년에 삼성 30명 합격했어요!!</p>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-12-small">
													<span>2019-06-21 11:23</span>
												</div>
											</div>
											<hr/>
										</div>
										<div class="adis-content">
											<div class="row">
												<div class="col-8 col-12-small">
													<span class="id">&nbsp;&nbsp;<strong>zave****</strong></span>
												</div>
												<div class="col-4 col-12-small">
													<a href="#" class="button btn-success small">공감:420</a>
													<a href="#" class="button primary small">비공감:55</a>
													<a href="#" class="button primary small">신고</a>
												</div>
											</div>
											<div class="row">
												<div class="col-1 col-12-small">
												</div>
												<div class="col-10 col-12-small">
													<div class="textarea">
														<p>이 학교는 정말 깨끗해요</p>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-12-small">
													<span>2019-06-21 11:23</span>
												</div>
											</div>
											<hr/>
										</div>
									</div>
									<ul class="pagination school-detail">
										<li><span class="button disabled">Prev</span></li>
										<li><a href="#" class="page active">1</a></li>
										<li><a href="#" class="page">2</a></li>
										<li><a href="#" class="page">3</a></li>
										<li><a href="#" class="page">4</a></li>
										<li><a href="#" class="page">5</a></li>
										<li><span>&hellip;</span></li>
										<li><a href="#" class="page">62</a></li>
										<li><a href="#" class="button">Next</a></li>
									</ul>

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
			
			<!-- 모리스 chart -->
			<script src="assets/js/raphael.min.js"></script>
		    <script src="assets/js/morris.js"></script>
		    <!-- <script src="assets/js/Morrisjs.js"></script> -->
			<script>
				$(document).ready(function() {
						if ($('#morris_line').length) {
				            // Use Morris.Area instead of Morris.Line
				            Morris.Line({
				                element: 'morris_line',
				                behaveLikeLine: true,
				                data: [
				                    { y: '시설', a: 10, b: 20 },
				                    { y: '학업분위기', a: 65, b: 45 },
				                    { y: '교직원(교육, 인성)', a: 50, b: 40 },
				                    { y: '진로교육', a: 75, b: 65 },
				                    { y: '학생 복지', a: 50, b: 40 },
				                ],
				                xkey: 'y',
				                ykeys: ['a'],
				                labels: ['마이스터 평균', '학교 평균'],
				                   lineColors: ['#5969ff', '#ff407b'],
				                     resize: true,
				                        gridTextSize: '14px'
				            });
				
				        }
						//$('#subChart span.subDate').text(dataValues[0].y);
					$("span.adis").click(function() {
						$(this).css("color", "black").css("font-weight", "bold").siblings().css("color", "gray").css("font-weight", "normal");
					});
				});
			</script>
	</body>
</html>