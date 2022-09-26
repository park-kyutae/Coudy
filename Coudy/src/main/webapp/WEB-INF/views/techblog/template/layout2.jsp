<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
</head>
<body>
		<tiles:insertAttribute name="header"/>
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



