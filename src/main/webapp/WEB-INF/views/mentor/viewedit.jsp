<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/mentor/temp/tempheader.jsp" %><%-- html ~ fontawesome(jquery) --%>
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
<%@ include file="/WEB-INF/views/mentor/temp/temptitle.jsp" %><%-- /head ~ div(main, inner) ~ /header --%>
		<%-- Content --%>
		<section>
			<div>
				<label style="font-size: 1.7em;"><i class="far fa-edit"></i>&nbsp;RE: 첨삭 제목</label>
				<div style="float: right; margin-top: 1em;">
					<ul class="actions">
						<li><input type="submit" value="목    록" class="primary small" /></li>
						<li><input type="reset" value="이    전" class="small"/></li>
					</ul>
				</div>
			</div>
			<%-- 버튼 --%>
			<div class="col-12" style="margin-top: 8em; margin-bottom: 1em; text-align: left;">
				<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">ㅇㅇ고등학교(특수목적고)</label>
				<hr class="major" style="margin-top: 0;"/>
			</div>
			<div class="box">
				<p>첨삭 내용<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></p>
			</div>
			<div style="float: right; margin-top: 1em;">
				<ul class="actions">
					<li><input type="submit" value="목    록" class="primary small" /></li>
					<li><input type="reset" value="이    전" class="small"/></li>
				</ul>
			</div>
		</section>
	</div> <%-- inner end --%>
</div> <%-- main end --%>
<%@ include file="/WEB-INF/views/mentor/temp/tempfooter.jsp" %><%-- sidebar ~ /html --%>