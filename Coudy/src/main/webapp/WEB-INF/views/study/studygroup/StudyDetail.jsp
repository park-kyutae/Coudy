<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap.min.js">
</head>
<body>
<div class="container">
	<div class="row bg-primary bg-gradient ">
		<div class="col-12">
			<img src="https://i.pravatar.cc/64" class="img-thumbnail rounded float-start" alt="...">
			<h1>${studygroup.name}</h1>
			<h2>${studygroup.description}</h2>
			<c:if test="${!empty user && studygroup.mem_num == user.mem_num}">
				<button class="btn btn-info" onclick="location.href='updatestudygroup.do?study_num=${studygroup.study_num}'">수정하기</button>
				<button class="btn btn-danger" onclick="location.href='deletestudygroup.do?study_num=${studygroup.study_num}'">삭제하기</button>
			</c:if>
			<c:if test="${!empty user && studygroup.mem_num != user.mem_num}">
				<button class="btn btn-info" onclick="location.href='applicationcreate.do?study_num=${studygroup.study_num}'">신청하기</button>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>



