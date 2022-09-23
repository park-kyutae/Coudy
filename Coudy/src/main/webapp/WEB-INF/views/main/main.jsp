<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>


 #ks {
 animation: fadein 4s; 
}
@keyframes fadein {
	 0% {
	 opacity:0;
	 }
	 
	 100% {
	 opacity:1;
	 }
}

a:hover{
 text-decoration:none;
}

#t{
font-family: 'Noto Sans KR', sans-serif;
}



</style>
<!-- 메인 시작 -->
<div class="container-fluid" id="ks">
	<div class="text-center" style="margin:200px auto;">
<c:if test="${empty user}">
		<a href="${pageContext.request.contextPath}/member/login.do">
		<img src="${pageContext.request.contextPath}/images/COUDY_logo-05.png">
		<br>
		<div style="font-size:50px;color:gray;" class="my-5" id="t">
			쿠디와 시작하기
		</div>
		</a>
</c:if>
<c:if test="${!empty user}">
		<a href="${pageContext.request.contextPath}/member/myPage.do">
		<img src="${pageContext.request.contextPath}/images/COUDY_logo-05.png">
		<br>
		<div style="font-size:50px;color:gray;" class="my-5" id="t">
			쿠디와 시작하기
		</div>
		</a>
</c:if>
		
	</div>
</div>
<!-- 메인 끝 -->












