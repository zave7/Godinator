<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#mentorRegisterBtn").click(function() {
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


							<!-- Content -->
								<div id="loginAll">
									<header class="main">
									
										<h1>회원가입</h1>
										<h3 class="subtitle">후배들의 멘토가 되어주세요!</h3>
									</header>
									<br><br>
									<!-- Content -->
									<form id="schoolForm" name="schoolForm" method="post" action="">
									<div>
										<h3 id="contentId">출신 고등학교</h3>
										   <input type="text" name="highSchool" id="highSchool" />
										   <a href="#" class="button">학교 검색</a>
										   <br><br>
										   <h5>고등학교 구분</h5>
										   <div id="h_category" class="custom-control-inline">
													<select class="form-control" id="hSchoolCate" name="hSchoolCate">
														<option value="특수목적고등학교">특수목적고등학교</option>
														<option value="일반고등학교">일반고등학교</option>
														<option value="자율고등학교">자율고등학교</option>
														<option value="특성화고등학교">특성화고등학교</option>
													</select>
										   </div>
										<br><br><br><br>
										<h3 id="contentPwd">출신 대학교</h3>
										   <input type="text" name="university" id="university" />
										   <a href="#" class="button">학교 검색</a>
										   <br><br>
										    <h5>대학교 구분</h5>
										   <div id="u_category" class="custom-control-inline">
													<select class="form-control" id="uSchoolCate" name="uSchoolCate">

														<option value="인문,사회">인문,사회</option>
														<option value="자연,공학">자연,공학</option>
														<option value="의학">의학</option>
														<option value="예술,체육">예술,체육</option>
														<option value="교육">교육</option>
													</select>
										   </div>
									
<input type="hidden" id="registerId" name="registerId" value="${registerInfo.userId}">
									<hr>
									<br><br>
									<section id="highMentorSection">
										<h3 id="contentPwd"><strong>고등학교</strong> 멘토 구분</h3>
								<div class="col-6 col-12-small">
										<input type="checkbox" id="highMentorCheck" name="highMentorCheck" >
										<label for="highMentorCheck">선택</label>
									</div>
									</section>						
										   <br>
									<section id="uniMentorSection">
										<h3 id="contentPwd"><strong>대학교</strong> 멘토 구분</h3>
						<div class="col-6 col-12-small">
											<input type="checkbox" id="uniMentorCheck" name="uniMentorCheck" >
											<label for="uniMentorCheck">선택</label>
										</div>
									</section>						
										   <br>
										   
									</div>
									</form>
										   <br>
									<ul class="actions">
										<li>2/4</li>
										<li><a href="#" class="button primary" id="mentorRegisterBtn" name="mentorRegisterBtn">다음페이지</a></li>
									</ul>
									
								</div>

		<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>