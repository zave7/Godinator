<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<style>
hr {
	border: 1px dashed #5a5a5a;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
    var user = "unknown";
    countVisit(user);
    
    /*  윤영 part 방문자 통계用  */
    function countVisit(user) { 
    //$(user).attr("action","/godinator/admin/countVisit").submit();
    //alert('여기와염' + user);
          
    	$.ajax({
			url : "${root}/admin/countVisit",
	        type : "get",
	        contentType : "application/json;charset=UTF-8",
	        data : "user="+user,
    	});
	}
});
</script>

<!-- Content -->
<header class="main">
	<h1>메인화면</h1>
</header>
<form id="editForm" name="editForm">
	<input type="hidden" name="userInfo" id="userInfo" value="${userInfo}">
	<input type="hidden" name="hName" id="hName" value="${hName}">
	<input type="hidden" name="uName" id="uName" value="${uName}">
	<input type="hidden" name="cateList" id="cateList" value="${cateList}">
</form>
<!-- Content -->

<div class="mainscope">
	<p>학교 추천서비스</p>
</div>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>