<%@page import="com.kitri.godinator.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<a href="${pageContext.request.contextPath}/mentor/findmentor"><li>findmentor.jsp</li></a>
	<a href="${pageContext.request.contextPath}/msg/msgbox"><li>msgbox.jsp</li></a>
	<a href="${pageContext.request.contextPath}/resume/resumelist"><li>resumelist.jsp</li></a>
	<a href="${pageContext.request.contextPath}/resume/editlist"><li>editlist.jsp</li></a>
</ul>
</body>
</html>