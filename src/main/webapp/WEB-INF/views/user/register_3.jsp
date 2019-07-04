<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#userId").keyup(function() {
		var id = $("#userId").val();
		if(id.length < 5 || id.length > 16) {
			console.log(id.length);
			cnt = 1;
			$("#idresult").css("color", "gray");
			$("#idresult").text("아이디는 5자이상 16자이하입니다.");
		} else {
			$.ajax({
				type : "GET",
				url : "/godinator/user/idcheck",
				dataType : "json",
				data : {"checkid" : id},
				success : function(data) {
					cnt = parseInt(data.idcount);
					if(cnt == 0) {
						$("#idresult").css("color", "steelblue");
						$("#idresult").html("<strong>" + id + "</strong>는 사용 가능합니다.");
					} else {
						$("#idresult").css("color", "magenta");
						$("#idresult").html("<strong>" + id + "</strong>는 사용중입니다.");
					}
				}
			});
		}
	});
	
	$("#registerPreferenceBtn").click(function() {
		//alert($("#registerId").val());
		var hcheckL = $("input[name='highMentorCheck']:checked").length;
		var ucheckL = $("input[name='uniMentorCheck']:checked").length;
			console.log(hcheckL);
			console.log(ucheckL);
		var high = $("#highSchool").val();
		var uni = $("#university").val();
		
		if(hcheckL>0 && high == ""){//체크했는데
			alert("멘토 신청을 위해 고등학교를 입력해 주세요.");
		}else if(ucheckL>0 && uni == ""){
			alert("멘토 신청을 위해 대학교를 입력해 주세요.");
		}else{
			$("#schoolForm").attr("action","/godinator/user/mentorRegister").submit();	
		}
	});
});
</script>
<html>
	<head>
		<title>register_3.jsp</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/godinator/css/main.css" />
		<link rel="stylesheet" href="/godinator/css/register.css"/>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									
								</header>

							<!-- Content -->
								<div id="loginAll">
									<header class="main">
									
										<h1>회원가입</h1>
										<h3 class="subtitle">학교 선택 기준은?</h3>
									</header>

<br>

									<!-- Content -->
									<form id="HighPreferenceForm" name="HighPreferenceForm">
									<div class="preference">
										<h2 class="schoolName">고등학교 선호도</h2>
										<h3 id="contentId">우선순위1</h3>
										  <select name="demo-category" id="preferenceH1">
												<option value="">우선순위를 선택해주세요</option>
												<option value="시설">시설</option>
												<option value="학업분위기">학업분위기</option>
												<option value="교직원(교육,인성)">교직원(교육,인성)</option>
												<option value="진로교육">진로교육</option>
												<option value="취업/진학률">취업/진학률</option>
												<option value="동아리 활성화">동아리 활성화</option>
											</select>
										   <br>
										   <h3 id="contentId">우선순위2</h3>
										  <select name="demo-category" id="preferenceH2">
												<option value="">우선순위를 선택해주세요</option>
												<option value="시설">시설</option>
												<option value="학업분위기">학업분위기</option>
												<option value="교직원(교육,인성)">교직원(교육,인성)</option>
												<option value="진로교육">진로교육</option>
												<option value="취업/진학률">취업/진학률</option>
												<option value="동아리 활성화">동아리 활성화</option>
											</select>
										<br>
										<h3 id="contentId">우선순위3</h3>
										  <select name="demo-category" id="preferenceH3">
												<option value="">우선순위를 선택해주세요</option>
												<option value="시설">시설</option>
												<option value="학업분위기">학업분위기</option>
												<option value="교직원(교육,인성)">교직원(교육,인성)</option>
												<option value="진로교육">진로교육</option>
												<option value="취업/진학률">취업/진학률</option>
												<option value="동아리 활성화">동아리 활성화</option>
											</select>
											<br>
											<h3 id="contentId">우선순위4</h3>
										  <select name="demo-category" id="preferenceH4">
												<option value="">우선순위를 선택해주세요</option>
												<option value="시설">시설</option>
												<option value="학업분위기">학업분위기</option>
												<option value="교직원(교육,인성)">교직원(교육,인성)</option>
												<option value="진로교육">진로교육</option>
												<option value="취업/진학률">취업/진학률</option>
												<option value="동아리 활성화">동아리 활성화</option>
											</select>
											<br>
											<h3 id="contentId">우선순위5</h3>
										  <select name="demo-category" id="preferenceH5">
												<option value="">우선순위를 선택해주세요</option>
												<option value="시설">시설</option>
												<option value="학업분위기">학업분위기</option>
												<option value="교직원(교육,인성)">교직원(교육,인성)</option>
												<option value="진로교육">진로교육</option>
												<option value="취업/진학률">취업/진학률</option>
												<option value="동아리 활성화">동아리 활성화</option>
											</select>
											<br>
											<h3 id="contentId">우선순위6</h3>
										  <select name="demo-category" id="preferenceH6">
												<option value="">우선순위를 선택해주세요</option>
												<option value="시설">시설</option>
												<option value="학업분위기">학업분위기</option>
												<option value="교직원(교육,인성)">교직원(교육,인성)</option>
												<option value="진로교육">진로교육</option>
												<option value="취업/진학률">취업/진학률</option>
												<option value="동아리 활성화">동아리 활성화</option>
											</select>
											<br>
									</div>
									
										<form id="UniPreferenceForm" name="UniPreferenceForm">
									<div class="preference">
										<h2 class="schoolName">대학교 선호도</h2>
										<h3 id="contentId">우선순위1</h3>
										  <select name="demo-category" id="preferenceU1">
												<option value="">우선순위를 선택해주세요</option>
												<option value="시설">시설</option>
												<option value="학업분위기">학업분위기</option>
												<option value="교직원(교육,인성)">교직원(교육,인성)</option>
												<option value="진로교육">진로교육</option>
												<option value="취업/진학률">취업/진학률</option>
												<option value="동아리 활성화">동아리 활성화</option>
											</select>
										   <br>
										   <h3 id="contentId">우선순위2</h3>
										  <select name="demo-category" id="preferenceU2">
												<option value="">우선순위를 선택해주세요</option>
												<option value="시설">시설</option>
												<option value="학업분위기">학업분위기</option>
												<option value="교직원(교육,인성)">교직원(교육,인성)</option>
												<option value="진로교육">진로교육</option>
												<option value="취업/진학률">취업/진학률</option>
												<option value="동아리 활성화">동아리 활성화</option>
											</select>
										<br>
										<h3 id="contentId">우선순위3</h3>
										  <select name="demo-category" id="preferenceU3">
												<option value="">우선순위를 선택해주세요</option>
												<option value="시설">시설</option>
												<option value="학업분위기">학업분위기</option>
												<option value="교직원(교육,인성)">교직원(교육,인성)</option>
												<option value="진로교육">진로교육</option>
												<option value="취업/진학률">취업/진학률</option>
												<option value="동아리 활성화">동아리 활성화</option>
											</select>
											<br>
											<h3 id="contentId">우선순위4</h3>
										  <select name="demo-category" id="preferenceU4">
												<option value="">우선순위를 선택해주세요</option>
												<option value="시설">시설</option>
												<option value="학업분위기">학업분위기</option>
												<option value="교직원(교육,인성)">교직원(교육,인성)</option>
												<option value="진로교육">진로교육</option>
												<option value="취업/진학률">취업/진학률</option>
												<option value="동아리 활성화">동아리 활성화</option>
											</select>
											<br>
											<h3 id="contentId">우선순위5</h3>
										  <select name="demo-category" id="preferenceU5">
											<option value="">우선순위를 선택해주세요</option>
												<option value="시설">시설</option>
												<option value="학업분위기">학업분위기</option>
												<option value="교직원(교육,인성)">교직원(교육,인성)</option>
												<option value="진로교육">진로교육</option>
												<option value="취업/진학률">취업/진학률</option>
												<option value="동아리 활성화">동아리 활성화</option>
											</select>
											<br>
											<h3 id="contentId">우선순위6</h3>
										  <select name="demo-category" id="preferenceU6">
												<option value="">우선순위를 선택해주세요</option>
												<option value="시설">시설</option>
												<option value="학업분위기">학업분위기</option>
												<option value="교직원(교육,인성)">교직원(교육,인성)</option>
												<option value="진로교육">진로교육</option>
												<option value="취업/진학률">취업/진학률</option>
												<option value="동아리 활성화">동아리 활성화</option>
											</select>
											<br>
									</div>
									</form>
										   <br>
									<ul class="actions">
										<li>3/4</li>
										<li><a href="#" class="button primary" id="registerPreferenceBtn">다음페이지</a></li>
									</ul>
									
								
								</div>

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="/godinator/index.jsp">Homepage</a></li>
										<li><a href="/godinator/generic.jsp">Generic</a></li>
										<li><a href="/godinator/elements.jsp">Elements</a></li>
										<li>
											<span class="opener">Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Etiam Dolore</a></li>
										<li><a href="#">Adipiscing</a></li>
										<li>
											<span class="opener">Another Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Maximus Erat</a></li>
										<li><a href="#">Sapien Mauris</a></li>
										<li><a href="#">Amet Lacinia</a></li>
									</ul>
								</nav>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Ante interdum</h2>
									</header>
									<div class="mini-posts">
										<article>
											<a href="#" class="image"><img src="/godinator/resources/images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="/godinator/resources/images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="/godinator/resources/images/pic09.jpg" alt="" /></a>
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
			<script src="/godinator/resources/assets/js/jquery.min.js"></script>
			<script src="/godinator/resources/assets/js/browser.min.js"></script>
			<script src="/godinator/resources/assets/js/breakpoints.min.js"></script>
			<script src="/godinator/resources/assets/js/util.js"></script>
			<script src="/godinator/resources/assets/js/main.js"></script>

	</body>
</html>