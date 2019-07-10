<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %><%-- html ~ body의 header --%>
<style type="text/css">
	.far, .fas {
		vertical-align: center;
		font-size: 1.3em;
	}
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
	<%-- 학교 분류 select 변경 이벤트 처리 --%>
	$('#school-cate1').change(function(){
		if($(this).val() == 'h') {
			$('#hcate2').css('display', '');
			$('#ucate2').css('display', 'none');
			$('#majorDiv').css('display', 'none');
		} else {
			$('#hcate2').css('display', 'none');
			$('#ucate2').css('display', '');
			$('#majorDiv').css('display', '');
		}
	});
	
	<%-- 학교 검색창 활성화 --%>
	$('#schoolName').click(function(){
		$('#myModal').css("display", "block");
		return false;
	});
	
	<%-- 학교 검색 --%>
	$('#srcName').keyup(function(e){
		if(e.keyCode == 27){
			modalClose();
		} else {
			var srcName = $(this).val().trim();
			if(srcName != '') {
				var cate1 = $('#school-cate1 option:selected').val();
				var cate2 = (bSchoolCate1 == 'h') ? $('#hcate2 option:selected').val() : $('#ucate2 option:selected').val();
				var param = JSON.stringify({'srcName' : srcName, 'cate1' : cate1, 'cate2' : cate2});
				$.ajax({
					url: '${root}/resume/srcschool',
					contentType : 'application/json; charset=UTF-8',
					type: 'POST',
					dataType : 'json',
					data : param,
					success: function(response){
						var list = '';
						var cnt = response.length;
						for(var i=0;i<cnt;i++) {
							var school = response[i];
							list += '<tr class="school">';
							list += '	<td>' + school.bSchoolName + '</td>';
							list += '	<td>' + ((school.bSchoolCate2 != undefined) ? school.bSchoolCate2 : '') + '</td>';
							list += '</tr>';
						}
						$('#schoolList').html(list);
					}
				});
			}
		}
		return false;
	});
	
	<%-- #### function #### --%>
	function modalClose(){
		$('#myModal').css('display', 'none');
		$('#srcName').val('');
		$('#schoolList').empty();
	}
	
	
	<%-- #### 기타 화면상 기능 #### --%>
	<%-- 마우스 커서 변경 --%>
	$('#schoolName').css('cursor', 'pointer');
	
	<%-- 모달창 종료 --%>
	$('#close').click(function(){
		modalClose();
	});
	$(document).keyup(function(e){
		if(e.keyCode == 27){
			modalClose();
		}
	});
	
	<%-- 모달창 tr 색상 변경 --%>
	$(document).on('mouseover', '.school', function(){
		$(this).css('background-color', 'lightgrey').css('cursor', 'pointer');
	});
	$(document).on('mouseout', '.school', function(){
		$(this).css('background-color', '');
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
				<input type="hidden" id="bSchoolCode" name="bSchoolCode">
				<input type="hidden" id="bSchoolCate1" name="bSchoolCate1">
				<input type="hidden" id="bSchoolCate2" name="bSchoolCate2">
				<input type="hidden" id="bUserId" name="bUserId">
				<input type="hidden" id="userName" name="userName">
				<input type="hidden" id="mentorId" name="mentorId">
				<div class="row gtr-uniform">
					<%-- 학교정보 --%>
					<div class="row gtr-uniform" style="margin: 0">
						<div class="col-2" style="padding-left: 0; width: 10em;">
							 <select name="school-cate1" id="school-cate1" >
								<option value="h">고등학교</option>
								<option value="u">대학교</option>
							</select>
						</div>
						<div class="col-2" style="padding-left: 1em; width: 10em;">
							<select name="hcate2" id="hcate2">
								<option value="0">- 전체 -</option>
								<option value="특수목적고등학교">특수목적고등학교</option>
								<option value="일반고등학교">일반고등학교</option>
								<option value="자율고등학교">자율고등학교</option>
								<option value="특성화고등학교">특성화고등학교</option>
							</select>
							<select name="ucate2" id="ucate2" style="display: none;">
								<option value="0">- 전체 -</option>
								<option value="1">대학교</option>
								<option value="2">전문대학</option>
								<option value="3">사이버대학</option>
								<option value="4">기타</option>
							</select>
						</div>
						<div class="col-2" id="majorDiv" style="padding-left: 1em; width: 10em; display: none;">
							<select name="major" id="major">
								<option value="0">- 전공 -</option>
								<option value="인문·사회">인문·사회</option>
								<option value="자연·공학">자연·공학</option>
								<option value="의학">의학</option>
								<option value="예술·체육">예술·체육</option>
								<option value="교육">교육</option>
							</select>
						</div>
						<div class="col-2" style="width: 14em; padding-left: 1em; "> 
							 <input type="text" readonly="readonly" id="schoolName" name="schoolName" placeholder="학교명"/>
						</div>
					</div>
					<div class="col-12" style="margin-top: 3em; margin-bottom: 1em; text-align: right;">
						<label style="margin-bottom: 5px; font-size: 1.2em; color: gray;">mentor ID : ${mentor}</label>
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
		<div id="myModal" class="modal">
	      <!-- Modal content -->
	      <div class="modal-content">
	      	<div style="border-bottom: solid; padding-bottom: 0.7em;  margin-bottom: 0.5em;">
	        	<div class="close" id="close" style="float: right;">&times;</div>
	      		<div style="float: left; margin-left: 0.5em;">
					<input type="text" id="srcName" placeholder="학교명"/>
				</div>
	      		<div style="clear: both;"></div>
        	</div>                                                               
	        <div style=" height: 350px; overflow-y: auto">
	        	<table>
	        		<tbody id="schoolList">
					</tbody>
	        	</table>
	        </div>
	      </div>
	    </div>
<%@ include file="/WEB-INF/views/template/sidebar.jsp" %><%-- div(inner end) ~ /html --%>