<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<style>
hr{
	border: 1px dashed #5a5a5a;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#loginGoBtn").click(function() {
		$(this).attr("href","${root}/view/user/login.jsp");
	});
	$("#moveGoMainBtn").click(function() {
		$(this).attr("href","${root}/view/user/main.jsp");
	});
});

</script>

		<title>registerok.jsp</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
<br>
									<!-- Content -->
									<div style="text-align: center">
									<h2>"회원가입이 성공적으로 완료되었습니다."</h2>
									로그인 후 이용 가능합니다.
									</div>
										   <br>
									<ul class="actions">
										<li><a href="" id="loginGoBtn">로그인하러 가기</a></li>
										<li><a href="" id="moveGoMainBtn">메인</a></li>
									</ul>
									<hr class="major" />
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>