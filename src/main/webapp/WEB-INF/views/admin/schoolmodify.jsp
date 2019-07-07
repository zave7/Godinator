<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<div class="container" align="center">
	<section>
		<form id="memberform" method="post" action="">
		
			<input type="hidden" name="act" value="register">
			<div class="form-group" ><label for="name">학교명</label></div>
			<div class="form-group" style="display: inline-block;"><input type="text" class="form-control" id="name" name="name" placeholder="이름입력"></div>
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="id" name="id" onkeyup="javascript:idcheck();" placeholder="4자이상 16자 이하">
				<div id="idresult"></div>
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호재입력</label>
				<input type="password" class="form-control" id="passcheck" name="passcheck" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="email">이메일</label><br>
				<div id="email" class="custom-control-inline">
				<input type="text" class="form-control" id="emailid" name="emailid" placeholder="" size="25">
				</div>
			</div>
			<div class="form-group" align="left">
				<label for="tel">전화번호</label>
				<div id="tel" class="custom-control-inline">
				<input type="text" class="form-control" id="tel2" name="tel2" placeholder="1234">
				</div>
			</div>
			<div class="form-group" align="left">
				<label for="">주소</label><br>
				<input type="text" class="form-control" id="address" name="address" placeholder="" readonly="readonly">
				<input type="text" class="form-control" id="address_detail" name="address_detail" placeholder="">
			</div>
			<div class="form-group" align="center" style="padding-top: 30px;">
				<button type="button" class="btn btn-primary" id="registerBtn" onclick="javascript:register();">회원가입</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
		</form>
</section>
	</div>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>