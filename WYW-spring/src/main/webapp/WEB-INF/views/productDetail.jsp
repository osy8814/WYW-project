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

<div class="product_main">
    <div class="product_main-outter">
        <h1 class="product_main_title"></h1>


        <form method="post" class="product_main_form">
            <div class="product_img">
                <div class="product_img_main">
                    <img id="main-image" src="/WYW/display?fileName=${productsViewVo.imageVOList[0].upload_path}/${productsViewVo.imageVOList[0].uuid}_${productsViewVo.imageVOList[0].file_name}">
                </div>
                <div class="product_img_thumb-set">
                    <%--<div id='product_img_thumb'></div>--%>
                </div>
            </div>
            <div class="product_info">
                <h1 class="product_info_name">${productsViewVo.name}</h1>
                <h1 class="product_info_cate-name">${productsViewVo.cate_name}
                    <c:if test="${loggedInUser.isAdmin}">
                        <button type="button" onclick="location.href='<c:url
                                value="/admin/productsManage?id=${productsViewVo.id}"/>'">상품관리
                        </button>
                    </c:if>
                </h1>
                <div class="product_info_dox">
                    <div class="product_info_dox_price product_info_dox_inner">
                        <div class="product_info_dox_inner_left">판매가</div>
                        <div class="product_info_dox_inner_right">
                            <fmt:formatNumber value="${productsViewVo.price}" pattern="###,###,###"/> 원
                        </div>
                    </div>
                    <div class="product_info_dox_shipment product_info_dox_inner">
                        <div class="product_info_dox_inner_left">국내▫해외배송</div>
                        <div class="product_info_dox_inner_right">국내배송</div>
                    </div>
                    <div class="product_info_dox_shipping-method product_info_dox_inner">
                        <div class="product_info_dox_inner_left">배송방법</div>
                        <div class="product_info_dox_inner_right">택배</div>
                    </div>
                    <div class="product_info_dox_delivery-fee product_info_dox_inner">
                        <div class="product_info_dox_inner_left">배송비</div>
                        <div class="product_info_dox_inner_right">20,000원</div>
                    </div>

                </div>
                <div class="product_info_quantity">
                    <span>주문수량</span>
                    <span>
                        <button type="button" class="value_down">-</button>
                        <input type="text" id="product_quantity" value="1">
                        <button type="button" class="value_up">+</button>
                        <span>(재고 : ${productsViewVo.stock})</span>
                    </span>
                </div>
                <div class="product_info_total-price-set">
                    <span>Total</span>
                    <span class="product_info_total-price"></span>
                    <span class="product_info_total-quantity"></span>
                </div>
                <div class="product_info_btn-set">
                    <button id="buy-now" type="button">바로구매</button>
                    <div class="product_info_btn-set_inner">
                        <button type="button" id="btn_cart">장바구니담기</button>
                        <button type="button">찜하기</button>
                    </div>

                </div>
            </div>
        </form>
        <div class="product_main-detail">
            <h1 class="product_main-detail-title">상세정보</h1>
            <div class="product_main-detail_content">
                ${productsViewVo.description}
            </div>
        </div>
    </div>
</div>
<!--바로구매-->
<form action="/WYW/order/list" method="get" class="order_form">
    <input type="hidden" name="orders[0].productId" value="${productsViewVo.id}">
    <input type="hidden" name="orders[0].productCount" value="">
</form>

<jsp:include page="index_bottom.jsp" flush="false"/>
<script>
    let max = parseInt(${productsViewVo.stock});
    let min = 1;
    let productPrice = parseInt(${productsViewVo.price});


    showResult(1);

    $(".value_up").on("click", function () {
        let quantity = parseInt($('#product_quantity').val());
        if (quantity != max) {
            $('#product_quantity').val(quantity + 1);
        }
        quantity = parseInt($('#product_quantity').val());
        showResult(quantity);

    });

    $(".value_down").on("click", function () {
        let quantity = parseInt($('#product_quantity').val());
        if (quantity != min) {
            $('#product_quantity').val(quantity - 1);
        }
        quantity = parseInt($('#product_quantity').val());
        showResult(quantity);

    });

    function showResult(quantity) {
        let result = quantity * productPrice;
        const option = {
            maximumFractionDigits: 4
        };
        let transtion = result.toLocaleString('ko-KR', option);
        $(".product_info_total-price").text(transtion + "원");
        $(".product_info_total-quantity").text("(" + quantity + "개)")
    }
</script>
<script>
    const form = {
        user_id : '${loggedInUser.userId}',
        product_id : '${productsViewVo.id}',
        product_count : ''
    }

    // 장바구니 클릭
    $("#btn_cart").on("click", function(e){
        if("${productsViewVo.stock}"==="0"){
            alert("죄송합니다. 상품의 재고가 모자랍니다. 나중에 다시 이용해 주십시오.");
            return false;
        }

        form.product_count = $("#product_quantity").val();
        $.ajax({
            url: '/WYW/cart/add',
            type: 'POST',
            data: form,
            success: function(result){
                cartAlert(result);
            },
            error : function (result){
                alert(result);
            }

        })
    });

    function cartAlert(result){
        if(result == '0'){
            alert("장바구니에 추가를 하지 못하였습니다.");
        } else if(result == '1'){
            alert("장바구니에 추가되었습니다.");
        } else if(result == '2'){
            alert("장바구니에 이미 추가되어 있습니다.");
        } else if(result == '5'){
            alert("로그인이 필요합니다.");
        }
    }
</script>
<script>
    /* 바로구매 버튼 */
    $("#buy-now").on("click", function(){
        if("${productsViewVo.stock}"==="0"){
            alert("죄송합니다. 상품의 재고가 모자랍니다. 나중에 다시 이용해 주십시오.");
            return false;
        }

        let ProductCount = $("#product_quantity").val();

        $(".order_form").find("input[name='orders[0].productCount']").val(ProductCount);
        $(".order_form").submit();
    });
</script>

<script>
    // 이미지로더
    let product_id = ${productsViewVo.id};
    let uploadReslut = $(".product_img_thumb-set");

    // 이미지 생성
    $.getJSON("/WYW/getAttachList", {product_id: product_id}, function (arr) {
        if (arr.length === 0) {
            let str = "";
            str += "<div id='result_card'>";
            str += "<img id='no_img' src='/WYW/img/noimage.PNG'>";
            str += "</div>";

            uploadReslut.html(str);

            return;
        }
        for (let i = 0; i < arr.length; i++) {

            let str = "";
            let obj = arr[i];

            let fileCallPath = encodeURIComponent(obj.upload_path.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.file_name);
            str += "<div class='product_img_thumb'>";
            str += "<img class='thumbnail-image' src='/WYW/display?fileName=" + fileCallPath + "'>";
            str += "</div>";

            uploadReslut.append(str);
        }

        //썸네일 이미지 클릭시 메인 이미지 변경
        const mainImage = $('#main-image');
        const thumnail = $('.thumbnail-image');
        let thumnailSrc;
        thumnail.click(function (event){
            thumnailSrc = event.target.getAttribute("src");
            mainImage.attr("src",thumnailSrc);
        });
    });
</script>
<script>

</script>
</body>
</html>
