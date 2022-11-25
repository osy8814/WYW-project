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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?after"/>
    <title>WYW</title>
    <style></style>
</head>

<body>

<jsp:include page="../index_top.jsp" flush="false"/>

<div class="admin_main">

    <div class="wrapper">


        <div class="wrap">
            <div class="wrap_title">관리자 페이지</div>

            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                    <ul>
                        <li>
                            <a href="<c:url value="/admin/productsReg"/>" class="admin_list_01"><i
                                    class="far fa-clipboard"></i>
                                상품 등록</a>
                        </li>
                        <li>
                            <a href="<c:url value="/admin/productslist"/>" class="admin_list_02"><i
                                    class="fas fa-list"></i>상품 목록</a>
                        </li>
                        <lI>
                            <a href="<c:url value="/admin/category"/>" class="admin_list_03"><i
                                    class="fas fa-bezier-curve"></i>카테고리 등록</a>
                        </lI>
                        <lI>
                            <a href="<c:url value="/admin/categoryManage"/>" class="admin_list_04"><i
                                    class="fas fa-scroll"></i>카테고리 관리</a>
                        </lI>
                        <lI>
                            <a class="admin_list_05"><i class="fas fa-users-cog"></i>회원 관리</a>
                        </lI>
                    </ul>

                </div>
                <div class="admin_content_wrap">
                    <div class="admin_content_wrap_title">상품 목록</div>
                    <c:if test="${listCheck != 'empty' }">
                        <table>
                            <tr>
                                <th>상품번호</th>
                                <th>등록인</th>
                                <th>이름</th>
                                <th>카테고리</th>
                                <th>가격</th>
                                <th>수량</th>
                                <th>누적판매량</th>
                                <th>등록날짜</th>
                                <th>관리</th>
                            </tr>

                            <c:forEach items="${list}" var="product">
                                <tr>
                                    <td>${product.id}</td>
                                    <td>${product.user_id}</td>
                                    <td>${product.name}</td>
                                    <td>${product.cate_name}</td>
                                    <td>
                                        <fmt:formatNumber value="${product.price}" pattern="###,###,###"/>원
                                    </td>

                                    <td>
                                        <fmt:formatNumber value="${product.stock}" pattern="###,###,###"/>EA
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${product.cumulative_sales}" pattern="###,###,###"/>EA
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${product.created_at}" pattern="YYYY/MM/dd"/>
                                    </td>
                                    <td>
                                        <button type="button" onclick="location.href='<c:url
                                                value="/admin/productsManage?id=${product.id}"/>'">관리
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </c:if>
                    <c:if test="${listCheck == 'empty'}">
                        <div class="table_empty">
                            등록된 상품이 없습니다.
                        </div>
                    </c:if>
                    <div class="search_wrap">
                        <form id="searchForm" action="/WYW/admin/productslist" method="get">
                            <div class="search_input">
                                <input type="text" name="keyword"
                                       value='<c:out value="${pageMarker.pagehandler.keyword}"></c:out>'>
                                <input type="hidden" name="pageNum"
                                       value='<c:out value="${pageMarker.pagehandler.pageNum }"></c:out>'>
                                <input type="hidden" name="amount" value='${pageMarker.pagehandler.amount}'>
                                <button class='btn search_btn'>검 색</button>
                            </div>
                        </form>
                    </div>

                    <div class="pageMarker_wrap">
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

                    <form id="moveForm" action="/WYW/admin/productslist" method="get">
                        <input type="hidden" name="pageNum" value="${pageMarker.pagehandler.pageNum}">
                        <input type="hidden" name="amount" value="${pageMarker.pagehandler.amount}">
                        <input type="hidden" name="keyword" value="${pageMarker.pagehandler.keyword}">
                    </form>
                </div>

            </div>
        </div>
    </div>

</div>
<jsp:include page="../index_bottom.jsp" flush="false"/>
<script src="${pageContext.request.contextPath}/js/pagehandler.js"></script>
<script>
    const msg = "${msg}";
    if (msg == "del_ok") {
        alert("상품이 삭제되었습니다.")
    }
    if (msg == "del_err") {
        alert("상품이 삭제에 실패 하였습니다.")
    }
</script>
</body>
</html>
