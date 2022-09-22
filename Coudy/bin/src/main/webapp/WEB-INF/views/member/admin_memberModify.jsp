<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_ks.css"> --%>

<style>
ul{
	list-style:none;
}


#btn1{
	background-color:#8541f5;
	border-color:#8541f5;
	float:left;
	border-radius:5px 0 0 5px;
}
#btn1:hover{
	background-color:#3d0991;
	border-color:#3d0991;
	border-radius:5px 0 0 5px;
}
	border-radius:0 5px 5px 0;

</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>


    
    
<h3 class="mt-3 text-center"> 회원권한 수정</h3>
<div class="row">
	<div class="col align-center">
		<div>
			<form:form modelAttribute="memberVO" action="admin_update.do" id="modify_form" style="margin:0 10%;">
				<form:hidden path="mem_num"/>
				<form:errors element="div" cssClass="error-color"/>
				<ul style="margin:0 10%;padding:0;" class="mt-3 mb-3">
					<li class="text-center">
						<c:if test="${memberVO.auth<4}">
						<form:radiobutton path="auth" value="1"/>정지
						<form:radiobutton path="auth" value="2"/>일반	
						<form:radiobutton path="auth" value="3"/>인사
						</c:if>
						<c:if test="${memberVO.auth==4}">
						<h5 class="text-center mt-3 mb-3">[관리자]</h5>
						</c:if>
					</li>
				</ul>
				
				<ul>
					<li>
						<label><b>이름 : </b></label>
						${memberVO.name}
					</li>
					<li>
						<label><b>전화번호 : </b></label>
						${memberVO.phone}
					</li>
					<li>
						<label><b>이메일 : </b></label>
						${memberVO.email}
					</li>
					<li>
						<label><b>우편번호 : </b></label>
						${memberVO.zipcode}
					</li>
					<li>
						<label><b>주소 : </b></label>
						${memberVO.address1}
					</li>
					<li>
						<label><b>상세주소 : </b></label>
						${memberVO.address2}
					</li>
				</ul>
				<div style="margin:0 5%;">
					<c:if test="${memberVO.auth!=4}">
					<input type="hidden" value="${memberVO.mem_num}">
					<input type="submit" id="btn1" class="btn btn-primary col-6" value="확인">
					<input type="button" class="btn btn-outline-secondary col-6" style="border-radius:0 5px 5px 0;"value="취소" onclick="WinClose();">
					<script>
						function WinClose(){
							 window.open('','_self').close(); 
						}
					</script>
					</c:if>
				</div>
			</form:form>
			<div class="text-center">
				<img  class="mb-4 mt-2" src="${pageContext.request.contextPath}/images/COUDY_logo-05.png" width="40%" height="40%">	
			</div>
			
		</div>
	</div>
</div>
<!-- 내용 끝 -->



