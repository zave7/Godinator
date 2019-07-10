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
		// 마우스 커서 변경
		$('.resumeBtn').css('cursor', 'pointer');
		$('.editBtn').css('cursor', 'pointer');
		
		// 자소서 내용보기
		$('.resumeBtn').click(function(){
			location.href="${root}/view/mentor/viewresume.jsp";
			return false;
		});
		// 첨삭 내용보기
		$('.editBtn').click(function(){
			location.href="${root}/view/mentor/viewedit.jsp";
			return false;
		});
	});
</script>
		<%-- Content --%>
		<section>
			<header class="main">
				<label style="font-size: 3em;">자소서 목록</label>
			</header>
			<%-- 자소서&첨삭 분류 --%>
			<div class="row gtr-uniform" style="margin: 0 0 3em 0; padding-right:0;">
				<div class="col-2" style="width:8em; padding-left: 0;">
					 <select name="school-cate2" id="school-cate2">
						<option value="0">첨삭대기</option>
						<option value="1">첨삭완료</option>
					</select>
				</div>
				<div class="col-2" style="width:10em; padding-left: 0; margin-left: 1em;"> 
					<select name="school-cate1" id="school-cate1" >
						<option value="0">- 학교분류 -</option>
						<option value="1">고등학교</option>
						<option value="2">대학교</option>
					</select>
				</div>
			</div>
			<%-- 자소서&첨삭 목록 --%>
			<div>
				<table class="table-wrapper" style="text-align: center;">
					<thead>
						<tr>
							<th></th>
							<th style="text-align: center;">학교명</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">멘토</th>
							<th style="text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr class="resumeBtn">
							<td>✔</td>
							<td>ㅇㅇ고등학교</td>
							<td style="text-align: left;">ㅇㅇ고등학교 지원 자소서</td>
							<td>userID</td>
							<td>2019.06.12</td>
						</tr>
						<tr class="editBtn">
							<td>↳</td>
							<td>ㅇㅇ고등학교</td>
							<td style="text-align: left;">Re: ㅇㅇ고등학교 지원 자소서</td>
							<td>mentorID</td>
							<td>2019.06.27 11:23:12</td>
						</tr>
						<tr class="resumeBtn">
							<td>첨삭대기</td>
							<td>ㅇㅇ대학교</td>
							<td style="text-align: left;">ㅇㅇ대학교 지원 자소서</td>
							<td>userID</td>
							<td>2019.06.01</td>
						</tr>
						<tr class="resumeBtn">
							<td>첨삭대기</td>
							<td>ㅇㅇ대학교</td>
							<td style="text-align: left;">ㅇㅇ대학교 지원 자소서</td>
							<td>userID</td>
							<td>2019.05.24</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" align="center" style="padding-top: 4em;">
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
<%@ include file="/WEB-INF/views/template/sidebar.jsp" %><%-- div(inner end) ~ /html --%>