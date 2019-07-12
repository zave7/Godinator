<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<script>
 //$(document).ready(function() {
/*	if("${withdrawMsg}"!=""){
		alert("${withdrawMsg}");
	}
	
	$("#loginBtn").click(function() {
		$("#loginBtn").attr("href","/godinator/view/user/login.jsp");
		
		//location.href("/godinator/view/user/login.jsp");
	});
	
	$("#logoutBtn").click(function() {
		$.ajax({
			url: '/godinator/user/logout',
			success: function(msg) {
				alert(msg);
			}
		}); */
	/* 
		$("#logoutBtn").attr("href","/godinator/user/logout");
	if("${logoutMsg}"!=""){
		alert("${logoutMsg}");
	} */
		
		
	//});
	
	/* $("#moveMypageBtn").click(function() {//회원정보수정
		alert("회원수정하러 가실렵니까?");
		//location.href="/godinator/user/moveMypage";
		$("#editForm").attr("method","post").attr("action","/godinator/user/moveMypage").submit();
		//$("#moveMypageBtn").attr("action","/godinator/user/moveMypage").submit();
		return false;
	}); */

	
	
//});
</script>
		<title>main.jsp</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- <link rel="stylesheet" href="/godinator/css/main.css" />
		<link rel="stylesheet" href="/godinator/css/login.css"/> -->
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<!-- Content -->
								
									<header class="main">
										<h1>메인화면</h1>
									</header>
		<form id="editForm" name="editForm">
<input type="hidden" name="userInfo" id="userInfo" value="${userInfo}">
<input type="hidden" name="hName" id="hName" value="${hName}">
<input type="hidden" name="uName" id="uName" value="${uName}">
<input type="hidden" name="cateList" id="cateList" value="${cateList}">
		</form>
									<!-- Content -->
									
									<div class="mainscope">
									<p>학교 추천서비스</p>
									</div>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>