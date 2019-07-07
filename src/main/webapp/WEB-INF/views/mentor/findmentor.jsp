<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %><%-- html ~ body의 header --%>
<style>
	.far, .fas {font-size: 1.5em;}
	i {vertical-align: center;}
	 /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
	
</style>
<script>
$(function(){
	<%-- #### 채팅 #### --%>
	<%-- 채팅 권한 선택 modal --%>
	$('.chatBtn').click(function(){
		$('#myModal').css("display", "block");
		return false;
	});
	
	<%-- 각각 경우에 따라 session에 "cate"라는 이름으로 m|h|u 입력 --%>
	<%-- 멘티: 멘티용 채팅창, 멘토: 멘토용 채팅창으로 이동시킴 --%>
	$('.auth').click(function(){
		var cate = $(this).attr('data-cate');
		var cateStr = $(this).text();
		checkAuth(cate, cateStr);
	});
	
	<%-- 채팅 권한 확인 --%>
	function checkAuth(cate, cateStr){
		<%-- ajax로 자격확인 >> 자격 있는 경우에만 session & 창 띄우기 --%>
		$.ajax({
			url: '${root}/chat/checkAuth',
			data: 'cate=' + cate,
			success: function(response){
				if(response == '1') {
					alert(cateStr + '로 입장합니다.');
					if(cate == 'm') {
						window.open("${root}/chat/connmentee", "_blank", "width=600, height=700, left=500, top=20");
					} else {
						window.open("${root}/chat/connmentor", "_blank", "width=600, height=700, left=500, top=20");
					}
				}
			}
		});
	}
	
	
	<%-- #### 쪽지 #### --%>
	<%-- 쪽지 작성 --%>
	$('.msgBtn').click(function(){
		window.open("/template/writemsg.jsp", "_blank", "width=600, height=700, left=500, top=20");
		return false;
	});
	
	<%-- #### 자소서 #### --%>
	<%-- 자소서 첨삭 신청 --%>
	$('.editBtn').click(function(){
		location.href="/template/writeresume.jsp";
		return false;
	});
	
	
	
	<%-- #### 기타 화면상 기능 #### --%>
	<%-- 마우스 커서 변경 --%>
	$('.msgBtn').css('cursor', 'pointer');
	$('.editBtn').css('cursor', 'pointer');
	
	<%-- 모달창 종료 --%>
	$('#close').click(function(){
		$('#myModal').css("display", "none");
	});
	$(document).click(function(){
		$('#myModal').css("display", "none");
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
		<div id="myModal" class="modal">
	 
	      <!-- Modal content -->
	      <div class="modal-content">
	        <div class="close">&times;</div>                                                               
	        <p>채팅 입장 권한을 선택하세요.</p>
	        <div style="text-align: center;">
	        	<button class="auth" data-cate="m">멘티</button>
	        	<button class="auth" data-cate="h">고등학교 멘토</button>
	        	<button class="auth" data-cate="u">대학교 멘토</button>
	        </div>
	      </div>
	 
	    </div>
		
<%@ include file="/WEB-INF/views/template/sidebar.jsp" %><%-- div(inner end) ~ /html --%>