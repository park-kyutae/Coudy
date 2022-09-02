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
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/company.js"></script>
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
                        <div class="col-6 col-lg-3 p-4 border">
                            <img class="img d-block mb-3 mx-auto" src="imageView.do?com_num=${company.com_num}&com_type=2" width="200" height="105" alt="Card image cap">
                            <h4> <b>${company.com_name}</b> </h4>
                            <p class="mb-3">${company.com_title}
                                <svg  style="cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="scrap_star float-end bi bi-star" viewBox="0 0 16 16">
                                    <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                            </p>
<%--                            <p class="mb-0 content">${company.com_comContent}</p>--%>
                        </div>
                    </c:forEach>
                </div>
            </div>

    </c:if>
</div>
