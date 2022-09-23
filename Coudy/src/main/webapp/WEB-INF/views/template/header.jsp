<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



	<div class="row border-bottom" style="height: 40px;background-color:white;">
		<div class="col">
			<span >
				<a href="/">
					<img class="mt-1" src="${pageContext.request.contextPath}/images/COUDY_logo-04.png" width="14%" height="80%">
				</a>
			</span>
		</div>
		<div class="col text-end">
			<a class="fs-6" style="line-height: 40px" href="${pageContext.request.contextPath}/study/studygrouplist.do">스터디</a>
			<a class="fs-6" style="line-height: 40px" href="${pageContext.request.contextPath}/techblog/techblogList.do">기술블로그</a>
			<a class="fs-6" style="line-height: 40px" href="${pageContext.request.contextPath}/company/comHome.do">채용공고</a>
			<a class="fs-6" style="line-height: 40px" href="${pageContext.request.contextPath}/notice/list.do">공지게시판</a>
			<c:if test="${!empty user && !empty user.photo}">
				<img src="${pageContext.request.contextPath}/member/photoView.do" width="25" height="25" class="my-photo">
			</c:if>
			<c:if test="${!empty user && empty user.photo}">
				<img src="${pageContext.request.contextPath}/images/face.png" width="25" height="25" class="my-photo">
			</c:if>
			<c:if test="${!empty user}">
				[<span class="user_name">${user.id}</span>]
			</c:if>
			<c:if test="${empty user}">
				<a class="fs-6" style="line-height: 40px" href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a>
				<a class="fs-6" style="line-height: 40px" href="${pageContext.request.contextPath}/member/login.do">로그인</a>
			</c:if>
			<c:if test="${!empty user}">
				<a class="fs-6" style="line-height: 40px" href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
			</c:if>
			<c:if test="${!empty user && user.auth == 2}">
				<a class="fs-6" style="line-height: 40px" href="${pageContext.request.contextPath}/member/myPage.do">MY페이지</a>
			</c:if>
		
			<c:if test="${!empty user && user.auth == 4}">
				<a  href="${pageContext.request.contextPath}/member/admin_list.do">회원관리</a>
			</c:if>
			&nbsp;&nbsp;
		</div>
	</div>

<!-- 상단 시작 -->
<%--<h2 class="align-center">SpringPage</h2>--%>
<%--<div class="align-right">--%>
<%--	<a href="${pageContext.request.contextPath}/study/studygrouplist.do">스터디</a>--%>
<%--	<a href="${pageContext.request.contextPath}/techblog/techblogList.do">기술블로그</a>--%>
<%--	<a href="${pageContext.request.contextPath}/company/comHome.do">채용공고</a>--%>
<%--	<a href="${pageContext.request.contextPath}/notice/list.do">공지게시판</a>--%>
<%--	<c:if test="${!empty user && !empty user.photo}">--%>
<%--		<img src="${pageContext.request.contextPath}/member/photoView.do" width="25" height="25" class="my-photo">--%>
<%--	</c:if>--%>
<%--	<c:if test="${!empty user && empty user.photo}">--%>
<%--		<img src="${pageContext.request.contextPath}/images/face.png" width="25" height="25" class="my-photo">--%>
<%--	</c:if>--%>
<%--	<c:if test="${!empty user}">--%>
<%--		[<span class="user_name">${user.id}</span>--%>
<%--	</c:if>--%>
<%--	<c:if test="${empty user}">--%>
<%--		<a href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a>--%>
<%--		<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>--%>
<%--	</c:if>--%>
<%--	<c:if test="${!empty user}">--%>
<%--		<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>--%>
<%--	</c:if>--%>
<%--	<c:if test="${!empty user && user.auth == 2}">--%>
<%--		<a href="${pageContext.request.contextPath}/member/myPage.do">MY페이지</a>--%>
<%--	</c:if>--%>
<%--	<a href="${pageContext.request.contextPath}/main/main.do">홈으로</a>--%>
<%--</div>--%>
<!-- 상단 끝 -->



