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
			<%-- 버튼 --%>
			<div>
				<label style="font-size: 1.7em;"><i class="far fa-envelope-open"></i>&nbsp;FROM: mentorID</label>
				<div style="float: right; margin-top: 1em;">
					<ul class="actions">
						<li><input type="submit" value="목    록" class="primary small" /></li>
						<li><input type="reset" value="이    전" class="small"/></li>
					</ul>
				</div>
			</div>
			<div class="col-12" style="margin-top: 8em; margin-bottom: 1em; text-align: left;">
				<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">쪽지 제목</label>
				<hr class="major" style="margin-top: 0;"/>
			</div>
			<div class="box">
				<p>쪽지 내용<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></p>
			</div>
			<div style="float: right; margin-top: 1em;">
				<ul class="actions">
					<li><input type="submit" value="목    록" class="primary small" /></li>
					<li><input type="reset" value="이    전" class="small"/></li>
				</ul>
			</div>
		</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp" %><%-- div(inner end) ~ /html --%>