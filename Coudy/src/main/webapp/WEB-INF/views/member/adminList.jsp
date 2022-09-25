<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style_ks.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
</script>



<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
a{
	text-decoration:none;
	
}
a:visited{
	color:gray;
}
a:link{
	color:gray;
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

<div class="page-main container">
	<h2>회원목록</h2>
	<h4>관리자페이지</h4>
	<div class="row">
		<div class="col align-center text-center">
			<img  class="mb-4 mt-2" src="${pageContext.request.contextPath}/images/COUDY_logo-04.png" width="20%" height="35%">
			
			<form action="admin_list.do" id="search_form"
			                                    method="get">
				<ul class="search nav justify-content-center mb-5 mt-2">
					<li>
						<select name="keyfield" class="form-select" style="border-radius:10px 0 0 10px;">
							<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>ID</option>
							<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>이름</option>
							<option value="4" <c:if test="${param.keyfield == 4}">selected</c:if>>전체</option>
						</select>
					</li>
					<li>
						<input class="form-control" type="search" name="keyword" id="keyword" value="${param.keyword}" style="border-radius:0 0 0 0;">
					</li>
					<li>
						<input type="submit" class="btn btn-primary" value="찾기" style="border-radius:0 10px 10px 0;">
						<input type="button" class="btn btn-outline-secondary" value="목록"
						    onclick="location.href='admin_list.do'" style="border-radius: 10px;">
					</li>
				</ul>
			</form>
		</div>
	</div>
	
	<c:if test="${empty list}">
			회원이 없습니다.
	</c:if>
	<c:if test="${!empty list}">
	<div class="row">
		<div class="col-sm">
		<table class="table table-hover" style="width:80%;margin:0 auto;">
			<tr style="border-bottom:20px;">
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>권한</th>
			</tr>
			<c:forEach var="member" items="${list}">
			<!-- 팝업스크립트 시작 -->
			 <script>
			      function popup(param){			    	  
			    	  
			    	  console.log(param+' : 안쪽');
			    	  //console.log(${member.mem_num}+' : 안쪽');
			          //var url = '/member/admin_update.do?mem_num=${member.mem_num}';
			          var name = "popup test";
			          var option = "width = 350, height = 400, location = no, resizeable = no, scrollbars = no, top=300, left=650";
			          window.open('admin_update.do?mem_num='+param, name, option);
			      }
			 </script>
			<!-- 팝업스크립트 끝 -->
				<tr>
					<td>${member.mem_num }</td>
					<td><button class="btn btn-outline-secondary" onclick="javascript:popup(${member.mem_num})" id="popupBtn">${member.name }</button></td>
					<td>${member.id }</td>
					<td>${member.passwd }</td>
					<td>
						<c:if test="${member.auth == 0}">탈퇴</c:if> 
						<c:if test="${member.auth == 1}"><div style="color:#918100;">정지</div></c:if> 
						<c:if test="${member.auth == 2}"><div style="color:#0032ae;">일반</div></c:if> 
						<c:if test="${member.auth == 3}"><div style="color:orange;">인사</div></c:if>
						<c:if test="${member.auth == 4}"><div style="color:green;">관리</div></c:if>
					</td>
				</tr>
			
			</c:forEach>
			
		</table>
		<br><br><div class="align-center text-center">${page }</div>
		</div>
	</div>
	</c:if>
</div>

