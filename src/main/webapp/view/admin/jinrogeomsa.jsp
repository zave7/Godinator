<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	var apikey = '76bb04e98de628d1c3711ade67c2344f';
	var q;
	
	$('#middleschool').click(function() {
		alert('중학생용클릭');
		location.href = "${root }/view/admin/geomsa_middle.jsp";
	});
	
	$('#highschool').click(function() {
		alert('고등학생용클릭a');
		location.href = "${root }/view/admin/geomsa_high.jsp";
	});
});
</script>

<section style="padding-top: 0px; padding-bottom: 10px;">
<img src="${root }/resources/images/admin/jinro_geomsa.png" style="width: 100; padding-top: 20px; float: center; margin-left: 200px;">
</section>
<a href="${root }/admin/geomsa_middle.jsp"></a><img src="${root }/resources/images/admin/geomsa_middle_school.png" style="width: 40% !important;" id="middleschool"></a>
<img src="${root }/resources/images/admin/geomsa_middle_school.png" style="width: 40% !important; margin-left: 50px;" id="highschool">
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>