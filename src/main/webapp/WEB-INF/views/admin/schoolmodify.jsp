<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	
	
	$('#modifyBtn').focusin(function() {
		$("#memberform").attr("action", "${root}/user/modifyInfo.kitri").submit();
	});
});
</script>

<style>
.control {
	background-color: gray;
}
</style>
<section>
<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<form id="memberform" method="post" action="">
			<!--input type="hidden" name="act" value="register"-->
			<div class="form-group" align="left">
				<label for="name">학교코드</label>
				<input type="text" class="control" id="name" name="name" placeholder="이름입력" value="${userInfo.name}" readonly="readonly">
			</div>
			<div class="form-group" align="left">
				<label for="">학교명</label>
				<input type="text" class="form-control" id="id" name="id" placeholder="5자이상 16자 이하" value="${userInfo.id}" >
				<div id="idresult"></div>
			</div>
			<div class="form-group" align="left">
				<label for="">학교분류</label>
				<input type="password" class="form-control" id="pass" name="pass" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">홈페이지</label>
				<input type="password" class="form-control" id="passcheck" name=으"passcheck" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="email">이메일</label><br>
				<div id="email" class="custom-control-inline" >
				<input type="text" class="form-control" id="emailid" name="emailid" placeholder="" size="25" value="${userInfo.emailid}">
				</div>
			</div>
			<div class="form-group" align="left">
				<label for="tel">전화번호</label>
				<div id="tel" class="custom-control-inline">
				<input type="text" id="tel" name="tel" >
				</div>
			</div>
			
			<div class="form-group" align="left">
				<label for="">주소</label><br>
				<div style="display: inline-block;"><input type="text" id="address" name="address" placeholder="" style="width: 528.645766px;"></div>
				<div style="display: inline-block;"><input type="text" id="address_detail" name="addressDetail" style="width: 528.645766px;"></div>
			</div>
			
			<div class="form-group" align="center" style="padding-top: 25px;">
				<button type="button" id="modifyBtn">수정</button>
				<button type="reset" id="modifyBtn">삭제</button>
			</div>
		</form>
	</div>
</div>
</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>