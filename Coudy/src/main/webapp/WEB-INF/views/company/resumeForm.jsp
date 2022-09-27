<%--
  Created by IntelliJ IDEA.
  User: taemin
  Date: 2022/09/15
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<div class="container" style="height: 300px">
    <div class="row mt-4">
        <br>
        <div class="col">
            <h3>
            ${companyVO.com_name}에 입사지원 하기<br><br>
            </h3>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <%--@elvariable id="companyResumeVO" type="kr.spring.company.vo.CompanyResumeVO"--%>
            <form modelAttribute="companyResumeVO" method="post" enctype="multipart/form-data" action="resume.do" id="resumeForm">
                <div class="row">
                    <div class="col">
                        <label for="upload">이력서 첨부파일</label>
                        <input type="file" name="upload" id="upload">
                    </div>
                </div>
                <div class="row mt-5 float-end">
                    <div class="col g-2">
                        <input type="submit" class="btn btn-outline-primary" value="전송">
                        <input type="button" class="btn btn-outline-secondary" value="취소" onclick="javascript:window.close()">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
