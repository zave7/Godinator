<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<style>
	#imagesHigh>div>img, .bin, #imagesUni>div>img{
	width: 10% !important;
	}
</style>
<script type="text/javascript">
$(function(){
	
	$("#registerPreferenceBtn").click(function() {
		var	hEval1 = $("#firstPreH>img").attr("data-seq");
		var	hEval2 = $("#secondPreH>img").attr("data-seq");
		var	hEval3 = $("#thirdPreH>img").attr("data-seq");
		var	hEval4 = $("#fourthPreH>img").attr("data-seq");
		var	hEval5 = $("#fifthPreH>img").attr("data-seq");
		var	hEval6 = $("#sixthPreH>img").attr("data-seq");
		
		var highArray = new Array(hEval1,hEval2,hEval3,hEval4,hEval5,hEval6);
		//alert(highArray);
		
		var	uEval1 = $("#firstPreU>img").attr("data-seq");
		var	uEval2 = $("#secondPreU>img").attr("data-seq");
		var	uEval3 = $("#thirdPreU>img").attr("data-seq");
		var	uEval4 = $("#fourthPreU>img").attr("data-seq");
		var	uEval5 = $("#fifthPreU>img").attr("data-seq");
		var	uEval6 = $("#sixthPreU>img").attr("data-seq");
		
		var uniArray = new Array(uEval1,uEval2,uEval3,uEval4,uEval5,uEval6);
		//alert(uniArray);
		
		$(this).attr("href", "/godinator/user/preference?highArray="+highArray + "&uniArray="+uniArray+
				"&registerId="+$("#registerId").val() + "&highSchool="+$("#highSchool").val()+"&university="+$("#university").val());
	
  });
	
});

function allowDrop(ev) {
	  ev.preventDefault();
	}

	function drag(ev) {
	  ev.dataTransfer.setData("text", ev.target.id);
	}

	function drop(ev) {
	
	  ev.preventDefault();
	  var data = ev.dataTransfer.getData("text");
	  ev.target.appendChild(document.getElementById(data).cloneNode());
	}
	
	function bin(ev){
		ev.preventDefault();
		var data = ev.dataTransfer.getData("text");
	  ev.target.appendChild(document.getElementById(data));
	}
	
	
	
	
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

						

							<!-- Content -->
								<div id="loginAll">
									<header class="main">
									
										<h1>회원가입</h1>
										<h3 class="subtitle">학교 선택 기준은?        드래그해서 기준을 정해주세요!</h3>
									</header>

<br>

									<!-- Content -->
									<h2 class="schoolName">고등학교 우선순위</h2>
									
									<br><br>
									<form id="PreferenceForm" name="PreferenceForm">
									
	<input type="hidden" id="registerId" name="registerId" value="${registerId}"> 
	<input type="hidden" id="highSchool" name="highSchool" value="${highSchool}"> <!-- 유무에 따라 register_4 평가할 항목 정해짐 -->
	<input type="hidden" id="university" name="university" value="${university}"> <!-- 유무에 따라 register_4 평가할 항목 정해짐 -->
										
									<div id="boardsHigh">
									<div class="row">
									<div class="col-lg-6" style="display: inline-block;"><label class="prefer" >우선순위1</label></div>
										<div class="col-lg-6" id="firstPreH" style="display: inline-block; width: 200px; height: 200px; padding-left: 100px;" class="pre" ondrop="drop(event)" ondragover="allowDrop(event)">1순위</div>
									</div>
									<div class="row">
									<div class="col-lg-6" style="display: inline-block;"><label class="prefer" >우선순위2</label></div>
										<div class="col-lg-6" id="secondPreH" style="display: inline-block; width: 200px; height: 200px; padding-left: 100px;" class="pre" ondrop="drop(event)" ondragover="allowDrop(event)">2순위</div>
									</div>
									<div class="row">
									<div class="col-lg-6" style="display: inline-block;"><label class="prefer" >우선순위3</label></div>
										<div class="col-lg-6" id="thirdPreH" style="display: inline-block; width: 200px; height: 200px; padding-left: 100px;" class="pre" ondrop="drop(event)" ondragover="allowDrop(event)">3순위</div>
									</div>
									
									<div class="row">
									<div class="col-lg-6" style="display: inline-block;"><label class="prefer" >우선순위4</label></div>
										<div class="col-lg-6" id="fourthPreH" style="display: inline-block; width: 200px; height: 200px; padding-left: 100px;" class="pre" ondrop="drop(event)" ondragover="allowDrop(event)">4순위</div>
									</div>
									<div class="row">
									<div class="col-lg-6" style="display: inline-block;"><label class="prefer" >우선순위5</label></div>
										<div class="col-lg-6" id="fifthPreH" style="display: inline-block; width: 200px; height: 200px; padding-left: 100px;" class="pre" ondrop="drop(event)" ondragover="allowDrop(event)">5순위</div>
									</div>
									<div class="row">
									<div class="col-lg-6" style="display: inline-block;"><label class="prefer" >우선순위6</label></div>
										<div class="col-lg-6" id="sixthPreH" style="display: inline-block; width: 200px; height: 200px; padding-left: 100px;" class="pre" ondrop="drop(event)" ondragover="allowDrop(event)">6순위</div>
									</div>
									</div>	
										
									<br>									
									<div id="imagesHigh">
											<div><img src="/godinator/resources/images/user/facility.jpg" data-seq="h1" id="facilityH" class="iconHigh" draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/study_atmos.jpg"  data-seq="h2" id="studyH" class="iconHigh" draggable="true" ondragstart="drag(event)"></div>
										    <div><img src="/godinator/resources/images/user/teacher.jpg"  data-seq="h3" id="teacherH" class="iconHigh" draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/result_instruct.jpg"  data-seq="h4" id="instructH" class="iconHigh" draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/result.jpg"  data-seq="h5" id="resultH" class="iconHigh" draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/group.jpg"  data-seq="h6" id="groupH" class="icon" draggable="true" ondragstart="drag(event)"></div>
									</div>
									<br>
									<br><br>
									<img class="bin" src="/godinator/resources/images/user/trash.png" style="width:150px; height:180px;" class="bin" ondrop="bin(event)" ondragover="allowDrop(event)"/>
									<hr>
									<br>
										<h2 class="schoolName">대학교 우선순위</h2>
									<br><br>
									<div id="boardsUni">
									<div class="row">
									<div class="col-lg-6" style="display: inline-block;"><label class="prefer" >우선순위1</label></div>
										<div class="col-lg-6" id="firstPreU" style="display: inline-block; width: 200px; height: 200px; padding-left: 100px;" class="pre" ondrop="drop(event)" ondragover="allowDrop(event)">1순위</div>
									</div>
									<div class="row">
									<div class="col-lg-6" style="display: inline-block;"><label class="prefer" >우선순위2</label></div>
										<div class="col-lg-6" id="secondPreU" style="display: inline-block; width: 200px; height: 200px; padding-left: 100px;" class="pre" ondrop="drop(event)" ondragover="allowDrop(event)">2순위</div>
									</div>
									<div class="row">
									<div class="col-lg-6" style="display: inline-block;"><label class="prefer" >우선순위3</label></div>
										<div class="col-lg-6" id="thirdPreU" style="display: inline-block; width: 200px; height: 200px; padding-left: 100px;" class="pre" ondrop="drop(event)" ondragover="allowDrop(event)">3순위</div>
									</div>
									
									<div class="row">
									<div class="col-lg-6" style="display: inline-block;"><label class="prefer" >우선순위4</label></div>
										<div class="col-lg-6" id="fourthPreU" style="display: inline-block; width: 200px; height: 200px; padding-left: 100px;" class="pre" ondrop="drop(event)" ondragover="allowDrop(event)">4순위</div>
									</div>
									<div class="row">
									<div class="col-lg-6" style="display: inline-block;"><label class="prefer" >우선순위5</label></div>
										<div class="col-lg-6" id="fifthPreU" style="display: inline-block; width: 200px; height: 200px; padding-left: 100px;" class="pre" ondrop="drop(event)" ondragover="allowDrop(event)">5순위</div>
									</div>
									<div class="row">
									<div class="col-lg-6" style="display: inline-block;"><label class="prefer" >우선순위6</label></div>
										<div class="col-lg-6" id="sixthPreU" style="display: inline-block; width: 200px; height: 200px; padding-left: 100px;" class="pre" ondrop="drop(event)" ondragover="allowDrop(event)">6순위</div>
									</div>
									</div>	
										
									<br>									
									<div id="imagesUni">
											<div><img src="/godinator/resources/images/user/facility.jpg" data-seq="u1" id="facilityU" class="iconUni" draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/study_atmos.jpg"  data-seq="u2" id="studyU" class="iconUni" draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/teacher.jpg"  data-seq="u3" id="teacherU" class="iconUni" draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/result_instruct.jpg"  data-seq="u4" id="instructU" class="iconUni" draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/result.jpg"  data-seq="u5" id="resultU" class="iconUni" draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/group.jpg"  data-seq="u6" id="groupU" class="icon" draggable="true" ondragstart="drag(event)"></div>
									</div>
									<br><br>
									<img class="bin" src="/godinator/resources/images/user/trash.png" style="width:150px; height:180px;" class="bin" ondrop="bin(event)" ondragover="allowDrop(event)"/>
									</form>
										
										   <br><br>
									<ul class="actions">
										<li>3/4</li>
										<li><a href="" class="button primary" id="registerPreferenceBtn">다음페이지</a></li>
									</ul>
								</div>

<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>