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

	<%-- 채팅장 종료 --%>
	$(window).bind("beforeunload", function(){
		wsocket.close();
	})

	<%-- 채팅창으로 전환 --%>
	$('.mentor').click(function(){
		wsocket.close();
		var $mentor = $(this).attr('data-id');
		alert("선택한 멘토:" + $mentor);
		$('#selectedMentor').val($mentor);
		location.href="${root}/";
		return false;
	});
	
	<%-- #### function #### --%>
	<%-- 웹소켓 통신 연결 --%>
	function connect(){
		wsocket = new WebSocket("ws://localhost:80/godinator/connchat");
	}

	$('#school-cate1').change(function(){
		getOnlineMentors();
	});
	
	<%-- 접속중 멘토 목록 --%>
	function getOnlineMentors(){
		var cate1 = $('#school-cate1 option:selected').val();
		var cate2 = $('#school-cate2 option:selected').val();
		var cate3 = $('#school-cate3 option:selected').val();
		var search = $('#searchMentor').val().trim();
		var param =  'cate1=' + cate1 + '&cate2=' + cate2 + '&cate3=' + cate3 + '&search='+ search;
		$.ajax({
			url: '${root}/chat/list',
			type: 'GET',
			data: param,
			success: function(response){
				
				/* var mentor = response.list;
				var list;
				list += '<tr class="mentor" data-id="' + mentor[i] + '">';
				list += '	<td>1</td>';
				list += '	<td>' + mentor[i] + '</td>';
				list += '	<td>ㅇㅇ고등학교</td>';
				list += '	<td>특목고</td>';
				list += '	<td>ㅇㅇ대학교</td>';
				list += '	<td>이공계</td>';
				list += '</tr>';
				$('#mentorList').append(list); */
			}
		});
	}

	
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
					<label style="font-size: 1.7em;">접속중인 멘토</label>
				</div>
				<div class="row gtr-uniform" style="margin-top: 2em;">
					<div class="col-2 col-12-small">
					</div>
					<div class="col-10 col-12-small">
						<div class="col-2 col-12-small" style="padding-left	: 0; float: right;">
							<ul class="actions">
								<li><a href="#" class="button primary icon"><i class="fas fa-search"></i></a></li>
								<li><a href="#" class="button"><i class="fas fa-redo"></i></a></li>
							</ul>
						</div>
						<div class="col-2" style="padding-left: 0.5em; width: 15em; padding-right: 1em; float: right;">
							<input type="text" name="searchMentor" id="searchMentor" value="" placeholder="검색어를 입력하세요"/>
						</div>
						<div class="col-6" style="padding-left: 0.5em; float: right;">
							 <select name="school-cate3" id="school-cate3">
								<option value="0">- 검색조건 -</option>
								<option value="ID">ID</option>
								<option value="모교">모교</option>
							</select>
						</div>
						<div style="clear: both;">
						</div>
					</div>
				</div>
				<%-- 학교 분류 --%>
				<div class="row gtr-uniform" style="margin: 0 0 2em 0;">
					<div class="col-2" style="padding-left: 0; width: 10em;">
						 <select name="school-cate1" id="school-cate1" >
							<option value="1">고등학교</option>
							<option value="2">대학교</option>
						</select>
					</div>
					<div class="col-2" style="width: 10em; padding-left: 0; margin-left: 1em;"> 
						 <select name="school-cate2" id="school-cate2">
							<option value="0">- 전체 -</option>
						</select>
					</div>
				</div>
				<%-- 멘토 목록 --%>
				<input type="hidden" id="selectedMentor" name="selectedMentor">
				<div style="height: 300px; overflow-y: auto; border: thin solid;">
					<table class="alt" style="text-align: center;">
						<tbody id="mentorList">
						</tbody>
					</table>
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