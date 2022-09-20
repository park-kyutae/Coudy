<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/techblog.fav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/techblog.reply.js"></script>
<div class="container">
	<div class="row mt-3">
		<div class="col">
			<h2>${techblog.tech_title}</h2>
		</div>
	</div>
	<div class="row">
		<div class="col d-flex justify-content-end">
			<c:if test="${!empty user && user.mem_num == techblog.mem_num}">
		<input type="button" value="수정" 
		  onclick="location.href='techblogUpdate.do?tech_num=${techblog.tech_num}'" class="btn btn-primary btn-sm">
		<input type="button" value="삭제" class="btn btn-danger btn-sm" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			//이벤트 연결
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('techblogDelete.do?tech_num=${techblog.tech_num}');
				}
			};
		</script>  
		</c:if>
		</div>
	</div>
	<hr size="1" width="100%" noshade="noshade">
	<div class="row">
		<div class="col">
			<c:if test="${!empty techblog.tech_modifydate}">
			${techblog.tech_modifydate}	
			</c:if>
			<c:if test="${empty techblog.tech_modifydate}">
			${techblog.tech_date}	
			</c:if>
			${techblog.tech_name}
			<c:if test="${!empty board.photo_name}">
			<img src="imageView.do?board_num=${board.board_num}&board_type=1" width="40" height="40" class="my-photo">
			</c:if>
			<c:if test="${empty board.photo_name}">
			<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
			</c:if>
		</div>
		<div class="col d-flex justify-content-end my-1">
			조회 : ${techblog.tech_hit}
		</div>
	</div>
	<div class="row">
		<div class="col my-2">
			태그 ${techblog.tech_tag}
		</div>
	</div>
	<div class="row">
		<p>
			${techblog.tech_content}
		</p>
	</div>
	
	<div>
		<%-- 좋아요 --%>
		<img id="output_fav" src="${pageContext.request.contextPath}/images/fav01.gif" width="40">
		<span id="output_fcount"></span>
	</div>
	<hr size="1" width="100%">
	<!-- 댓글 UI 시작 -->
	<div id="reply_div">
		<span class="re-title">댓글 달기</span>
		<form id="re_form">
			<input type="hidden" name="tech_num"
			   value="${techblog.tech_num}" id="tech_num">
			<textarea rows="3" cols="50" 
			  name="tech_re_content" id="tech_re_content"
			  class="rep-content"
			  <c:if test="${empty user}">disabled="disabled"</c:if>
			  ><c:if test="${empty user}">로그인해야 작성할 수 있습니다.</c:if></textarea>
			<c:if test="${!empty user}">
			<div id="re_first">
				<span class="letter-count">300/300</span>
			</div>
			<div id="re_second" class="align-right">
				<input type="submit" value="전송">
			</div>
			</c:if>
		</form>
	</div>
	<!-- 댓글 목록 출력 -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="다음글 보기">
	</div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/images/loading.gif" width="100" height="100">
	</div>
	<!-- 댓글 UI 끝 -->
	<div class="row justify-content-between mt-3">
		<div class="col">
			<c:if test="">
				이전 글
			</c:if>
			<img src="${pageContext.request.contextPath}/images/chevron-compact-left.svg" id="nextbutton">
		</div>
		<div class="col">
			
		</div>
		<div class="col d-flex justify-content-end">
			<c:if test="">
				다음 글
			</c:if>
			<img src="${pageContext.request.contextPath}/images/chevron-compact-right.svg" id="nextbutton">
		</div>
	</div>
	<div class="row mt-4">
		<div class="col">
			<input type="button" value="목록으로 돌아가기" onclick="location.href='techblogList.do'" class="w-100 btn btn-secondary btn-lg">
		</div>
	</div>
</div>
<!-- 내용 끝 -->


