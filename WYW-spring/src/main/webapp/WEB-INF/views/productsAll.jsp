<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="${pageContext.request.contextPath}/img/WYWlogo.png" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <title>WYW</title>
    <style></style>
  </head>

  <body>

    <jsp:include page="index_top.jsp" flush="false"/>

    <div class="products_main">
      <div class="products_main-outter">
        <h1 class="products_main_title">신상품 검색결과 총 : ${totalResult} 개</h1>
          <div class="products_diplay">
            <c:if test="${listCheck != 'empty' }">

                <c:forEach items="${list}" var="product">
                  
                    <a href="<c:url value='/productDetail'/>">
                      <div class="main__best__product">
                        <div class="main__best__product__componet">

                          <div class="main__best__product__componet-description">
                            <h1 class="main__best__product__componet-description-title">
                              ${product.name}
                                ${product.cate_name}
                            </h1>
                            <p class="main__best__product__componet-description-descrip">
                                ${product.description}
                            </p>
                            <span class="main__best__product__componet-description-price">
                                <fmt:formatNumber value="${product.price}" pattern="###,###,###"/>원
                            </span>
                          </div>
                        </div>
                      </div>
                    </a>

                </c:forEach>
            </c:if>
            <c:if test="${listCheck == 'empty'}">
              <div class="table_empty">
                등록된 상품이 없습니다.
              </div>
            </c:if>
          </div>
            <div class="search_wrap">
              <form id="searchForm" action="/WYW/products" method="get">
                <div class="search_input">
                  <input type="text" name="keyword" value='<c:out value="${pageMarker.pagehandler.keyword}"></c:out>'>
                  <input type="hidden" name="pageNum" value='<c:out value="${pageMarker.pagehandler.pageNum }"></c:out>'>
                  <input type="hidden" name="amount" value='${pageMarker.pagehandler.amount}'>
                  <button class='btn search_btn'>검 색</button>
                </div>
              </form>
            </div>

            <div class="pageMarker_wrap" >
              <ul class="pageMarker">
                <!-- 이전 버튼 -->
                <c:if test="${pageMarker.prev}">
                  <li class="pageMarker_btn prev">
                    <a href="${pageMarker.pageStart - 1}">이전</a>
                  </li>
                </c:if>


                <!-- 페이지 번호 -->
                <c:forEach begin="${pageMarker.pageStart}" end="${pageMarker.pageEnd}" var="num">
                  <li class="pageMarker_btn ${pageMarker.pagehandler.pageNum == num ? "active":""}">
                    <a href="${num}">${num}</a>
                  </li>
                </c:forEach>

                <!-- 다음 버튼 -->
                <c:if test="${pageMarker.next}">
                  <li class="pageMarker_btn next">
                    <a href="${pageMarker.pageEnd + 1 }">다음</a>
                  </li>
                </c:if>
              </ul>
            </div>

            <form id="moveForm" action="/WYW/products" method="get">
              <input type="hidden" name="pageNum" value="${pageMarker.pagehandler.pageNum}">
              <input type="hidden" name="amount" value="${pageMarker.pagehandler.amount}">
              <input type="hidden" name="keyword" value="${pageMarker.pagehandler.keyword}">
            </form>


      </div>
    </div>

    <jsp:include page="index_bottom.jsp" flush="false"/>

    <script src="${pageContext.request.contextPath}/js/pagehandler.js"></script>
    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>