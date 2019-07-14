<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
		<title>main.jsp</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- <link rel="stylesheet" href="/godinator/css/main.css" />
		<link rel="stylesheet" href="/godinator/css/login.css"/> -->
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