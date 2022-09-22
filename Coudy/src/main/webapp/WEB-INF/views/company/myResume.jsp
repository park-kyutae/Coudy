<%--
  Created by IntelliJ IDEA.
  User: taemin
  Date: 2022/09/19
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
    td a {
        text-decoration: none;
        color: #595959;
    }
</style>
<div class="container">
    <h2>나의 지원현황</h2>
    <div class="row">
        <div class="col align-center">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">회사명</th>
                    <th scope="col">채용공고</th>
                    <th scope="col">이력서 파일</th>
                    <th scope="col">보낸 날짜</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="resume" items="${list}">
                    <tr>
                        <th scope="row">${resume.resume_num}</th>
                        <td>${resume.com_name}</td>
                        <td><a href="comDetail.do?com_num=${resume.com_num}">${resume.com_title}</a></td>
                        <td><a href="file.do?resume_num=${resume.resume_num}">${resume.filename}</a></td>
                        <td>${resume.reg_date}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%--<script>--%>
<%--    $(function(){--%>
<%--        let com_num = ${resume.com_num};--%>
<%--        $.ajax({--%>
<%--            url:'resumeName.do',--%>
<%--            data: {'com_num':com_num},--%>
<%--            dataType:'json',--%>
<%--            cache:false,--%>
<%--            timeout:30000,--%>
<%--            success:function (param) {--%>
<%--                if(param.result=='success'){--%>
<%--                    document.getElementById('comName').value(com_num);--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    }) ;--%>
<%--</script>--%>