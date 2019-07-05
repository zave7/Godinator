<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %><%-- html ~ body의 header --%>
<style type="text/css">
	.far, .fas {font-size: 1.5em;}
	i {vertical-align: center;}
</style>
<script>
$(function(){
	<%-- 마우스 커서 변경 --%>
	$('.msgBtn').css('cursor', 'pointer');
	$('.editBtn').css('cursor', 'pointer');
	
	<%-- 웹소켓 접속 --%>
	$('.chatBtn').click(function(){
		<%-- 알림창: 멘토|멘티 >>> 멘토인경우 >>> 고등학교|대학교 --%>
		<%-- 각각 경우에 따라 session에 "cate"라는 이름으로 m|h|u 입력 --%>
		<%-- 멘티: 멘티용 채팅창, 멘토: 멘토용 채팅창으로 이동시킴 --%>
		if(confirm("멘티로 입장하시겠습니까?")) {
			window.open("${root}/mentor/onlinementor", "_blank", "width=600, height=700, left=500, top=20");
			
		} else {
			if(confirm("고등학교 멘토로 입장하시겠습니까?")) {
				<%-- ajax로 자격확인 >> 자격 있는 경우에만 session & 창 띄우기 --%>
				alert("고등학교 멘토로 입장합니다.");
				
			} else{
				<%-- ajax로 자격확인 >> 자격 있는 경우에만 session & 창 띄우기 --%>
				alert("대학교 멘토로 입장합니다.");
			}
		}
		return false;
	});
	
	<%-- 멘토 자격 확인 --%>
	function checkMentor(cate){
		
		return result;
	}
	
	<%-- 쪽지 작성 --%>
	$('.msgBtn').click(function(){
		window.open("/template/writemsg.jsp", "_blank", "width=600, height=700, left=500, top=20");
		return false;
	});
	<%-- 자소서 첨삭 신청 --%>
	$('.editBtn').click(function(){
		location.href="/template/writeresume.jsp";
		return false;
	});
});
</script>

		<%-- Content --%>
		<section>
			<header class="main">
				<label style="font-size: 3em;">멘토 찾기</label>
			</header>
			<%-- 멘토 검색 --%>
			<div class="row gtr-uniform" style="margin-top: 2em;">
				<div class="col-2 col-12-small">
				</div>
				<div class="col-10 col-12-small">
					<div class="col-2 col-12-small" style="padding-left	: 0; float: right;">
						<ul class="actions">
							<li><a href="#" class="button primary icon"><i class="fas fa-search"></i></a></li>
							<li><a href="#" class="button"><i class="fas fa-redo"></i></a></li>
						</ul>
					</div>
					<div class="col-2" style="padding-left: 0.5em; width: 15em; padding-right: 1em; float: right;">
						<input type="text" name="searchMentor" id="searchMentor" value="" placeholder="검색어를 입력하세요"/>
					</div>
					<div class="col-6" style="padding-left: 0.5em; float: right;">
						 <select name="school-cate2" id="school-cate2">
							<option value="0">ID</option>
							<option value="1">모교</option>
						</select>
					</div>
					<div class="col-2" style="float: right;">
						<ul class="actions chatBtn">
							<li><a href="#" class="button"><i class="far fa-comment-dots"></i></a></li>
						</ul>
					</div>
					<div style="clear: both;">
					</div>
				</div>
			</div>
			<%-- 학교 분류 --%>
			<div class="row gtr-uniform" style="margin: 0 0 2em 0;">
				<div class="col-2" style="padding-left: 0; width: 10em;">
					 <select name="school-cate1" id="school-cate1" >
						<option value="0">- 대분류 -</option>
						<option value="1">고등학교</option>
						<option value="2">대학교</option>
					</select>
				</div>
				<div class="col-2" style="width: 10em; padding-left: 0; margin-left: 1em;"> 
					 <select name="school-cate2" id="school-cate2">
						<option value="0">- 소분류 -</option>
						<option value="1">- 소분류 -</option>
						<option value="2">- 소분류 -</option>
					</select>
				</div>
			</div>
			<%-- 멘토 목록 --%>
			<div>
				<table class="alt" style="text-align: center;">
					<thead>
						<tr>
							<th></th>
							<th style="text-align: center;">ID</th>
							<th colspan="2" style="text-align: center;">고등학교</th>
							<th colspan="2" style="text-align: center;">대학교</th>
							<th style="text-align: center;">첨삭글수</th>
							<th style="text-align: center;">쪽지보내기</th>
							<th style="text-align: center;">첨삭의뢰</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>userID</td>
							<td>ㅇㅇ고등학교</td>
							<td>특목고</td>
							<td>ㅇㅇ대학교</td>
							<td>이공계</td>
							<td>5건</td>
							<td class="msgBtn"><i class="far fa-envelope"></i></td>
							<td class="editBtn"><i class="fas fa-edit"></i></td>
						</tr>
						<tr>
							<td>2</td>
							<td>userID</td>
							<td>ㅇㅇ고등학교</td>
							<td>특목고</td>
							<td>ㅇㅇ대학교</td>
							<td>이공계</td>
							<td>5건</td>
							<td class="msgBtn"><i class="far fa-envelope"></i></td>
							<td class="editBtn"><i class="fas fa-edit"></i></td>
						</tr>
						<tr>
							<td>3</td>
							<td>userID</td>
							<td>ㅇㅇ고등학교</td>
							<td>특목고</td>
							<td>ㅇㅇ대학교</td>
							<td>이공계</td>
							<td>5건</td>
							<td class="msgBtn"><i class="far fa-envelope"></i></td>
							<td class="editBtn"><i class="fas fa-edit"></i></td>
						</tr>
						<tr>
							<td>4</td>
							<td>userID</td>
							<td>ㅇㅇ고등학교</td>
							<td>특목고</td>
							<td>ㅇㅇ대학교</td>
							<td>이공계</td>
							<td>5건</td>
							<td class="msgBtn"><i class="far fa-envelope"></i></td>
							<td class="editBtn"><i class="fas fa-edit"></i></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="9" align="center" style="padding-top: 4em;">
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