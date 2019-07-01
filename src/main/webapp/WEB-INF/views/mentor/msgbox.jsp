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
			$('.msg').attr('checked', 'checked');
			return false;
		});
		// 마우스 커서 변경
		$('.msgBtn').css('cursor', 'pointer');
		
		// 쪽지 내용보기
		$('.msgBtn').click(function(){
			location.href="/template/viewmsg.jsp";
			return false;
		});
	});
</script>
<%@ include file="/WEB-INF/views/mentor/temp/temptitle.jsp" %><%-- /head ~ div(main, inner) ~ /header --%>
		<%-- Content --%>
		<section>
			<header class="main">
				<label style="font-size: 3em;">쪽지함</label>
			</header>
			
			<%-- 쪽지함 분류 --%>
			<div class="row gtr-uniform" style="margin: 0 0 1em 0;">
				<div class="col-12" style="padding-left: 0;">
					<div style="float: left; padding-left: 0;">
						 <select name="msg-cate" id="msg-cate">
							<option value="0">받은쪽지</option>
							<option value="1">보낸쪽지</option>
							<option value="2">휴지통</option>
						</select>
					</div>
					<div style="clear: both;">
					</div>
				</div>
			</div>
			<%-- 쪽지 검색 --%>
			<div class="row gtr-uniform" style="margin-top: 2em; margin-bottom: 1em;">
				<div class="col-3 col-12-small">
					<div style="float: left; margin-left: 0.5em;">
						<ul class="actions">
							<li><a href="#" id="checkAll" class="button"><i class="far fa-check-square"></i></a></li>
							<li><a href="#" class="button primary icon"><i class="far fa-trash-alt"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-9 col-12-small">
					<div class="col-2 col-4-small" style="float: right;">
						<ul class="actions">
							<li><a href="#" class="button primary icon"><i class="fas fa-search"></i></a></li>
							<li><a href="#" class="button"><i class="fas fa-redo"></i></a></li>
						</ul>
					<div class="col-0 col-8-small" style="float: right;">
					</div>
					</div>
					
					<div class="col-3 col-5-small" style="margin: 0 1em 0 0.5em; float: right;">
						<input type="email" name="demo-email" id="demo-email" value="" placeholder="검색어를 입력하세요" />
					</div>
					<div class="col-7 col-7-small" style="float: right;">
						 <select name="school-cate2" id="school-cate2">
							<option value="0">ID</option>
							<option value="1">내용</option>
						</select>
					</div>
					<div style="clear: both;">
					</div>
				</div>
			</div>
			<%-- 쪽지 목록 --%>
			<div>
				<table class="table-wrapper" style="text-align: center;">
					<tbody>
						<tr class="msgBtn">
							<td>
								<input type="checkbox" class="msg" id="msg1" name="msg1">
								<label for="msg1" style="padding-left: 0.1em;"></label>
							</td>
							<td><i class="fas fa-envelope"></i></td>
							<td>userID</td>
							<td style="text-align: left;">쪽지를 보냈습니다. 답장주세요.</td>
							<td>2019.05.24 11:23:12</td>
						</tr>
						<tr class="msgBtn">
							<td>
								<input type="checkbox" class="msg"  id="msg2" name="msg2">
								<label for="msg2" style="padding-left: 0.1em;"></label>
							</td>
							<td><i class="fas fa-envelope"></i></td>
							<td>userID</td>
							<td style="text-align: left;">쪽지를 보냈습니다. 답장주세요.</td>
							<td>2019.05.24 11:23:12</td>
						</tr>
						<tr class="msgBtn">
							<td>
								<input type="checkbox" class="msg" id="msg3" name="msg3">
								<label for="msg3" style="padding-left: 0.1em;"></label>
							</td>
							<td><i class="far fa-envelope-open"></i></td>
							<td>userID</td>
							<td style="text-align: left;">쪽지를 보냈습니다. 답장주세요.</td>
							<td>2019.05.24 11:23:12</td>
						</tr>
						<tr class="msgBtn">
							<td>
								<input type="checkbox" class="msg" id="msg4" name="msg4">
								<label for="msg4" style="padding-left: 0.1em;"></label>
							</td>
							<td><i class="far fa-envelope-open"></i></td>
							<td>userID</td>
							<td style="text-align: left;">쪽지를 보냈습니다. 답장주세요.</td>
							<td>2019.05.24 11:23:12</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7" align="center" style="padding-top: 4em;">
								<ul class="pagination">
									<li><span class="button disabled">Prev</span></li>
									<li><a href="#" class="page active">1</a></li>
									<li><a href="#" class="page">2</a></li>
									<li><a href="#" class="page">3</a></li>
									<li><span>&hellip;</span></li>
									<li><a href="#" class="page">8</a></li>
									<li><a href="#" class="page">9</a></li>
									<li><a href="#" class="page">10</a></li>
									<li><a href="#" class="button">Next</a></li>
								</ul>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>


		</section>
	</div> <%-- inner end --%>
</div> <%-- main end --%>
<%@ include file="/WEB-INF/views/mentor/temp/tempfooter.jsp" %><%-- sidebar ~ /html --%>