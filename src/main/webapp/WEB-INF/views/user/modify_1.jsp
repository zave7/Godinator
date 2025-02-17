 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
$(document).ready(function() {
	//alert("${cateList}")
		/* if("${modifyInfo}" != ""){
		//수정된 정보로 바꾸기 		
		$("a #userNameShow > strong").attr("value", "${modifyInfo.userName}"); //header에 이름바꾸기
	
		} */
	if("${error}" != ""){
		alert("${error}");
	}
	
	$("#modifyOkBtn").click(function() {
		if($("#userName").val() == "") {
			alert("이름을 입력하세요");
			return;
		} else if($("#pass").val() != $("#passcheck").val()) {
			alert("비밀번호를 확인하세요");
			return;
		}else{
		//$("#modifyForm").attr("action", "/godinator/user/modifyMember").submit();
		var params = jQuery("#modifyForm").serialize();
			$.ajax({
				url :'/godinator/user/modifyMember',
				type : 'post',
				data : params,
				success : function(msg) {
						var message = confirm(msg);
						if(message == true){//confirm창에서 확인(학교수정 창으로)
							$("#modifyForm").attr("method","post").attr("action","/godinator/user/moveSchoolModify").submit();	
						//location.href="/godinator/user/moveSchoolModify";
						}//confirm end
					}//success function end
				});//ajax end
			
			}//else end
		});//modify end
	
	
	$("#withdrawBtn").click(function() {//탈퇴
		alert("정말로 탈퇴하시겠습니까?");
	
	
		/* $.ajax({
			url: '/godinator/user/withdrawMember',
			type:'post',
			data: $("#modifyForm").serialize(),
			success: function(msg) {
				alert(msg);
			}
		}); */
	
		$("#modifyForm").attr("action", "/godinator/user/withdrawMember").submit();
	});//withdraw end
	
});//doc end

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addressDetail").focus();
        }
    }).open();
}
</script>
		<title>modify.jsp</title>
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
									
										<h1>개인정보 수정</h1>
									
									</header>

									<!-- Content -->
									<form id="modifyForm" name="modifyForm" method="post">
									<div>
										<h3 id="contentId">이름</h3>
										   <input type="text" name="userName" id="userName" value="${userInfo.userName}"/>
										   <br>
									
										<%-- <h3 id="contentPwd">아이디</h3>
										   <input type="text" name="userId" id="userId" value="${userInfo.userId}" />
										   <br> --%>
									<input type="hidden" id="userId" name="userId" value="${userInfo.userId}" >
										<h3 id="contentPwd">새 비밀번호 혹은 기존 비밀번호</h3>
										   <input type="password" name="pass" id="pass" />
										   <br>
									
										<h3 id="contentPwd">비밀번호 확인</h3>
										   <input type="password" name="passcheck" id="passcheck" />
										   <div id="pwdCheck"></div>
										   <br>

										   
										<!-- <label for="email">이메일</label><br>
									<div id="email" class="custom-control-inline"> -->
									<input type="hidden" class="form-control" id=email name="email" placeholder="" size="25" value="kakao-email">
									<input type="hidden" id="emailDomain" name="emailDomain" value="kakao-emailDomain">
									<!-- </div> -->

										   <br>
<input type="hidden" name="userInfo" id="userInfo" value="${userInfo}">
<input type="hidden"  name="hName" id="hName" value="${hName}">
<input type="hidden" name="uName" id="uName" value="${uName}">
<input type="hidden" name="cateList" id="cateList" value="${cateList}">										
										<div class="form-group" align="left">
											<label for="tel">전화번호</label>
											<div id="tel" class="custom-control-inline">
											<select class="form-control" id="phone1" name="phone1" value="${userInfo.phone1}">
												<option value="010">010</option>
												<option value="02">02</option>
												<option value="031">031</option>
												<option value="032">032</option>
												<option value="041">041</option>
												<option value="051">051</option>
												<option value="061">061</option>
											</select> _
											<input type="text" class="form-control" id="phone2" name="phone2" placeholder="1234" value="${userInfo.phone2}"> _
											<input type="text" class="form-control" id="phone3" name="phone3" placeholder="5678" value="${userInfo.phone2}">
											</div>
										</div>
										
										   <br> <br>
									     
										<h3 id="contentPwd">우편번호</h3>
										   <input type="text" name="zipcode" id="zipcode" value="${userInfo.zipcode}"/>
										   <a href="#" class="button" id="zipcodeSearchBtn" onclick="sample6_execDaumPostcode();">우편번호검색</a>
										   
									
 	   								<div id="list"> <!-- 검색 결과 리스트 출력 영역 -->
 	   								 </div>
										   <br>
										   <br>
										<h3 id="contentPwd">주소</h3>
										   <input type="text" name="address" id="address" value="${userInfo.address}"/>
										   <br>
									
										<h3 id="contentPwd">상세주소</h3>
										   <input type="text" name="addressDetail" id="addressDetail" value="${userInfo.addressDetail}"/>
										   <input type="text" id="sample6_extraAddress" placeholder="참고항목">
										   <br><br>
										   <h3 id="contentPwd">회원구분</h3>
										   <select class="form-control" id=userCate name="userCate">
												<option value="선택하세요">선택하세요</option>
												<c:choose>
													<c:when test="${userInfo.userCate eq 's'}">
														<option class="optionCateS" value="s" selected="selected">학생</option>
													</c:when>
														<c:otherwise>
													<option class="optionCateS" value="s">학생</option>
													</c:otherwise>
												</c:choose>
												
												<c:choose>
													<c:when test="${userInfo.userCate eq 'p'}">
														<option class="optionCateP" value="p" selected="selected">학부모</option>
													</c:when>
													<c:otherwise>
														<option class="optionCateP" value="p">학부모</option>
													</c:otherwise>
												</c:choose>
											</select> 
									</div>
									</form>
										   <br>
									<ul class="actions">
										<li><a href="#" class="button primary" id="modifyOkBtn">수정하기</a></li>
										<li><a href="#" class="button primary" id="withdrawBtn">탈퇴</a></li>
										<!-- <li><a href="#" class="button" id="modifySchoolBtn">학교수정하러가기</a></li> -->
									</ul>
									
									<hr class="major" />
								</div>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>

