<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
		<title>modify.jsp</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/godinator/css/main.css" />
		<link rel="stylesheet" href="/godinator/css/register.css"/>
	</head>
<style>
hr{
	border: 1px dashed #5a5a5a;
}
</style>	
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Content -->
								<div id="loginAll">
									<header class="main">
									
										<h1>개인정보 수정</h1>
									
									</header>

									<!-- Content -->
									<form id="loginForm" name="loginForm">
									<div>
										<h3 id="contentId">이름</h3>
										   <input type="text" name="loginId" id="loginId" value="" />
										   <br>
									
										<h3 id="contentPwd">아이디</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value="" disabled="disabled"/>
										   <br>
									
										<h3 id="contentPwd">비밀번호</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value="" />
										   <br>
									
										<h3 id="contentPwd">비밀번호 확인</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value="" />
										   <div id="pwdCheck"></div>
										   <br>
											
										
										<h3 id="contentPwd">전화번호</h3>
										<div id="telAll">
											<div class="tel">
										   <input type="text" name="tel1" id="tel1" value="">
										   </div>
										   
											   <div class="tel">
											    <input type="text" name="tel2" id="tel2"  value="">
											    </div>
											   
											    <div class="tel">
											     <input type="text" name="tel3" id="tel3"  value="">
											     </div>
										 </div>
										   <br> <br>
									   
										<h3 id="contentPwd">우편번호</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value="" />
										   <a href="#" class="button">우편번호검색</a>
										   <br>
										   <br>
										<h3 id="contentPwd">주소</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value=""/>
										   <br>
									
										<h3 id="contentPwd">상세주소</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value=""/>
									
									
											
									</div>
									</form>
										   <br>
									<ul class="actions">
										<li><a href="#" class="button primary">수정하기</a></li>
										<li><a href="#" class="button primary">탈퇴</a></li>
										<li><a href="#" class="button">취소</a></li>
									</ul>
									
									<hr class="major" />
								</div>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>