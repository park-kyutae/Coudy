<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/teamblog.fav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/teamblog.re.js"></script>

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

<br><br><br>
<div class="container">
	
	<!-- =======================고정 상단바========= -->
	<!-- <div class="p-4 p-md-5 mb-4 rounded text-white"
	 style="background-image: url('https://t1.daumcdn.net/cfile/tistory/213A744B58EC2A4409');
	 background-size:cover;
	 background-position:center center;">
		<div class="col-md-6 px-0">
			<h1 class="text-primary display-4 fst-italic ">Team1 PROJECT</h1>
		</div>
	</div> -->
	<!-- ==========================================  -->
	
	<div class="row g-5  bg-success rounded"  style="background-image: url('https://t1.daumcdn.net/cfile/tistory/213A744B58EC2A4409');
	 background-size:cover;
	 background-position:center center;">
	<div class="col">
	
	<h3 class="pb-4 mb-4 fst-italic " >TEAM BLOG</h3>
	</div>
	</div>
	
	<h1 class="fw-bold">${teamblog.team_title }</h1>

	<!-- ===============개인 아이디 표시================= -->
	<div class="row">
		<div class="col-1">
			<c:if test="${!empty teamblog.photo_name }">
			<img src="imageView.do?notice_num=${teamblog.team_num }&teamblog_type=1" width="40" height="40">
			</c:if>
			<c:if test="${empty teamblog.photo_name }">
			<img src="${pageContext.request.contextPath }/images/face.png" width="40" height="40">
			</c:if>
		</div>
		<div class="col-11 align-left">
		    <%--좋아요 처리시 사용하기 위해 span 태그에 notice_num 접속 표시 --%>
			<span id="teamblog_info" data-num="${teamblog.team_num}" class="fw-bold">${teamblog.id }</span>
			<br>
			<div class="fw-light">
			<c:if test="${!empty teamblog.team_modify_date }">
			${teamblog.team_modify_date}
			</c:if>
			<c:if test="${empty teamblog.team_modify_date }">
			${teamblog.team_reg_date}
			</c:if>
			조회  ${teamblog.team_hit }
			</div>
		</div>
	</div>
	<!-- ============================================ -->
		
		<c:if test="${!empty teamblog.team_filename }">
			첨부파일 : <a href="file.do?team_num=${teamblog.team_num }">${teamblog.team_filename }</a>
		</c:if>
		
	<hr size="1" width="100%">
	<c:if test="${fn:endsWith(teamblog.team_filename,'.jpg') ||
				fn:endsWith(teamblog.team_filename,'.JPG') ||
				fn:endsWith(teamblog.team_filename,'.jpeg') ||
				fn:endsWith(teamblog.team_filename,'.JPEG') ||
				fn:endsWith(teamblog.team_filename,'.gif') ||
				fn:endsWith(teamblog.team_filename,'.GIF') ||
				fn:endsWith(teamblog.team_filename,'.png') ||
				fn:endsWith(teamblog.team_filename,'.PNG')
				}">
	<div>
		<img src="imageView.do?team_num=${teamblog.team_num }&teamblog_type=2" style="max-width:500px;">
	</div>
	</c:if>
	<p>
		${teamblog.team_content }
	</p>
	<div>
		<img id="output_fav" src="${pageContext.request.contextPath }/images/balloon-heart.svg" width="40" >
	 	<span id="output_fcount"></span>
	</div>
	<hr size="1" width="100%">
	<div style="text-align:center;">
		<c:if test="${!empty user && user.mem_num == team.mem_num }">
		<input class=" btn btn-outline-primary btn-sm" type="button" value="수정" onclick="location.href='update.do?team_num=${teamblog.team_num }'">
		<input class=" btn btn-outline-primary btn-sm" type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			//이벤트 연결
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('delete.do?team_num=${teamblog.team_num}');
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
			<input type="hidden" name="team_num"
			   value="${teamblog.team_num}" id="team_num">
			<textarea  rows="3" cols="170" 
			  name="team_re_content" id="team_re_content"
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

























<!-- ====================================================== -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/teamblog.fav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/teamblog.re.js"></script>

<div>
	<h2>${teamblog.team_title }</h2>
	<ul>
		<li>
			<c:if test="${!empty teamblog.photo_name }">
			<img src="imageView.do?team_num=${teamblog.team_num }&teamblog_type=1" width="40" height="40">
			</c:if>
			<c:if test="${empty teamblog.photo_name }">
			<img src="${pageContext.request.contextPath }/images/face.png" width="40" height="40">
			</c:if>
		</li>
		<li>
		    좋아요 처리시 사용하기 위해 span 태그에 notice_num 접속 표시
			아이디 : <span id="teamblog_info" data-num="${teamblog.team_num}">${teamblog.id }</span>
			<br>
			<c:if test="${!empty teamblog.team_modify_date }">
			최근 수정일 : ${teamblog.team_modify_date}
			</c:if>
			<c:if test="${empty teamblog.team_modify_date }">
			작성일 : ${teamblog.team_reg_date}
			</c:if>
			조회 : ${teamblog.team_hit }
		</li>
	</ul>
	<ul>
		<c:if test="${!empty teamblog.team_filename }">
		<li>
			첨부파일 : <a href="file.do?team_num=${teamblog.team_num }">${teamblog.team_filename }</a>
		</li>
		</c:if>
	</ul>
	<hr size="1" width="100%">
	<c:if test="${fn:endsWith(teamblog.team_filename,'.jpg') ||
				fn:endsWith(teamblog.team_filename,'.JPG') ||
				fn:endsWith(teamblog.team_filename,'.jpeg') ||
				fn:endsWith(teamblog.team_filename,'.JPEG') ||
				fn:endsWith(teamblog.team_filename,'.gif') ||
				fn:endsWith(teamblog.team_filename,'.GIF') ||
				fn:endsWith(teamblog.team_filename,'.png') ||
				fn:endsWith(teamblog.team_filename,'.PNG')
				}">
	<div>
		<img src="imageView.do?team_num=${teamblog.team_num }&teamblog_type=2" style="max-width:500px;">
	</div>
	</c:if>
	<p>
		${teamblog.team_content }
	</p>
	<div>
		<img id="output_fav" src="${pageContext.request.contextPath }/images/fav01.gif" width="40" >
	 	<span id="output_fcount"></span>
	</div>
	<hr size="1" width="100%">
	<div class="align-center">
		<c:if test="${!empty user && user.mem_num == teamblog.mem_num }">
		<input type="button" value="수정" onclick="location.href='update.do?team_num=${teamblog.team_num }'">
		<input type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			//이벤트 연결
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('delete.do?team_num=${teamblog.team_num}');
				}
			};
		</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='list.do'">
	</div>
	<hr size="1" width="100%">
	
	<!-- 댓글 UI 시작 -->
	<div id="reply_div">
		<span class="re-title">댓글 달기</span>
		<form id="re_form">
			<input type="hidden" name="team_num"
			   value="${teamblog.team_num}" id="team_num">
			<textarea rows="3" cols="50" 
			  name="team_re_content" id="team_re_content"
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
	
</div> --%>

















