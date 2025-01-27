<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="${pageContext.request.contextPath}/img/WYWlogo.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <title>WYW</title>
    <style></style>
</head>

<body>
<jsp:include page="index_top.jsp" flush="false"/>

<div class="main">
    <div class="main__slide">
        <button class="main__slide-left">
            <i class="fas fa-angle-left"></i>
        </button>
        <button class="main__slide-right">
            <i class="fas fa-angle-right"></i>
        </button>
        <!-- <img src="img/slide/slide_1.png" alt="" /> -->
    </div>

    <div class="main__best">
        <h1 class="main__best-title">
            <a href="<c:url value='/product.best'/>"><span>BEST</span> PRODUCT</a>
        </h1>
        <div class="main__best__product">
            <c:forEach items="${bestList}" var="bestproduct">
                <a href="<c:url value='/productDetail'/>?product_id=${bestproduct.id}">
                    <div class="main__best__product__component">
                        <c:choose>
                            <c:when test="${bestproduct.imageVOList.size()==0}">
                                <img src="<c:url value='/img/noimage.PNG'/>">
                            </c:when>

                            <c:when test="${bestproduct.imageVOList!=null}">
                                <img src="/WYW/display?fileName=${bestproduct.imageVOList[0].upload_path}/${bestproduct.imageVOList[0].uuid}_${bestproduct.imageVOList[0].file_name}">
                            </c:when>
                        </c:choose>
                        <div class="main__best__product__component-description">
                            <h1 class="main__best__product__component-description-title">
                                    ${bestproduct.name}
                            </h1>
                            <p class="main__best__product__component-description-category">
                                분류 : ${bestproduct.cate_name}
                            </p>
                            <p class="main__best__product__component-description-ratingAvg">
                                평점 : ${bestproduct.ratingAvg}/5.0
                            </p>
                            <span class="main__best__product__component-description-price">
              ￦  <fmt:formatNumber value="${bestproduct.price}" pattern="###,###,###"/>
              </span>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>

    <div class="main__new">
        <h1 class="main__new-title">
            <a href="<c:url value='/product.new'/>"><span>NEW</span> PRODUCT</a>
        </h1>
        <div class="main__new__product">
            <c:forEach items="${newList}" var="newproduct">
                <a href="<c:url value='/productDetail'/>?product_id=${newproduct.id}">
                    <div class="main__new__product__component">
                        <c:choose>
                            <c:when test="${newproduct.imageVOList.size()==0}">
                                <img src="<c:url value='/img/noimage.PNG'/>">
                            </c:when>

                            <c:when test="${newproduct.imageVOList!=null}">
                                <img src="/WYW/display?fileName=${newproduct.imageVOList[0].upload_path}/${newproduct.imageVOList[0].uuid}_${newproduct.imageVOList[0].file_name}">
                            </c:when>
                        </c:choose>
                        <div class="main__new__product__component-description">
                            <h1 class="main__new__product__component-description-title">
                                    ${newproduct.name}
                            </h1>
                            <p class="main__new__product__component-description-category">
                                분류 : ${newproduct.cate_name}
                            </p>
                            <p class="main__new__product__component-description-ratingAvg">
                                평점 : ${newproduct.ratingAvg}/5.0
                            </p>
                            <span class="main__new__product__component-description-price">
                     ￦ <fmt:formatNumber value="${newproduct.price}" pattern="###,###,###"/> 원
                        </span>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</div>

<jsp:include page="index_bottom.jsp" flush="false"/>
<script src="${pageContext.request.contextPath}/js/mainSlide.js"></script>
<script>
    const msg = "${msg}";
    if (msg === "orderOk") {
        alert("주문내역이 등록되었습니다. 이용해주셔서 감사합니다.")
    }
</script>
</body>
</html>
