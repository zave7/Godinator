<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %><%-- html ~ body의 header --%>
<style type="text/css">
	.far, .fas {
		vertical-align: center;
		font-size: 1.3em;
	}
</style>
<script>
	$(function(){
		$('#checkAll').click(function(){
			$('.resume').attr('checked', 'checked');
			return false;
		});
	});
</script>
		<%-- Content --%>
		<section>
			<header class="main">
				<label style="font-size: 3em;">자소서 작성</label>
			</header>
			
			<!-- Form -->

			<form method="post" action="#">
				<div class="row gtr-uniform">
					<%-- 학교정보 --%>
					<div class="row gtr-uniform" style="margin: 0">
						<div class="col-2" style="padding-left: 0; width: 10em;">
							 <select name="school-cate" id="school-cate" >
								<option value="0">- 대분류 -</option>
								<option value="1">고등학교</option>
								<option value="2">대학교</option>
							</select>
						</div>
						<div class="col-2" style="padding-left: 1em; width: 10em;">
							 <select name="school-cate" id="school-cate" >
								<option value="0">- 소분류 -</option>
							</select>
						</div>
						<div class="col-2" style="width: 14em; padding-left: 1em; "> 
							 <input type="text" readonly="readonly" placeholder="학교명"/>
						</div>
					</div>
					<div class="col-12" style="margin-top: 3em; margin-bottom: 1em; text-align: right;">
						<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">mentorID</label>
						<hr class="major" style="margin-top: 0;"/>
					</div>
					<%-- 자소서 --%>
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
								<li><input type="submit" value="저    장" class="primary" /></li>
								<li><input type="reset" value="취    소" /></li>
							</ul>
						</div>
					</div>
				</div>
			</form>

		</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp" %><%-- div(inner end) ~ /html --%>