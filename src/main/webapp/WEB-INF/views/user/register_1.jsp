<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#userId").keyup(function() {
		var id = $("#userId").val();
		if(id.length < 5 || id.length > 16) {
			console.log(id.length);
			cnt = 1;
			$("#idresult").css("color", "gray");
			$("#idresult").text("„ì´”ëŠ” 5ì´16ì´˜ì…ˆë‹¤.");
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
						$("#idresult").html("<strong>" + id + "</strong>¬ìš© ê°€¥í•©ˆë‹¤.");
					} else {
						$("#idresult").css("color", "magenta");
						$("#idresult").html("<strong>" + id + "</strong>¬ìš©ì¤‘ì…ˆë‹¤.");
					}
				}
			});
		}
	});
	
	$("#registerBtn").click(function() {
		
		if($("#userId").val() == "") {
			alert("„ì´”ë …ë ¥˜ì„¸);
			return;
		} else if($("#userName").val() == "") {
			alert("´ë¦„…ë ¥˜ì„¸);
			return;
		} else if($("#pass").val() == "") {
			alert("ë¹„ëë²ˆí˜¸ë¥…ë ¥˜ì„¸);
			return;
		} else if($("#pass").val() != $("#passcheck").val()) {
			alert("ë¹„ëë²ˆí˜¸ë¥•ì¸˜ì„¸);
			return;
		} else if(cnt != 0) {
			alert("„ì´ì¤‘ë³µ •ì¸˜ì„¸);
			return;
		} else {
			$("#memberform").attr("action", "/godinator/user/register").submit();
		}
	});

	/*  $("#zipcodeSearchBtn").click(function() {
		//alert($("#demo-category").val())
		  url:"/godinator/zipcode/zipSearch", //Controller¸ì¶œ        
		  type:"post",
		  data:$("#zipform").serialize(), // ”ì²­ë³€¤ì • 
		  dataType:"json",             // °ì´ê²°ê³¼ JSON
		  success:function(jsonStr){  // jsonStr : ì£¼ì†Œ ê²€ê²°ê³¼ JSON °ì´         
			  $("#list").html("");  
			  var errCode = jsonStr.results.common.errorCode;  
			  var errDesc = jsonStr.results.common.errorMessage;           
				  if(errCode!= ï¼ï¼{
					  alert(errCode+"="+errDesc);
					  }else{             
					  if(xmlStr!= null){                 
						  makeListJson(jsonStr); // JSON°ì´HTML•íƒœë¡ë³€        
						  }
					  }        
				  },
		  error: function(xhr,status, error){
			  alert("ëŸ¬ë°œìƒ"); // AJAX ¸ì¶œ ëŸ¬        
			  } 
				
	});  */
	
function makeListJson(jsonStr){
	var htmlStr = "";
	htmlStr += "<table>";
	// jqueryë¥´ìš©JSON ê²°ê³¼ °ì´Œì‹±
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td>"+this.roadAddr+"</td>";
		htmlStr += "<td>"+this.roadAddrPart1+"</td>";
		htmlStr += "<td>"+this.roadAddrPart2+"</td>";
		htmlStr += "<td>"+this.jibunAddr+"</td>";
		htmlStr += "<td>"+this.engAddr+"</td>";
		htmlStr += "<td>"+this.zipNo+"</td>";
		htmlStr += "<td>"+this.admCd+"</td>";
		htmlStr += "<td>"+this.rnMgtSn+"</td>";
		htmlStr += "<td>"+this.bdMgtSn+"</td>";
		htmlStr += "<td>"+this.detBdNmList+"</td>";
		/** API œë¹„œê³µª© •ë (2017.02) **/
		htmlStr += "<td>"+this.bdNm+"</td>";
		htmlStr += "<td>"+this.bdKdcd+"</td>";
		htmlStr += "<td>"+this.siNm+"</td>";
		htmlStr += "<td>"+this.sggNm+"</td>";
		htmlStr += "<td>"+this.emdNm+"</td>";
		htmlStr += "<td>"+this.liNm+"</td>";
		htmlStr += "<td>"+this.rn+"</td>";
		htmlStr += "<td>"+this.udrtYn+"</td>";
		htmlStr += "<td>"+this.buldMnnm+"</td>";
		htmlStr += "<td>"+this.buldSlno+"</td>";
		htmlStr += "<td>"+this.mtYn+"</td>";
		htmlStr += "<td>"+this.lnbrMnnm+"</td>";
		htmlStr += "<td>"+this.lnbrSlno+"</td>";
		htmlStr += "<td>"+this.emdNo+"</td>";
		htmlStr += "</tr>";
	});
	htmlStr += "</table>";
	// ê²°ê³¼ HTMLFORMê²°ê³¼ ì¶œë ¥ DIV½ì…
	$("#list").html(htmlStr);
}	
});
</script>
<html>
	<head>
		<title>register_1.jsp</title>
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
									
										<h1>Œì›ê°€/h1>
										<h4 class="subtitle">ê¸°ë³¸ ¸ì ¬í•­…ë ¥´ì£¼¸ìš”!</h4>
									</header>
							<br><br>
									<!-- Content -->
									<form id="memberform" name="memberform" method="post" action="">
									<div>
										<h3 id="contentId">´ë¦„</h3>
										   <input type="text" name="userName" id="userName" />
										   <br>
									
										<h3 id="contentPwd">„ì´/h3>
										   <input type="text" name="userId" id="userId" />
										   <div id="idresult"></div>
										   <br>
									
										<h3 id="contentPwd">ë¹„ëë²ˆí˜¸</h3>
										   <input type="text" name="pass" id="pass" />
										   <br>
									
										<h3 id="contentPwd">ë¹„ëë²ˆí˜¸ •ì¸</h3>
										   <input type="text" name="passcheck" id="passcheck" />
										   <div id="pwdCheck"></div>
										   <br>
										
										<label for="email">´ë©”/label><br>
									<div id="email" class="custom-control-inline">
									<input type="text" class="form-control" id=email name="email" placeholder="" size="25"> @
									<select class="form-control" id="emailDomain" name="emailDomain">
										<option value="naver.com">naver.com</option>
										<option value="google.com">google.com</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="hanmail.net">hanmail.net</option>
									</select>
									</div>
										   <br>
										<h5 id="contentPwd">¸ì¦ë²ˆí˜¸</h5> <!-- snsë¡œê·¸¸ì‹œ ¸ì¦ë¶ˆí•„-->
										   <input type="text" name="loginPwd" id="loginPwd" />
										   <a class="button" id="emailCheckBtn">´ë©”¸ì¦</a>
										   <div id="emailCheck"></div>
										   <br>
										
										<div class="form-group" align="left">
											<label for="tel">„í™”ë²ˆí˜¸</label>
											<div id="tel" class="custom-control-inline">
											<select class="form-control" id="phone1" name="phone1">
												<option value="010">010</option>
												<option value="02">02</option>
												<option value="031">031</option>
												<option value="032">032</option>
												<option value="041">041</option>
												<option value="051">051</option>
												<option value="061">061</option>
											</select> _
											<input type="text" class="form-control" id="phone2" name="phone2" placeholder="1234"> _
											<input type="text" class="form-control" id="phone3" name="phone3" placeholder="5678">
											</div>
										</div>
										
										   <br> <br>
									     
										<h3 id="contentPwd">°í¸ë²ˆí˜¸</h3>
										   <input type="text" name="zipcode" id="zipcode"/>
										   <a href="#" class="button" id="zipcodeSearchBtn">°í¸ë²ˆí˜¸ê²€/a>
										   
									<form name="zipform" id="zipform" method="post">    <!-- ”ì²­ ë³€¤ì • (ê²€‰ê²°ê³¼í˜•¤ì •, json) -->     
									<input type="hidden" name="currentPage" value="1"/>				<!-- ”ì²­ ë³€¤ì • („ì¬ ˜ì´ì§€. currentPage : n > 0) -->
									  <input type="hidden" name="countPerPage" value="10"/>				<!-- ”ì²­ ë³€¤ì • (˜ì´ì§€ì¶œë ¥ ê°œìˆ˜. countPerPage ë²”ìœ„ : 0 < n <= 100) -->
									  <input type="hidden" name="resultType" value="json"/> 			<!-- ”ì²­ ë³€¤ì • (ê²€‰ê²°ê³¼í˜•¤ì •, json) --> 
									  <input type="hidden" name="confmKey" value="TESTJUSOGOKR"/>		<!-- ”ì²­ ë³€¤ì • (¹ì¸ -->  
									  <input type="text"   name="keyword" value=""/>					<!-- ”ì²­ ë³€¤ì • (¤ì›Œ -->
									</form> 
 	   								<div id="list"> <!-- ê²€ê²°ê³¼ ë¦¬ìŠ¤ì¶œë ¥ ì—­ -->
 	   								 </div>
										   <br>
										   <br>
										<h3 id="contentPwd">ì£¼ì†Œ</h3>
										   <input type="text" name="address" id="address" />
										   <br>
									
										<h3 id="contentPwd">ì„¸ì£¼ì†Œ</h3>
										   <input type="text" name="addressDetail" id="addressDetail" />
									</div>
									</form>
										   <br>
									<ul class="actions">
										<li>1/4</li>
										<li><a href="#" class="button primary" id="registerBtn">¤ìŒ˜ì´ì§€</a></li>
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