<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/member.js"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_ks.css">
 --%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<style>
	body {
  min-height: 100vh;
  min-height: -webkit-fill-available;
}

html {
  height: -webkit-fill-available;
}

main {
  display: flex;
  flex-wrap: nowrap;
  height: 100vh;
  height: -webkit-fill-available;
  max-height: 100vh;
  overflow-x: auto;
  overflow-y: hidden;
}

.b-example-divider {
  flex-shrink: 0;
  width: 1.5rem;
  height: 100vh;
  background-color: rgba(0, 0, 0, .1);
  border: solid rgba(0, 0, 0, .15);
  border-width: 1px 0;
  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
}

.bi {
  vertical-align: -.125em;
  pointer-events: none;
  fill: currentColor;
}

.dropdown-toggle { outline: 0; }

.nav-flush .nav-link {
  border-radius: 0;
}

.btn-toggle {
  display: inline-flex;
  align-items: center;
  padding: .25rem .5rem;
  font-weight: 600;
  color: rgba(0, 0, 0, .65);
  background-color: transparent;
  border: 0;
}
.btn-toggle:hover,
.btn-toggle:focus {
  color: rgba(0, 0, 0, .85);
  background-color: #d2f4ea;
}

.btn-toggle::before {
  width: 1.25em;
  line-height: 0;
  content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
  transition: transform .35s ease;
  transform-origin: .5em 50%;
}

.btn-toggle[aria-expanded="true"] {
  color: rgba(0, 0, 0, .85);
}
.btn-toggle[aria-expanded="true"]::before {
  transform: rotate(90deg);
}

.btn-toggle-nav a {
  display: inline-flex;
  padding: .1875rem .5rem;
  margin-top: .125rem;
  margin-left: 1.25rem;
  text-decoration: none;
}
.btn-toggle-nav a:hover,
.btn-toggle-nav a:focus {
  background-color: #d2f4ea;
}

.scrollarea {
  overflow-y: auto;
}

.fw-semibold { font-weight: 600; }
.lh-tight { line-height: 1.25; }
	
#profile{ 
	width:300px;
	height:300px;

}
ul li{
	list-style:none;
}
.v-line {
 	border: 5px solid black;
    width: 0.1px;
    height: 500px;

}

hr:not([size]) {
    height: 90%;
}

.btn-toggle-nav a:hover, .btn-toggle-nav a:focus{
	background-color : #e0cffc
}

.btn-toggle:hover, .btn-toggle:focus{
	background-color : #e0cffc
}

.btn-primary{
	background-color:#8541f5;
	border-color:#8541f5;
}
.btn-primary:hover{
	background-color:#3d0991;
	border-color:#3d0991;
}

</style>
<br>
<div class="row" style="margin-left:10%; margin-right:10%">
<div class="flex-shrink-0 p-3 bg-white"  style="width: 280px;">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
      <img src="${pageContext.request.contextPath}/images/COUDY_logo-04.png" width="62%" height="62%">
      
<!--       <span class="fs-5 fw-semibold"><h3>Coudy</h3></span>
 -->    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
          메뉴1
        </button>
        <div class="collapse show" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">메뉴1</a></li>
            <li><a href="#" class="link-dark rounded">메뉴2</a></li>
            <li><a href="#" class="link-dark rounded">메뉴3</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
          메뉴2
        </button>
        <div class="collapse" id="dashboard-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">메뉴1</a></li>
            <li><a href="#" class="link-dark rounded">메뉴2</a></li>
            <li><a href="#" class="link-dark rounded">메뉴3</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
          메뉴3 
        </button>
        <div class="collapse" id="orders-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">메뉴1</a></li>
            <li><a href="#" class="link-dark rounded">메뉴2</a></li>
            <li><a href="#" class="link-dark rounded">메뉴3</a></li>
            <li><a href="#" class="link-dark rounded">메뉴4</a></li>
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
    </ul>
  </div>
	<div class="col-5 ">
		<div class="mt-3" >
		<h3 class="mb-4">Profile</h3>
		<figure class="figure border-top">
			<div class="mb-3"></div>
			<c:if test="${empty member.photo_name}">
				<img src="${pageContext.request.contextPath }/images/face.png" width="300" height="300" class="figure-img img-fluid rounded my-photo" style="box-shadow:0 0 5px gray;">
			  	<figcaption class="figure-caption mb-2 text-center">현재 프로필 사진이 없습니다.</figcaption>
			</c:if>
			<c:if test="${!empty member.photo_name}">
			  	<img src="${pageContext.request.contextPath }/member/photoView.do" id="profile" width="300" height="300" class="figure-img img-fluid rounded my-photo" >
			  	<figcaption class="figure-caption mb-2 text-center">현재 프로필 사진입니다.</figcaption>
			</c:if>
			
			<button type="button" class="col-12 btn btn-primary btn-sm" id="photo_btn">사진수정</button>
			
			<div class="align-center" style="display:none;" id="photo_choice">
				<input type="file" class="btn btn-secondary btn-sm" id="upload" accept="image/gif,image/png,image/jpeg">
				<br>
				<div class="mt-2">				
					<input type="button" class="col-6 btn btn-primary" style="float:left;border-radius:5px 0 0 5px;" id="photo_submit" value="사진저장">
					<input type="button" class="col-6 btn btn-outline-secondary" style="border-radius:0 5px 5px 0;" id="photo_cancel" value="취소">
				</div>
				
			</div>
		</figure>
		
		</div>
	</div>
	
	<div class="col-4 ">	
		<div class="align-left mr-4 mt-3">
		<h3 class="mb-4">My Page</h3>
		<div class="border-bottom"></div>
			<ul style="color:gray; font-size:20px;" class="mt-3">
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
			<div class="">
				<button type="button" class="btn btn-primary btn-sm" onclick="location.href='updateUser.do'" >정보수정</button>
				<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='changePassword.do'" >비밀번호변경</button>
				<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='delete.do'" >회원탈퇴</button>
			</div>
		</div>
	</div>
	
</div>






