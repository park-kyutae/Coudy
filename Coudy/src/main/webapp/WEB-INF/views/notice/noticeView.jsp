<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/notice.fav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/notice.re.js"></script>

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
   crossorigin="anonymous">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_ik.css">


<div class="container">
	
	<!-- =======================고정 상단바========= -->
	<div class="p-4 p-md-5 mb-4 rounded text-white"
	 style="background-image: url('https://t1.daumcdn.net/cfile/tistory/213A744B58EC2A4409');
	 background-size:cover;
	 background-position:center center;">
		<div class="col-md-6 px-0">
			<h1 class="text-primary display-4 fst-italic ">Team1 PROJECT</h1>
		</div>
	</div>
	<!-- ==========================================  -->
	
	<div class="row g-5">
	<h3 class="pb-4 mb-4 fst-italic">NOTICE</h3>
	</div>
	<hr  style="border-top:5px solid #CB28BE" size="1" width="100%">
	
	
	<h1 class="fw-bold">${notice.notice_title }</h1>

	<!-- ===============개인 아이디 표시================= -->
	<div class="row">
		<div class="col-1">
			<c:if test="${!empty notice.photo_name }">
			<img src="imageView.do?notice_num=${notice.notice_num }&notice_type=1" width="40" height="40">
			</c:if>
			<c:if test="${empty notice.photo_name }">
			<img src="${pageContext.request.contextPath }/images/face.png" width="40" height="40">
			</c:if>
		</div>
		<div class="col-11 align-left">
		    <%--좋아요 처리시 사용하기 위해 span 태그에 notice_num 접속 표시 --%>
			<span id="notice_info" data-num="${notice.notice_num}" class="fw-bold">${notice.id }</span>
			<br>
			<div class="fw-light">
			<c:if test="${!empty notice.notice_modify_date }">
			${notice.notice_modify_date}
			</c:if>
			<c:if test="${empty notice.notice_modify_date }">
			${notice.notice_reg_date}
			</c:if>
			조회  ${notice.notice_hit }
			</div>
		</div>
	</div>
	<!-- ============================================ -->
		
		<c:if test="${!empty notice.notice_filename }">
			첨부파일 : <a href="file.do?notice_num=${notice.notice_num }">${notice.notice_filename }</a>
		</c:if>
		
	<hr size="1" width="100%">
	<c:if test="${fn:endsWith(notice.notice_filename,'.jpg') ||
				fn:endsWith(notice.notice_filename,'.JPG') ||
				fn:endsWith(notice.notice_filename,'.jpeg') ||
				fn:endsWith(notice.notice_filename,'.JPEG') ||
				fn:endsWith(notice.notice_filename,'.gif') ||
				fn:endsWith(notice.notice_filename,'.GIF') ||
				fn:endsWith(notice.notice_filename,'.png') ||
				fn:endsWith(notice.notice_filename,'.PNG')
				}">
	<div>
		<img src="imageView.do?notice_num=${notice.notice_num }&notice_type=2" style="max-width:500px;">
	</div>
	</c:if>
	<p>
		${notice.notice_content }
	</p>
	<div>
		<img id="output_fav" src="${pageContext.request.contextPath }/images/balloon-heart.svg" width="40" >
	 	<span id="output_fcount"></span>
	</div>
	<hr size="1" width="100%">
	<div style="text-align:center;">
		<c:if test="${!empty user && user.mem_num == notice.mem_num }">
		<input class=" btn btn-outline-primary btn-sm" type="button" value="수정" onclick="location.href='update.do?notice_num=${notice.notice_num }'">
		<input class=" btn btn-outline-primary btn-sm" type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			//이벤트 연결
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('delete.do?notice_num=${notice.notice_num}');
				}
			};
		</script>
		</c:if>
		<input class=" btn btn-outline-primary btn-sm" type="button" value="목록" onclick="location.href='list.do'">
	</div>
	<hr size="1" width="100%">
	
	<!-- 댓글 UI 시작 -->
	<div class="row">
		<span >댓글 달기</span>
		<form id="re_form" >
			<input type="hidden" name="notice_num"
			   value="${notice.notice_num}" id="notice_num">
			<textarea  rows="3" cols="170" 
			  name="notice_re_content" id="notice_re_content"
			  class="rep-content"
			  <c:if test="${empty user}">disabled="disabled"</c:if>
			  ><c:if test="${empty user}">로그인해야 작성할 수 있습니다.</c:if></textarea>
			<c:if test="${!empty user}">
			
			<div class="row">
			<div class="col-3" id="re_first">
				<span class="letter-count">300/300</span>
			</div>
			<div class="col-8"></div>
			<div class="col-1" style="float:right;">
				<input class=" btn btn-outline-primary btn-sm" type="submit" value="전송">
			</div>
			</div>
			<hr size="1" width="100%">
			
			</c:if>
		</form>
	</div>
	<br>
	<br>
	<!-- 댓글 목록 출력 -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="다음글 보기">
	</div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/images/loading.gif" width="100" height="100">
	</div>
	<!-- 댓글 UI 끝 -->
	
</div>

















