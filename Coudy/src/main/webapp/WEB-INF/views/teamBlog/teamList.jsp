<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/teamblog.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/teamblog.fav.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_ik.css">


<style>
	a:link {color: black; text-decoration: none;}
	a:visited {color: black; text-decoration: none;}
</style>

<br><br><br>

<div class="container">
	<!-- <div class="p-4 p-md-5 mb-4 rounded text-white"
	 style="background-image: url('https://t1.daumcdn.net/cfile/tistory/213A744B58EC2A4409');
	 background-size:cover;
	 background-position:center center;">
		<div class="col-md-6 px-0">
			<h1  style="color:#820D92; font-size:80px;" class="display-4 fst-italic ">Team1 PROJECT</h1>
		</div>
	</div> -->
	
	
	
	<div class="row g-5  bg-success rounded"  style="background-image: url('https://t1.daumcdn.net/cfile/tistory/213A744B58EC2A4409');
	 background-size:cover;
	 background-position:center center;">
	<div class="col">
	
	<h3 class="pb-4 mb-4 fst-italic " >TeamBLOG</h3>
	</div>
	</div>
	<!-- <hr  style="border-top:5px solid #CB28BE" size="1" width="100%">
	 -->
	<!-- 게시글 -->
	<c:if test="${count==0 }">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	
	
	<c:if test="${count>0 }">
	<c:forEach var="teamblog" items="${list }">
	<div class="list-group col-md-12">
		<div class="row g-0  overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
		<a href="detail.do?team_num=${teamblog.team_num }"  >
        <div class="d-flex w-100 justify-content-between">
        <div class="mb-1">
      	<h5 class="fw-bold">${teamblog.team_title } </h5>
      	<c:if test="${!empty teamblog.photo_name }">
			<img src="imageView.do?team_num=${teamblog.team_num }&teamblog_type=1" width="30" height="30">
			</c:if>
			<c:if test="${empty teamblog.photo_name }">
			<img src="${pageContext.request.contextPath }/images/face.png" width="30" height="30">
			</c:if>
      	
      	<small>${teamblog.id }</small>
      	</div>
      	<small>${teamblog.team_reg_date }
      	<br> <img src="${pageContext.request.contextPath}/images/eye-fill.svg" class="mx-2"> ${teamblog.team_hit }
      	</small>
      	
    	</div>
    	 <h8>${teamblog.team_content }</h8>
        </a>
      	</div>
	</div>
	</c:forEach>
	
	<div class="row">
	<div class="col-4"></div>
	<div class="col-4">
	<form  class="d-flex" action="list.do" id="search_form" method="get">
				<select name="keyfield" id="keyfield" class="btn btn-light btn-sm" >
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>   >제목</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>   >ID+별명</option>
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>   >내용</option>
					<option value="4" <c:if test="${param.keyfield == 4}">selected</c:if>   >제목+내용</option>
				</select>
				<input type="search" name="keyword" id="keyword" value="${param.keyword }">
				<input class="btn btn-light btn-sm" type="submit" value="Search">
				<input class="btn btn-light btn-sm" type="button" value="List" onclick="location.href='list.do'">
	</form>
	</div>
	<div class="col-4 align-right">
	<c:if test="${!empty user }">
		<input class="btn btn-light btn-sm" type="button" value="글쓰기" onclick="location.href='write.do'">
	</c:if>
	</div>
	
	<br><br>
	<div style="text-align:center;">${page }</div>
	</c:if>
	
</div>
</div> 














 <%-- <div class="page-main">
	<h2>TeamBLOG</h2>	
	 
	
	<c:if test="${count==0 }">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count>0 }">
	<table class="table">
		<tr>
			<th>번호</th>
			<th width="400">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="teamblog" items="${list }">
		<tr>
			<td>${teamblog.team_num }</td>
			<td><a href="detail.do?team_num=${teamblog.team_num }">${teamblog.team_title }</a></td>
			<td>${teamblog.id }</td>
			<td>${teamblog.team_reg_date }</td>
			<td>${teamblog.team_hit	}</td>
		</tr>
		</c:forEach>
	
	</table>
	 <form action="list.do" id="search_form" method="get">
		<ul class="search align-right">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>   >제목</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>   >ID+별명</option>
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>   >내용</option>
					<option value="4" <c:if test="${param.keyfield == 4}">selected</c:if>   >제목+내용</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword }">
			</li>
			<li>
				<input type="submit" value="찾기">
				<input type="button" value="목록" onclick="location.href='list.do'">
			</li>
		</ul>
	</form>
	</c:if>
	<c:if test="${!empty user }">
	<div class="align-right">
		<input type="button" value="글쓰기" onclick="location.href='write.do'">
	</div>
	</c:if>
	</div>
	
	<div class="align-center">${page }</div>
</div>
</div>
<!-- 내용 끝 -->  --%>