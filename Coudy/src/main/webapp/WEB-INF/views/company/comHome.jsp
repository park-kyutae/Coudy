<%--
  Created by IntelliJ IDEA.
  User: taemin
  Date: 2022/08/30
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
    .content{
        margin-top: 10px;
        text-overflow: ellipsis;
        overflow : hidden;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
    }
</style>
<div class="">
    <div class="align-center">
        <h2>채용 공고</h2>
    </div>
    <c:if test="${!empty user}">
    <div>
        <input type="button" class="btn btn-secondary" value="공고쓰기" onclick="location.href='${pageContext.request.contextPath}/company/insertCom.do'"/>
    </div>
    </c:if>
    <c:if test="${count == 0}">
        <div class="result-display">표시할 게시물이 없습니다.</div>
    </c:if>
    <c:if test="${count > 0}">

            <div class="container">
                <div class="row">
                    <c:forEach var="company" items="${list}">
                        <div class="col-6 col-lg-3 p-4">
                            <img class="img-fluid d-block mb-3 mx-auto" src="https://static.pingendo.com/cover-moon.svg" width="200" alt="Card image cap">
                            <h4> <b>${company.com_name}</b> </h4>
                            <p class="mb-3">${company.com_title}</p>
                            <p class="mb-0 content">${company.com_comContent}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>

    </c:if>
</div>
