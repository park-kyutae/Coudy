<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/notice.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
   crossorigin="anonymous">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
   crossorigin="anonymous"></script>

<div class="page-main">
	<h2>Coudy 공지</h2>	
	 
	
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
		<c:forEach var="notice" items="${list }">
		<tr>
			<td>${notice.notice_num }</td>
			<td><a href="detail.do?notice_num=${notice.notice_num }">${notice.notice_title }</a></td>
			<td>${notice.id }</td>
			<td>${notice.notice_reg_date }</td>
			<td>${notice.notice_hit	}</td>
		</tr>
		</c:forEach>
	<div>
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
	<c:if test="${!empty user }">
	<div class="align-right">
		<input type="button" value="글쓰기" onclick="location.href='write.do'">
	</div>
	</c:if>
	</div>
	
	<div class="align-center">${page }</div>
	</c:if>
</div>
<!-- 내용 끝 -->
