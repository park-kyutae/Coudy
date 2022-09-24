<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
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



