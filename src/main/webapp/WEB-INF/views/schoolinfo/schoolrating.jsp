<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>

	<!-- Content -->
		<section>
			<header class="main">
				<h1 class="mogyoH1R">고등학교 및 대학교 평가</h1>
			</header>
			<div class="row">
				<div class="col-10 col-12-small">
				</div>
				<div class="col-2 col-12-small">
					<h3 class="mogyoH2R">모교 검색</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-7 col-12-small">
				</div>
				<div class="col-2 col-12-small">
				<select name="test">
					<option value="high">고등학교</option>
					<option value="uni">대학교</option>
				</select>
				</div>
				<div class="col-3 col-12-small">
				<input type="text"/>
				</div>
			</div>
			<!-- Content -->
				<h2 id="content">항목 평가</h2>
				<div class="row">
					<div class="col-6 col-12-small">
						<span>시설 : </span><div class="starRev">
										  <span class="starR on">별1</span>
										  <span class="starR">별2</span>
										  <span class="starR">별3</span>
										  <span class="starR">별4</span>
										  <span class="starR">별5</span>
										  <span class="starR">별6</span>
										  <span class="starR">별7</span>
										  <span class="starR">별8</span>
										  <span class="starR">별9</span>
										  <span class="starR">별10</span>
										</div>
					</div>
					<div class="col-6 col-12-small">
						<span>학업분위기 : </span><div class="starRev">
										  <span class="starR on">별1</span>
										  <span class="starR">별2</span>
										  <span class="starR">별3</span>
										  <span class="starR">별4</span>
										  <span class="starR">별5</span>
										  <span class="starR">별6</span>
										  <span class="starR">별7</span>
										  <span class="starR">별8</span>
										  <span class="starR">별9</span>
										  <span class="starR">별10</span>
										</div>
					</div>
				</div><br>
				<div class="row">
					<div class="col-6 col-12-small">
						<span>교직원 (교육, 인성) : </span><div class="starRev">
										  <span class="starR on">별1</span>
										  <span class="starR">별2</span>
										  <span class="starR">별3</span>
										  <span class="starR">별4</span>
										  <span class="starR">별5</span>
										  <span class="starR">별6</span>
										  <span class="starR">별7</span>
										  <span class="starR">별8</span>
										  <span class="starR">별9</span>
										  <span class="starR">별10</span>
										</div>
					</div>
					<div class="col-6 col-12-small">
						<span>진로 교육 : </span><div class="starRev">
										  <span class="starR on">별1</span>
										  <span class="starR">별2</span>
										  <span class="starR">별3</span>
										  <span class="starR">별4</span>
										  <span class="starR">별5</span>
										  <span class="starR">별6</span>
										  <span class="starR">별7</span>
										  <span class="starR">별8</span>
										  <span class="starR">별9</span>
										  <span class="starR">별10</span>
										</div>
					</div>
				</div><br>
				<div class="row">
					<div class="col-6 col-12-small">
						<span>학생 복지 : </span><div class="starRev">
										  <span class="starR on">별1</span>
										  <span class="starR">별2</span>
										  <span class="starR">별3</span>
										  <span class="starR">별4</span>
										  <span class="starR">별5</span>
										  <span class="starR">별6</span>
										  <span class="starR">별7</span>
										  <span class="starR">별8</span>
										  <span class="starR">별9</span>
										  <span class="starR">별10</span>
										</div>
					</div>
				</div>
				<hr>
				<h2 id="content">학교 장단점</h2>
				<div class="row">
				<div class="col-2 col-12-small">
					<h3 class="mogyoH2L">장점</h3>
				</div>
				<div class="col-10 col-12-small">
				</div>
				</div>
				<div class="row">
					<div class="col-12">
						<textarea name="demo-message" id="demo-message" placeholder="학교 장점을 입력해주세요" rows="6"></textarea>
					</div>
				</div>
				<div class="row">
				<div class="col-2 col-12-small">
					<h3 class="mogyoH2L">단점</h3>
				</div>
				<div class="col-10 col-12-small">
				</div>
				</div>
				<div class="row">
					<div class="col-12">
						<textarea name="demo-message" id="demo-message" placeholder="학교 단점을 입력해주세요" rows="6"></textarea>
					</div>
				</div>
				<br>
				<div class="row submit-school-evaluation">
					<div class="col-4 col-12-small">
					</div>
					<div class="col-2 col-1-small">
						<a href="" class="button primary" id="submit">확인</a>
					</div>
					<div class="col-2 col-1-small">
						<a href="" class="button" id="cancel">취소</a>
					</div>
				</div>
		</section>

		<script>
			$(document).ready(function(e){
			    $('.search-panel .dropdown-menu').find('a').click(function(e) {
					e.preventDefault();
					var param = $(this).attr("href").replace("#","");
					var concept = $(this).text();
					$('.search-panel span#search_concept').text(concept);
					$('.input-group #search_param').val(param);
				});
				$("div.submit-school-evaluation a#submit").click(function() {
					var check = confirm("입력 확인 시 수정이 불가합니다. 신중히 작성해주시기 바랍니다.\n작성 완료하시겠습니까?");
					return false;
				});
				$('div.starRev span').click(function(){
				  $(this).parent().children('span').removeClass('on');
				  $(this).addClass('on').prevAll('span').addClass('on');
				  return false;
				});
			});
		</script>
<%@ include file="../template/sidebar.jsp" %>