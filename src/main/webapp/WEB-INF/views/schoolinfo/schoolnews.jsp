<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<c:set var="resources" value="${root}/resources/assets/"></c:set>
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
		<link rel="stylesheet" href="${resources}css/main.css" />
		<style>
			h1.newsH1C {
				text-align: center;
			}
			h3.newsH3C {
				text-align: center;
			}
			div.newsarea {
				margin: 4%;
				padding: 3%;
				border: 1px solid red;
			}
			div.newsarea p.newsContent {
				margin-bottom: 1px;
			}
			div.newsarea p.subject {
				font-size: 1em;
				color: #622DB7;
				font-weight: bold;
			}
			div.newsarea p.press_date>span.press {
				color: #29703E;
			}
			div.newsarea p.subject:hover {
				cursor: pointer;
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
									<a href="index.html" class="logo"><strong>학교 뉴스</strong></a>
									<ul class="icons">
										<!-- <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li> -->
									</ul>
								</header>

							<!-- Content -->
								<section>
									<header class="main">
										<h1 class="newsH1C">학교 뉴스 종합</h1>
									</header>
									<div class="row">
										<div class="col-7 col-12-small">
										</div>
										<div class="col-2 col-12-small">
											<h3 class="mogyoH2R">학교 검색</h3>
										</div>
										<div class="col-2 col-12-small">
										<input type="text" id="newsSearchBtn"/>
										</div>
										<div class="col-1 col-12-small">
										<a href="#" class="button primary" id="submit">검색</a>
										</div>
									</div>
									<br>
									<div class="newsarea">
										<input type="hidden" id="page" name="page" value="0"/>
										<h3 class="newsH3C">인천전자마이스터고</h3>
										<%-- <hr class="major" />
										<div class="news">
											<div class="row">
												<div class="col-4 col-4-small">
													<span class="image main"><img src="${root}/resources/images/pic11.jpg" alt="" /></span>
												</div>
												<div class="col-8 col-8-small">
													<p class="newsContent subject">인천전자마이스터고 개교</p>
										      		<p class="newsContent press_date"><span class="press">동동일보</span>&#9475;<span class="date">2013.05.02.</span></p>
										      		<p class="newsContent detail">상산고에 대한 평가는 엄격하고 공정한 절차를 거쳐서 실시됐다"고 밝혔다. ... 을 비롯해 강원(민족사관고등학교), 인천(인천포스코고), 부산(해운대고), ..... 바이오, 반도체, 자동차, 전자, 기계, 로봇, 통신 등 다양한 분야 마이스터고가 ...</p>
												</div>
											</div>
										</div>
										<hr class="major" />
										<div class="news">
											<div class="row">
												<div class="col-4 col-4-small">
													<span class="image main"><img src="${root}/resources/images/pic11.jpg" alt="" /></span>
												</div>
												<div class="col-8 col-8-small">
													<p class="newsContent subject">인천전자마이스터고 개교</p>
										      		<p class="newsContent press_date"><span class="press">동동일보</span>&#9475;<span class="date">2013.05.02.</span></p>
										      		<p class="newsContent detail">상산고에 대한 평가는 엄격하고 공정한 절차를 거쳐서 실시됐다"고 밝혔다. ... 을 비롯해 강원(민족사관고등학교), 인천(인천포스코고), 부산(해운대고), ..... 바이오, 반도체, 자동차, 전자, 기계, 로봇, 통신 등 다양한 분야 마이스터고가 ...</p>
												</div>
											</div>
										</div>
										<hr class="major" />
										<div class="news">
											<div class="row">
												<div class="col-4 col-4-small">
													<span class="image main"><img src="${root}/resources/images/pic11.jpg" alt="" /></span>
												</div>
												<div class="col-8 col-8-small">
													<p class="newsContent subject">인천전자마이스터고 개교</p>
										      		<p class="newsContent press_date"><span class="press">동동일보</span>&#9475;<span class="date">2013.05.02.</span></p>
										      		<p class="newsContent detail">상산고에 대한 평가는 엄격하고 공정한 절차를 거쳐서 실시됐다"고 밝혔다. ... 을 비롯해 강원(민족사관고등학교), 인천(인천포스코고), 부산(해운대고), ..... 바이오, 반도체, 자동차, 전자, 기계, 로봇, 통신 등 다양한 분야 마이스터고가 ...</p>
												</div>
											</div>
										</div>
										<hr class="major" />
										<div class="row">
									    <div class="col-5 col-12-small" style="background-color:red;">테스트</div>
									    <div class="col-3 col-12-small" style="background-color:blue">테스트</div>
									    <div class="col-2 col-12-small" style="padding:0px">
									      <div class="short-div" style="background-color:purple">테스트</div>
									      <div class="short-div" style="background-color:green">테스트</div>
									      <div class="short-div" style="background-color:purple">테스트</div>
									    </div>
									    <div class="ccol-2 col-12-small" style="background-color:yellow">테스트</div>
									  </div> --%>
								  </div>
								  	<div class="row main-school-news">
											<div class="col-5 col-12-small">
											</div>
											<div class="col-2 col-1-small">
												<a href="#" class="button primary" id="submit">메인으로</a>
											</div>
									</div>
									<div id="log">
										<span>scrollHeight : <b id="scrollHeight">0</b></span><br>
										<span>scrollHeight : <b id="scrollPosition">0</b></span><br>
										<span>scrollHeight : <b id="bottom">0</b></span><br>
										<span id="b">scroll < 500px </span>
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
											<a href="#" class="image"><img src="${root}/resources/images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="${root}/resources/images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="${root}/resources/images/pic09.jpg" alt="" /></a>
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
									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolordata[i]. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
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
			<script src="${resources}js/jquery.min.js"></script>
			<script src="${resources}js/browser.min.js"></script>
			<script src="${resources}js/breakpoints.min.js"></script>
			<script src="${resources}js/util.js"></script>
			<script src="${resources}js/main.js"></script>
			<script>
			$(document).ready(function() {
				
				function makeAppendNews(data) {
					var newsContentCnt = data.length;
					var newsContents = '';
					for(var i=0; i<newsContentCnt; i++) {
						//json 바인딩
						newsContents += '<hr class="major" />';
						newsContents += '	<div class="news">';
						newsContents += '		<div class="row">';
						newsContents += '			<div class="col-4 col-4-small">';
						newsContents += '				<span class="image main"><img src="'+data[i].imgUrl+'" alt="" /></span>';
						newsContents += '			</div>';
						newsContents += '			<div class="col-8 col-8-small">';
						newsContents += '				<p class="newsContent subject"><a href="'+data[i].url+'">'+data[i].subject+'</a></p>';
						newsContents += '	      		<p class="newsContent press_date"><span class="press">'+data[i].press+'</span>&#9475;<span class="date">'+data[i].date+'</span></p>';
						newsContents += '	      		<p class="newsContent detail">'+data[i].detail+'</p>';
						newsContents += '			</div>';
						newsContents += '		</div>';
						newsContents += '	</div>';				
					}
					$("div.newsarea").append(newsContents);
					
					//alert($("#page").val());
				};
				
				//ajax 호출
				function searchNews() {
					var $page = $("#page").val();
					$.ajax({
						url : '${root}/schoolnews/searchnews/'+$page,
						type : 'GET',
						dataType : 'json',
						success : function(result) {
							console.log(result.google);
							console.log(result.naver);
							makeAppendNews(result.google);
							makeAppendNews(result.naver);
							$("#page").val(Number($("#page").val())+1);
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert("jqXHR : " + jqXHR + "\ntextStatus : " + textStatus + "\nerrorThrown : " + errorThrown)
						}
					});	
				}
				
				$("#submit").click(function() {
					searchNews();
					return false;
				});
				
				$("div.newsarea p.subject").click(function() {
					alert("학교 검색");
				});
				$(window).on("scroll", function() {
					var scrollHeight = $(document).height();
					var scrollPosition = $(window).height() + $(window).scrollTop();		

					$("#scrollHeight").text(scrollHeight);
					$("#scrollPosition").text(scrollPosition);
					$("#bottom").text(scrollHeight - scrollPosition);
					
					var $page = $("#page").val();
					if (scrollPosition == scrollHeight && $page < 5) {
						searchNews();
					} else {
						
					}
				});
			});
		</script>
	</body>
</html>