<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %><%-- html ~ body의 header --%>
<style type="text/css">
	.far, .fas {
		vertical-align: center;
		font-size: 1.3em;
	}
</style>
<script>
$(function(){
	/* $.ajax({
		url: '${root}/resume/',
		data: ,
		success: function(response){
			
		}
	}); */
});
</script>
		<%-- Content --%>
		<section>
			<header class="main">
				<label style="font-size: 3em;">자소서 첨삭</label>
			</header>
			<div style="margin-top: 5em; text-align: right;">
				<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">${editDto.bSchoolName}&nbsp;&nbsp;║&nbsp;&nbsp;<c:choose><c:when test="${editDto.bSchoolCate1 != 'h'}">${fn:split(editDto.bSchoolCate2, '||')[0]}&nbsp;&nbsp;║&nbsp;&nbsp;${fn:split(editDto.bSchoolCate2, '||')[1]}</c:when><c:otherwise>${editDto.bSchoolCate2}</c:otherwise></c:choose></label>
				<hr class="major" style="margin-top: 0;"/>
			</div>
			<div class="box" style="background-color: rgb(229, 229, 229);">
				<p><strong>제  목</strong></p>
				<p>${editDto.boardSubject}</p>
				<p></p>
				<p><strong>내  용</strong></p>
				<p>${editDto.boardContent}</p>
			</div>
			<!-- Form -->
			<form method="post" action="#">
				<div class="row gtr-uniform">
				
					<%-- 첨삭 --%>
					<div class="col-12">
						<textarea name="subject" id="subject" placeholder="제목을 입력하세요" rows="1"></textarea>
					</div>
					<div class="col-12">
						<textarea name="content" id="content" placeholder="내용을 입력하세요" rows="20"></textarea>
					</div>
					<%-- 버튼 --%>
					<div class="col-12">
						<div style="float: right;">
							<ul class="actions">
								<li><input type="submit" id="saveBtn" value="저    장" class="primary" /></li>
								<li><input type="reset" id="cancleBtn" value="취    소" /></li>
							</ul>
						</div>
					</div>
				</div>
			</form>

		</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp" %><%-- div(inner end) ~ /html --%>