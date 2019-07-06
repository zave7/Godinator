<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML>
<html>
<head>
<title>Elements - Editorial by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${root}/css/main.css" />
<%-- font-awesome --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style type="text/css">
	.far, .fas {
		vertical-align: center;
		font-size: 1.3em;
	}
</style>
<script>
$(function(){
	
	var wsocket;
	connect();

	<%-- 웹소켓 통신 연결 --%>
	function connect(){
		wsocket = new WebSocket("ws://localhost:80/godinator/connchat");
	}
	
	<%-- 채팅장 종료 --%>
	$(window).bind("beforeunload", function(){
		if(confirm("채팅을 종료하시겠습니까?")) {
			wsocket.close();
		}
	})
	
	<%-- 채팅창으로 전환 --%>
	
});
</script>
</head>
<body style="padding: 0; margin: 0;">
	<div id="wrapper" style="padding: 0;">
		<!-- Main -->
		<div id="main" style="padding: 0; margin: 0;">
			<div class="inner">
				<%-- Content --%>
				<div style="margin-top: 3em;">
					<label style="font-size: 1.7em;">채팅 대기</label>
				</div>
				<%-- 멘토 목록 --%>
				<input type="hidden" id="selectedMentor" name="selectedMentor">
				<div style="height: 300px; overflow-y: auto; border: thin solid;">
					<p>멘티의 채팅 신청을 기다리는 중입니다...</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Scripts -->
	<script src="${root}/js/jquery.min.js"></script>
	<script src="${root}/js/browser.min.js"></script>
	<script src="${root}/js/breakpoints.min.js"></script>
	<script src="${root}/js/util.js"></script>
	<script src="${root}/js/main.js"></script>
</body>
</html>