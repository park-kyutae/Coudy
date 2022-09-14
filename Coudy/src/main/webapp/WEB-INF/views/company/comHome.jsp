<%--
  Created by IntelliJ IDEA.
  User: taemin
  Date: 2022/08/30
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<style>
    .checked {
        color: orange;
    }
    .blank{
        color: lightgray;
    }
    .content {
        margin-top: 10px;
        text-overflow: ellipsis;
        overflow: hidden;
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
        <input type="button" class="btn btn-secondary" value="공고쓰기"
               onclick="location.href='${pageContext.request.contextPath}/company/insertCom.do'"/>
    </div>
    </c:if>
    <c:if test="${count == 0}">
    <div class="result-display">표시할 게시물이 없습니다.</div>
    </c:if>
    <c:if test="${count > 0}">
    <div class="py-5 text-center text-white"
         style="background-image: url('https://img.freepik.com/premium-photo/office-space-for-working-with-computers-office-equipment-3d-rendering_537132-492.jpg?w=2000');background-size:cover;background-position:center bottom;">
        <div class="container">
            <div class="row">
                <div class="mx-auto p-4 col-md-7">
                    <h1 class="mb-4">I feel the charm of existence in this spot.</h1> <a class="btn btn-primary"
                                                                                         href="#">Take me there</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-4">
        <div class="row">
            <c:forEach var="company" items="${list}">
                <div class="col-6 col-lg-3 p-4 border">
                    <a href="comDetail.do?com_num=${company.com_num}"><img class="img d-block mb-3 mx-auto"
                                                                           src="imageView.do?com_num=${company.com_num}&com_type=2"
                                                                           width="200" height="105"
                                                                           alt="Card image cap"></a>
                    <a style="color: black; text-decoration: none" href="comDetail.do?com_num=${company.com_num}">
                        <h4><b>${company.com_name}</b></h4></a>
                    <p class="mb-0">${company.com_title}
<%--                        <svg data-com-num="${company.com_num}" style="cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="16" height="16"--%>
<%--                             fill="currentColor" class="scrap_star float-end bi bi-star" viewBox="0 0 16 16">--%>
<%--                            <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>--%>
<%--                        </svg>--%>
                        <span data-com-num="${company.com_num}" style="font-size: 23px; cursor: pointer;" class="scrap_star fa fa-star blank float-end"></span>
                        <script>
                            $(function () {
                                let com_num = ${company.com_num};
                                function selectData(com_num) {
                                    $.ajax({
                                        url: 'getScrap.do',
                                        type: 'post',
                                        data: {com_num:com_num},
                                        dataType: 'json',
                                        cache: false,
                                        timeout: 30000,
                                        success:function (param) {
                                            displayScrap(param);
                                        },
                                        error:function () {
                                            alert('네트워크오류류류ㅠ')
                                        }
                                    })
                                }
                                selectData(com_num);
                                console.log(${company.com_num});
                            });
                        </script>
                    </p>
                    <span class="mb-0">${company.com_tag}</span>

                        <%--                            <p class="mb-0 content">${company.com_comContent}</p>--%>
                </div>
            </c:forEach>
        </div>
    </div>

    </c:if>
    <div doz_type="row" doz_grid="6" doz_order="2" doz_flexible="N" class="doz_row">
        <div doz_type="row" doz_grid="5" doz_order="2" doz_flexible="N" class="doz_row">
            <div doz_type="grid" doz_grid="5" doz_flexible="N" class="col-dz col-dz-5">
                <div doz_type="widget" id="w20220525f59f544e93b1e">
                    <div class="_widget_data " data-widget-name="텍스트" data-widget-type="text"
                         data-widget-anim="none" data-widget-anim-duration="0.7"
                         data-widget-anim-delay="0" data-widget-parent-is-mobile="N">
                        <div doz_type="text" class="widget _text_wrap widget_text_wrap fr-view "
                             id="text_w20220525f59f544e93b1e">

                            <div class="text-table ">
                                <div><p><span style="color: rgb(0, 0, 0);"><strong><span
                                        style="font-size: 24px;">편리한 비즈니스 운영을 위한 완벽한 기능</span></strong></span>
                                </p>
                                    <p style="line-height: 1;"><br></p>
                                    <p style="line-height: 2;"><span
                                            style="color: rgb(144, 144, 144); font-size: 18px;">아임웹 쇼핑 기능은 비즈니스의 시작부터 완벽한 운영을 도와줍니다. 편리한 상품관리와 간편결제는 기본, 네이버쇼핑, 카카오 쇼핑하우 등 쇼핑몰 운영에 필요한 모든 기능을 한 곳에서 이용해보세요.</span>
                                    </p></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/company1.js"></script>