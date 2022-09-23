<%--
  Created by IntelliJ IDEA.
  User: taemin
  Date: 2022/09/20
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
  a {

    text-decoration: none;
    color: #595959;
  }
  b{
    font-size: 20pt;
  }
  .circle{
    visibility: hidden;
  }
  #oneScrap:hover {
    background-color: #cfe2ff;
    border-radius: 5px;
  }
  #oneScrap:hover .circle{
    visibility: visible;
    color: #8541f5;
  }
  /*.noCircle{*/
  /*  visibility: hidden;*/
  /*}*/
  /*.yesCircle{*/
  /*  visibility: visible;*/
  /*  color: greenyellow;*/
  /*}*/
</style>
<%--<script>--%>
<%--    // $('.oneScrap').hover(function (){--%>
<%--    //   console.log('hover');--%>
<%--    //   $('.circle').removeClass('noCircle');--%>
<%--    //   $('.circle').addClass('yesCircle');--%>
<%--    // });--%>
<%--    const circle = {--%>
<%--      init: function () {--%>
<%--        var box = document.querySelector('.oneScrap');--%>
<%--        box.addEventListener('mouseover',function(){--%>
<%--          $(this).data('circle').removeClass('noCircle');--%>
<%--          $(this).data('circle').addClass('yesCircle');--%>
<%--        });--%>
<%--      }--%>
<%--    }--%>
<%--    circle.init();--%>
<%--</script>--%>
<div class="container">
  <h2>스크랩 공고</h2>
  <hr>
  <c:forEach var="company" items="${list}">
  <div id="oneScrap" class="row p-4 mb-2 oneScrap">
<%--    <div class="col-sm-1 float-end mt-lg-5">--%>
<%--      <span class="circle ">●</span>--%>
<%--    </div>--%>
    <div class="col-sm-3">
      <a href="comDetail.do?com_num=${company.com_num}"><img class="img mb-3 mx-auto" style="border-radius: 5px"
                                                             src="imageView.do?com_num=${company.com_num}&com_type=2"
                                                             width="200" height="105"
                                                             alt="Card image cap"></a>
    </div>
    <div class="col-sm-6">
      <a href="comDetail.do?com_num=${company.com_num}">${company.com_name}</a><br>
      <b><a href="comDetail.do?com_num=${company.com_num}">${company.com_title}</a></b>
      <p>${company.com_tag}</p>
    </div>
    <div class="col-sm-3 align-center">
      <h4>모집기간</h4>
      <span>~${company.com_schedule}</span>
    </div>

  </div>
  <hr>
  </c:forEach>
</div>