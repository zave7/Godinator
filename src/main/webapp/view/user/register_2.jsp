<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#highSchool").keyup(function() {
	var highName = $("#highSchool").val();
			$.ajax({
				url: "/godinator/user/schoolCheck1?highName=" + highName,
				method:"get",
				success: function(data) {
					console.log(data);
					if(data !=null){
					var code= '<h3 id="contentPwd"><strong>고등�교</strong> 멘토 구분</h3>'+
								'<div class="col-6 col-12-small">'+
										'<input type="checkbox" id="highMentorCheck" name="highMentorCheck" >'+
										'<label for="highMentorCheck">�택</label>'+
									'</div>';
					$("#highMentorSection").html(code);
					}
				}
			});
	});
	
	$("#university").keyup(function() {
	var uniName = $("#university").val();
			$.ajax({
				url: "/godinator/user/schoolCheck2?uniName=" + uniName,
				method:"get",
				success: function(data) {
					console.log(data);
					if(data !=null){
					var code= 	
					'<h3 id="contentPwd"><strong>��교</strong> 멘토 구분</h3>'+
						'<div class="col-6 col-12-small">'+
											'<input type="checkbox" id="uniMentorCheck" name="uniMentorCheck" >'+
											'<label for="uniMentorCheck">�택</label>'+
										'</div>';
					$("#uniMentorSection").html(code);
					}
				}
			});
	});
	
	$("#mentorRegisterBtn").click(function() {
		$("#schoolForm").attr("action","/godinator/user/mentorRegister").submit();
	});
	
});
</script>
<html>
	<head>
		<title>register_2.jsp</title>
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
									
										<h1>�원가/h1>
										<h3 class="subtitle">�배�의 멘토가 �어주세</h3>
									</header>
<br><br>
									<!-- Content -->
									<form id="schoolForm" name="schoolForm" method="post" action="">
									<div>
										<h3 id="contentId">출신 고등�교</h3>
										   <input type="text" name="highSchool" id="highSchool" />
										   <a href="#" class="button">�교 검/a>
										   <br>
										<br>
										<h3 id="contentPwd">출신 ��교</h3>
										   <input type="text" name="university" id="university" />
										   <a href="#" class="button">�교 검/a>
										   <div id="idCheck"></div>
										   <br>
									
<input type="hidden" id="registerId" name="registerId" value="${registerInfo.userId}">
									<hr>
									<section id="highMentorSection">
									<section id="uniMentorSection">
										
									</section>						
										
									</section>						
										   <br>
									<section id="uniMentorSection">
										   
									</section>						
										   <br>
										   
											
										
									</div>
									</form>
										   <br>
									<ul class="actions">
										<li>2/4</li>
										<li><a href="#" class="button primary" id="mentorRegisterBtn" name="mentorRegisterBtn">�음�이지</a></li>
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