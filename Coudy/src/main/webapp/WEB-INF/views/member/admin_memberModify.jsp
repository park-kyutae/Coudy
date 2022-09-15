<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
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

<h2>회원권한 수정</h2>
<div class="row">
	<div class="col align-center">
		<div class="text-center">
			<form:form modelAttribute="memberVO" action="admin_update.do" id="modify_form" class="align-center">
				<form:hidden path="mem_num"/>
				<form:errors element="div" cssClass="error-color"/>
				<ul>
					<li>
						<label>회원권한</label>
						<c:if test="${memberVO.auth<3}">
						<form:radiobutton path="auth" value="1"/>정지
						<form:radiobutton path="auth" value="2"/>일반	
						</c:if>
						<c:if test="${memberVO.auth==3}">
						관리
						</c:if>
					</li>
				</ul>
				<div class="align-center">
					<c:if test="${memberVO.auth!=3}">
					<input type="hidden" value="${memberVO.mem_num}">
					<input type="submit" value="전송">
					</c:if>
					<input type="button" value="회원목록"
					   onclick="location.href='admin_list.do'">
				</div>
				<ul>
					<li>
						<label>이름</label>
						${memberVO.name}
					</li>
					<li>
						<label>전화번호</label>
						${memberVO.phone}
					</li>
					<li>
						<label>이메일</label>
						${memberVO.email}
					</li>
					<li>
						<label>우편번호</label>
						${memberVO.zipcode}
					</li>
					<li>
						<label>주소</label>
						${memberVO.address1}
					</li>
					<li>
						<label>상세주소</label>
						${memberVO.address2}
					</li>
				</ul>
			</form:form>
		</div>
	</div>
</div>
<!-- 내용 끝 -->



