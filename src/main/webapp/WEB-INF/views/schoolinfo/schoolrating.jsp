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
		<title>Elements - Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style>
			.mogyoH1R {
				text-align: center;
			}
			.mogyoH2R {
				text-align: right;
			}
			.mogyoH2L {
				text-align: left;
			}
			div.submit-school-evaluation {
				text-align: center;
			}
		</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$("div.submit-school-evaluation a#submit").click(function() {
					var check = confirm("입력 확인 시 수정이 불가합니다. 신중히 작성해주시기 바랍니다.\n작성 완료하시겠습니까?");
					return false;
				});
			});
		</script>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="index.html" class="logo"><strong>마이페이지</strong> 모교 평가</a>
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
										<h1 class="mogyoH1R">고등학교 및 대학교 평가</h1>
									</header>
									<div class="row">
										<div class="col-10 col-12-small">
										</div>
										<div class="col-2 col-12-small">
											<h3 class="mogyoH2R">모교 검색</h3>
										</div>
									</div>
									<div class="row">
										<div class="col-7 col-12-small">
										</div>
										<div class="col-2 col-12-small">
										<select name="test">
											<option value="high">고등학교</option>
											<option value="uni">대학교</option>
										</select>
										</div>
										<div class="col-3 col-12-small">
										<input type="text"/>
										</div>
									</div>
									<!-- Content -->
										<h2 id="content">항목 평가</h2>
										<div class="row">
											<div class="col-6 col-12-small">
												<p>시설&#9733;&#9733;&#9733;&#9733;&#9733;&#9734;&#9734;&#9734;&#9734;&#9734;</p>
											</div>
											<div class="col-6 col-12-small">
												<p>학업분위기&#9733;&#9733;&#9733;&#9733;&#9733;&#9734;&#9734;&#9734;&#9734;&#9734;</p>
											</div>
											<div class="col-6 col-12-small">
												<p>교직원 (교육, 인성)&#9733;&#9733;&#9733;&#9733;&#9733;&#9734;&#9734;&#9734;&#9734;&#9734;</p>
											</div>
											<div class="col-6 col-12-small">
												<p>진로 교육&#9733;&#9733;&#9733;&#9733;&#9733;&#9734;&#9734;&#9734;&#9734;&#9734;</p>
											</div>
											<div class="col-6 col-12-small">
												<p>학생 복지&#9733;&#9733;&#9733;&#9733;&#9733;&#9734;&#9734;&#9734;&#9734;&#9734;</p>
											</div>
										</div>
										<hr>
										<h2 id="content">학교 장단점</h2>
										<div class="row">
										<div class="col-2 col-12-small">
											<h3 class="mogyoH2L">장점</h3>
										</div>
										<div class="col-10 col-12-small">
										</div>
										</div>
										<div class="row">
											<div class="col-12">
												<textarea name="demo-message" id="demo-message" placeholder="학교 장점을 입력해주세요" rows="6"></textarea>
											</div>
										</div>
										<div class="row">
										<div class="col-2 col-12-small">
											<h3 class="mogyoH2L">단점</h3>
										</div>
										<div class="col-10 col-12-small">
										</div>
										</div>
										<div class="row">
											<div class="col-12">
												<textarea name="demo-message" id="demo-message" placeholder="학교 단점을 입력해주세요" rows="6"></textarea>
											</div>
										</div>
										<br>
										<div class="row submit-school-evaluation">
											<div class="col-4 col-12-small">
											</div>
											<div class="col-2 col-1-small">
												<a href="" class="button primary" id="submit">확인</a>
											</div>
											<div class="col-2 col-1-small">
												<a href="" class="button" id="cancel">취소</a>
											</div>
										</div>
								</section>

						</div>
					</div>

				<%@ include file="sidebar.jsp" %>


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
			<script>
				$(document).ready(function(e){
				    $('.search-panel .dropdown-menu').find('a').click(function(e) {
						e.preventDefault();
						var param = $(this).attr("href").replace("#","");
						var concept = $(this).text();
						$('.search-panel span#search_concept').text(concept);
						$('.input-group #search_param').val(param);
					});
				});
			</script>
	</body>
</html>