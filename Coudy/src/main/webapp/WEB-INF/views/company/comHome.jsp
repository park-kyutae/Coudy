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
    #oneCompany:hover{
        box-shadow: 0px 0px 13px grey;
    }
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
    <c:if test="${count == 0}">
    <div class="result-display">표시할 게시물이 없습니다.</div>
    </c:if>
    <c:if test="${count > 0}">
    <div class="py-5 text-center text-white"
         style="background-image: url('https://img.freepik.com/premium-photo/office-space-for-working-with-computers-office-equipment-3d-rendering_537132-492.jpg?w=2000');background-size:cover;background-position:center bottom;">
        <div class="container">
            <div class="row">
                <div class=" mx-auto p-4 col-md-7">
                    <h1 style="color: whitesmoke;text-shadow:2px 2px 2px black;font-size: 35pt"  class="mb-4">Coudy 채용 센터에 오신걸 환영합니다.</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-4">
        <div class="row">
            <c:forEach var="company" items="${list}">
                <div id="oneCompany" class="col-6 col-lg-3 p-4">
                    <a href="comDetail.do?com_num=${company.com_num}"><img class="img d-block mb-3 mx-auto"
                                                                           src="imageView.do?com_num=${company.com_num}&com_type=2"
                                                                           width="200" height="95"
                                                                           alt="Card image cap"></a>
                    <a style="color: black; text-decoration: none" href="comDetail.do?com_num=${company.com_num}">
                        <h4><b>${company.com_name}</b></h4></a>
                    <p class="mb-0">${company.com_title}
                        <span id="${company.com_num}" data-com-num="${company.com_num}" style="font-size: 23px; cursor: pointer;" class="scrap_star fa fa-star blank float-end"></span>
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

                                function displayScrap(param){
                                    let id=${company.com_num};
                                    if(param.status == 'noScrap'){
                                        document.getElementById(id).classList.replace('checked','blank');
                                    }else{
                                        document.getElementById(id).classList.replace('blank', 'checked');
                                    }

                                }
                            });
                        </script>
                    </p>
                    <span class="mb-0">${company.com_tag}</span>

                        <%--                            <p class="mb-0 content">${company.com_comContent}</p>--%>
                </div>
            </c:forEach>
        </div>
        <c:if test="${!empty user}">
            <div class="row float-end">
                <input type="button" class="btn btn-secondary" value="공고쓰기"
                       onclick="location.href='${pageContext.request.contextPath}/company/insertCom.do'"/>
            </div>
        </c:if>
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
                                <div class="align-center">
                                    <br>
                                    <p class="align-center mx-auto text-center" style="line-height: 2;"><span class="align-center"
                                            style="color: rgb(144, 144, 144); font-size: 18px;">Coudy 채용 서비스는 인증된 회사와 유저간의 완벽한 운영을 도와줍니다. 즉시 이력서 지원은 기본이며 기능을 이용해보세요~</span>
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