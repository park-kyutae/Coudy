<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/member.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_ks.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>



<div class="align-left">
<h2>Profile</h2>

<figure class="figure">
	<c:if test="${empty member.photo_name}">
		<img src="${pageContext.request.contextPath }/images/face.png" width="300" height="300" class="figure-img img-fluid rounded my-photo">
	  	<figcaption class="figure-caption">현재 프로필 사진이 없습니다.</figcaption>
	</c:if>
	<c:if test="${!empty member.photo_name}">
	  	<img src="${pageContext.request.contextPath }/images/photoView.do" width="300" height="300" class="figure-img img-fluid rounded my-photo" >
	  	<figcaption class="figure-caption">현재 프로필 사진입니다.</figcaption>
	</c:if>
	
	<button type="button" class="btn btn-secondary btn-sm" id="photo_btn">사진수정</button>
	
	<div class="align-center" style="display:none;" id="photo_choice">
		<input type="file" class="btn btn-secondary btn-sm" id="upload" accept="image/gif,image/png,image/jpeg">
		<input type="button" class="btn btn-secondary" id="photo_cancel" value="취소">
		<input type="button" class="btn btn-primary" id="photo_submit" value="저장">
		
	</div>
</figure>



</div>

<div class="align-left">
<h2>My Page</h2>
	<ul style="color:gray; font-size:20px;">
		<li><b>이름</b> : ${member.name }</li>
		<li><b>전화번호</b> : ${member.phone}</li>
		<li><b>이메일</b> : ${member.email}</li>
		<li><b>우편번호</b> : ${member.zipcode}</li>
		<li><b>주소</b> : ${member.address1}</li>
		<li><b>상세주소</b> : ${member.address2}</li>
		<li><b>가입날짜</b> : ${member.reg_date}</li>
		
		<c:if test="${!empty member.modify_date }">
			<li>정보수정일 : ${member.modify_date }</li>
		</c:if>
	</ul>
	<div class="align-center">
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='update.do'" >정보수정</button>
		<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='update.do'" >비밀번호변경</button>
		<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='update.do'" >회원탈퇴</button>
	</div>
</div>




