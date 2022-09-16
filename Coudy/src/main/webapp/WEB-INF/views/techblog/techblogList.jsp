<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_kt.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<div class="container">
<c:if test="${!empty user}">
			<div class="row">
				<div class="col text-sm-end">
				<input type="button" value="글쓰기"
				          onclick="location.href='techblogWrite.do'">					
				</div>
			</div>
</c:if>
				<c:if test="${count == 0}">
					<div class="row">
						<div class="col d-flex justify-content-center">
								표시할 게시물이 없습니다.
						</div>
					</div>
				</c:if>
				<c:if test="${count > 0}">
				<c:forEach var="techblog" items="${list}">
					<div class="row">
						<div class="col my-3" id="techdate">
							${techblog.tech_date}
							${techblog.tech_name}
							<c:if test="${!empty techblog.photo_name}">
								<img src="imageView.do?tech_num=${techblog.tech_num}&board_type=1" width="40" height="40" class="my-photo">
							</c:if>
							<c:if test="${empty techblog.photo_name}">
								<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
							</c:if>
						</div>
						<div class="col my-auto mx-3">
						<img src="${pageContext.request.contextPath}/images/eye-fill.svg" class="mx-2">
							${techblog.tech_hit}
						</div>
					</div>
					<div class="row">
						<div class="col my-auto" id="techtitle">
							<a href="techblogDetail.do?tech_num=${techblog.tech_num}" id="techa">${techblog.tech_title}</a>
						</div>
					</div>
					<div class="row">
						<div class="col my-auto text-muted" id="techcontent">
							<a href="techblogDetail.do?tech_num=${techblog.tech_num}" id="techa">${techblog.tech_content}</a>
						</div>
					</div>
					<div class="row">
						<div class="col my-auto">
							<hr width="100%" noshade="noshade" size="1">
						</div>
					</div>
				</c:forEach>
						<div class="row" align="center">
						${page}
						</div>
						<form action="techblogList.do" id="search_form" method="get">
							<div class="row d-flex justify-content-center" >
								<div class="col d-flex justify-content-center">
									<ul class="list-group list-group-horizontal">
										<li class="list-group-item">
											<select name="keyfield" id="keyfield" class="form-select form-select-sm">
												<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목</option>
												<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>작성자</option>
												<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>내용</option>
												<option value="4" <c:if test="${param.keyfield == 4}">selected</c:if>>제목+내용</option>
											</select>
										</li>
										<li class="list-group-item">
											<input type="search" name="keyword" id="keyword"
											               value="${param.keyword}" class="form-control form-control-sm">
										</li>
										<li class="list-group-item">
											<input type="image" name="submit" src="${pageContext.request.contextPath}/images/search.svg" style="vertical-align: center; margin-top: 6px;">
										</li>
									</ul>
								</div>
							</div>
					</form>
				</c:if>
		</div>


