<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/board.js"></script>
<div class="page-main">
	<h2>기술블로그</h2>
	<c:if test="${!empty user}">
	<div class="align-right">
		<input type="button" value="글쓰기"
		          onclick="location.href='techblogWrite.do'">
	</div>
	</c:if>
</div>
<!-- 내용 끝 -->



