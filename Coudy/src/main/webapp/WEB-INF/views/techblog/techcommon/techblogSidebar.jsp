<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="container">
	<div class="row">
		<div class="sidebar">
		   <div class="p-3 mt-2" >
		            <div class="fs-4">카테고리</div>
		            <hr size="1" width="100%" noshade="noshade">
		        <ul class="nav nav-pills flex-column mb-auto fs-6">
		            <li class="nav-item my-1">
		                    <a href="${pageContext.request.contextPath}/techblog/techblogList.do" id="techa" onclick=style.fontWeight='bold'>전체보기</a>
		            </li>
		            <li class="nav-item my-1">
		            	<a href="${pageContext.request.contextPath}/techblog/techblogListA.do" id="techa">코드 개발</a>
		            </li>
		            <li class="nav-item my-1">
		          		<a href="${pageContext.request.contextPath}/techblog/techblogListB.do" id="techa">개발자들의 이야기</a>
		            </li>
		            <li class="nav-item my-1">
		            	<a href="${pageContext.request.contextPath}/techblog/techblogListC.do" id="techa">AWS 설정 방법</a>
		            </li>
		            <li class="nav-item my-1">
		            	<a href="${pageContext.request.contextPath}/techblog/techblogListD.do" id="techa">코드리뷰</a>
		            </li>
		        </ul>
		    </div>
		</div>
	</div>
</div>