<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">

<style>
#t{
	font-family: 'Noto Sans KR', sans-serif;
}
a:hover{
	 text-decoration:none;
	 color:gray;
}
</style>



	<div class="row border-bottom" id="t" style="height: 40px;background-color:white;">
		<div class="col">
			<span >
				<a href="/">
					<img class="mt-1" src="${pageContext.request.contextPath}/images/COUDY_logo-04.png" width="100px" height="30px">
				</a>
			</span>
		</div>
		<div class="col text-end">
			<a class="fs-6 me-1" style="line-height: 40px" href="${pageContext.request.contextPath}/study/studygrouplist.do">스터디</a>
			<a class="fs-6 me-1" style="line-height: 40px" href="${pageContext.request.contextPath}/techblog/techblogList.do">기술블로그</a>
			<a class="fs-6 me-1" style="line-height: 40px" href="${pageContext.request.contextPath}/company/comHome.do">채용공고</a>
			<a class="fs-6 me-1" style="line-height: 40px" href="${pageContext.request.contextPath}/notice/list.do">공지게시판</a>
			<c:if test="${!empty user && !empty user.photo}">
				<img src="${pageContext.request.contextPath}/member/photoView.do" width="25" height="25" class="my-photo">
			</c:if>
			<c:if test="${!empty user && empty user.photo}">
				<img src="${pageContext.request.contextPath}/images/face.png" width="25" height="25" class="my-photo">
			</c:if>
			<c:if test="${!empty user}">
				[<span class="user_name  me-1">${user.id}</span>]
			</c:if>
			<c:if test="${empty user}">
				<a class="fs-6 me-1" style="line-height: 40px" href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a>
				<a class="fs-6 me-1" style="line-height: 40px" href="${pageContext.request.contextPath}/member/login.do">로그인</a>
			</c:if>
			<c:if test="${!empty user}">
				<a class="fs-6 me-1" style="line-height: 40px" href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
			</c:if>
			<c:if test="${!empty user && user.auth == 2}">
				<a class="fs-6 me-1" style="line-height: 40px" href="${pageContext.request.contextPath}/member/myPage.do">MY페이지</a>
			</c:if>

			<c:if test="${!empty user && user.auth == 4}">
				<a class=" me-1" href="${pageContext.request.contextPath}/member/admin_list.do">회원관리</a>
			</c:if>
			&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	<nav class="navbar navbar-light sticky-top bg-white navbar-expand-lg  border-2 border-bottom sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="/">
				<img style="height: 40px" src="${pageContext.request.contextPath}/images/COUDY_logo-04.png">
			</a>
			<div class="align-items-center">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 align-items-center">
					<li class="nav-item"><a class="nav-link"  href="${pageContext.request.contextPath}/study/studygrouplist.do">스터디</a></li>
					<li class="nav-item"><a class="nav-link"  href="${pageContext.request.contextPath}/techblog/techblogList.do">기술블로그</a></li>
					<li class="nav-item"><a class="nav-link"  href="${pageContext.request.contextPath}/company/comHome.do">채용공고</a></li>
					<li class="nav-item"><a class="nav-link"  href="${pageContext.request.contextPath}/notice/list.do">공지게시판</a></li>
				<c:if test="${!empty user && !empty user.photo}">
					<li class="nav-item "><img  src="${pageContext.request.contextPath}/member/photoView.do" width="25" height="25" class="my-photo rounded-circle"></li>
				</c:if>
				<c:if test="${!empty user && empty user.photo}">
					<li class="nav-item "><img src="${pageContext.request.contextPath}/images/face.png" width="25" height="25" class="my-photo rounded-circle"></li>
				</c:if>
				<c:if test="${!empty user}">
					<li class="nav-item"><span class="user_name nav-link">[${user.id}]</span></li>
				</c:if>
				<c:if test="${empty user}">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/login.do">로그인</a></li>
				</c:if>
				<c:if test="${!empty user}">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
				</c:if>
				<c:if test="${!empty user && user.auth == 2}">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/myPage.do">MY페이지</a></li>
				</c:if>

				<c:if test="${!empty user && user.auth == 4}">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/admin_list.do">회원관리</a></li>
				</c:if>
					&nbsp;&nbsp;</ul>
			</div>
		</div>

	</nav>




