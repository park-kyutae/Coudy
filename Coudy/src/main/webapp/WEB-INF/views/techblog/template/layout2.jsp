<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-bootstrap.css">
	<style>
a:hover{
	 text-decoration:none;
	 color:gray;
}
a{
	color:black;
}
</style>
</head>
<body>

	<div class="row">
		<tiles:insertAttribute name="header"/>
	</div>
	<div class="container">
		<div class="row">
				<tiles:insertAttribute name="bodytitle"/>
		</div>
		<div class="row">
					<tiles:insertAttribute name="bodywu"/>	
		</div>
		</div>
		<tiles:insertAttribute name="footer"/>
	

</body>
</html>



