<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>


<div>
	<h2>${notice.notice_title }</h2>
	<ul>
		<li>
			<c:if test="${!empty notice.photo_name }">
			<img src="imageView.do?notice_num=${notice.notice_num }&notice_type=1" width="40" height="40">
			</c:if>
			<c:if test="${empty notice.photo_name }">
			<img src="${pageContext.request.contextPath }/images/face.png" width="40" height="40">
			</c:if>
		</li>
		<li>
			아이디 : ${notice.id }
			<br>
			<c:if test="${!empty notice.notice_modify_date }">
			최근 수정일 : ${notice.notice_modify_date}
			</c:if>
			<c:if test="${empty notice.notice_modify_date }">
			작성일 : ${notice.notice_reg_date}
			</c:if>
			조회 : ${notice.notice_hit }
		</li>
	</ul>
	<ul>
		<c:if test="${!empty notice.notice_filename }">
		<li>
			첨부파일 : <a href="file.do?notice_num=${notice.notice_num }">${notice.notice_filename }</a>
		</li>
		</c:if>
	</ul>
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
		<img id="output_fav" src="${pageContext.request.contextPath }/images/fav01.gif" width="40" >
	 	<span id="output_fcount"></span>
	</div>
	<hr size="1" width="100%">
	<div class="align-center">
		<c:if test="${!empty user && user.mem_num == notice.mem_num }">
		<input type="button" value="수정" onclick="location.href='update.do?notice_num=${notice.notice_num }'">
		<input type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			//이벤트 연결
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('delete.do?notice_num=${notiec.notice_num}');
				}
			};
		</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='list.do'">
	</div>
	<hr size="1" width="100%">
	
</div>

















