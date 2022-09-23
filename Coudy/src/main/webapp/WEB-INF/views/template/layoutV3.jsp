<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
    <link href="${pageContext.request.contextPath}/css/custom-bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <title><tiles:getAsString name="title"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
</head>
<body>
<div class="fixed-top">
    <tiles:insertAttribute name="header"/>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="row pt-5">
                <div class="col">
                    <tiles:insertAttribute name="body"/>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <tiles:insertAttribute name="footer"/>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>



