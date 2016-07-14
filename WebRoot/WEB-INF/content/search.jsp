<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>首页</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 


</script>
<!-- //for-mobile-apps -->
<link href="<%=path%>/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<!-- pignose css -->
<link href="<%=path%>/css/pignose.layerslider.css" rel="stylesheet"
	type="text/css" media="all" />


<!-- //pignose css -->
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- js -->
<script type="text/javascript" src="<%=path%>/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="<%=path%>/js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="<%=path%>/js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='http://fonts.useso.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
<script src="<%=path%>/js/jquery.easing.min.js"></script>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>

	<!-- //banner-top -->
	<!-- banner -->
	<div class="banner-grid">
		<div id="visual">
			<div class="slide-visual">
				<!-- Slide Image Area (1000 x 424) -->
				<ul class="slide-group">
					<li><img class="img-responsive" src="<%=path%>/images/ba1.jpg"
						alt="Dummy Image" /></li>
					<li><img class="img-responsive" src="<%=path%>/images/ba2.jpg"
						alt="Dummy Image" /></li>
					<li><img class="img-responsive" src="<%=path%>/images/ba3.jpg"
						alt="Dummy Image" /></li>
				</ul>

				<!-- Slide Description Image Area (316 x 328) -->
				<div class="script-wrap">
					<ul class="script-group">
						<li><div class="inner-script">
								<img class="img-responsive" src="<%=path%>/images/baa1.jpg"
									alt="Dummy Image" />
							</div></li>
						<li><div class="inner-script">
								<img class="img-responsive" src="<%=path%>/images/baa2.jpg"
									alt="Dummy Image" />
							</div></li>
						<li><div class="inner-script">
								<img class="img-responsive" src="<%=path%>/images/baa3.jpg"
									alt="Dummy Image" />
							</div></li>
					</ul>
					<div class="slide-controller">
						<a href="#" class="btn-prev"><img
							src="<%=path%>/images/btn_prev.png" alt="Prev Slide" /></a> <a
							href="#" class="btn-play"><img
							src="<%=path%>/images/btn_play.png" alt="Start Slide" /></a> <a
							href="#" class="btn-pause"><img
							src="<%=path%>/images/btn_pause.png" alt="Pause Slide" /></a> <a
							href="#" class="btn-next"><img
							src="<%=path%>/images/btn_next.png" alt="Next Slide" /></a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
		<script type="text/javascript"
			src="<%=path%>/js/pignose.layerslider.js"></script>
		<script type="text/javascript">
			//<![CDATA[
			$(window).load(function() {
				$('#visual').pignoseLayerSlider({
					play : '.btn-play',
					pause : '.btn-pause',
					next : '.btn-next',
					prev : '.btn-prev'
				});
			});
			//]]>
		</script>

	</div>
	<br>

	<div class="product-easy">
		<div class="container">

			<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
			<script type="text/javascript">
				$(document).ready(function() {
					$('#horizontalTab').easyResponsiveTabs({
						type : 'default', //Types: default, vertical, accordion           
						width : 'auto', //auto or any width like 600px
						fit : true
					// 100% fit in a container
					});
				});
			</script>
			<div class="sap_tabs">
				<div id="horizontalTab"
					style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>书籍</span></li>
					</ul>
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
							<c:forEach items="${data}" var="book" varStatus="b">
								<div class="col-md-3 product-men">
									<div class="men-pro-item simpleCart_shelfItem">
										<div class="men-thumb-item">

											<img src="${book.bookUrl}" alt="whx" class="pro-image-front" />
											<img src="${book.bookUrl}" alt="null" class="pro-image-back" />



											<%-- <img src="<%=path%>/images/a8.png" alt="" class="pro-image-front">
										<img src="<%=path%>/images/a8.png" alt="" class="pro-image-back">  --%>

											<div class="men-cart-pro">
												<div class="inner-men-cart-pro">
													<a href="/mall/find.do?bookId=${book.id}" class="link-product-add-cart">快速浏览</a>
												</div>
											</div>


										</div>
										<div class="item-info-product ">
											<h4>
												<%-- <c:out value="${book.bookName}" /> --%>
												<a href="/mall/find.do?bookId=${book.id}">${book.bookName}</a>
											</h4>
											<div class="info-product-price">

												<span class="item_price"><c:out
														value="￥${book.bookPrice}" /></span>

											</div>
											<c:choose>
												<c:when test="${book.bookNumber>0 }">
													<a
														href="/mall/shoppingCart/addToShoppingCart.do?userId=${userId }&bookId=${book.id}&number=1"
														class="item_add single-item hvr-outline-out button2">添加到购物车</a>
												</c:when>
												<c:otherwise>
													<a
														href="javascript:void(0);"
														class="item_add single-item hvr-outline-out button2">库存不足</a>
												</c:otherwise>
												</c:choose>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script>
		$(".button2")
	</script>
</body>
</html>
