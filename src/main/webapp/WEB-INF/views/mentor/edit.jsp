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
				<label style="font-size: 3em;">자소서 첨삭</label>
			</header>
			<div style="margin-top: 5em; text-align: right;">
				<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">ㅇㅇ고등학교(특수목적고)</label>
				<hr class="major" style="margin-top: 0;"/>
			</div>
			<div class="box" style="background-color: rgb(229, 229, 229);">
				<p>자소서 내용</p>
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
								<li><input type="submit" value="저    장" class="primary" /></li>
								<li><input type="reset" value="취    소" /></li>
							</ul>
						</div>
					</div>
				</div>
			</form>

		</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp" %><%-- div(inner end) ~ /html --%>