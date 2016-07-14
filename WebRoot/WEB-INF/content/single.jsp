<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>single</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	
	
	

	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 





</script>
<!-- //for-mobile-apps -->
<link href="<%=path%>/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link rel="stylesheet" href="<%=path%>/css/flexslider.css"
	type="text/css" media="screen" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- js -->
<script type="text/javascript" src="<%=path%>/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- single -->
<script src="<%=path%>/js/imagezoom.js"></script>
<script src="<%=path%>/js/jquery.flexslider.js"></script>
<!-- single -->
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
<script language="javascript">
	function codefans() {
		var box = document.getElementById("tip");
		box.style.display = "none";
	}
	setTimeout("codefans()", 2000);//2秒
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- single -->
	<span id="userId" type="button" style="display:none;">${userId }</span>
	<span id="username" type="button" style="display:none;">${username }</span>
	<span id="bookId" type="button" style="display:none;">${data.id }</span>
	<div class="single">
		<div class="container">
			<div
				class="col-md-6 single-right-left animated wow slideInUp animated"
				data-wow-delay=".5s"
				style="visibility: visible; animation-delay: 0.5s; animation-name: slideInUp;">
				<div class="grid images_3_of_2">
					<div class="flexslider">
						<!-- FlexSlider -->
						<script>
							// Can also be used with $(document).ready()
							$(window).load(function() {
								$('.flexslider').flexslider({
									animation : "slide",
									controlNav : "thumbnails"
								});
							});
						</script>
						<!-- //FlexSlider-->
						<ul class="slides">
							<li data-thumb="${data.bookUrl}">
								<div class="thumb-image">
									<img src="${data.bookUrl}" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
							<li data-thumb="${data.bookUrl}">
								<div class="thumb-image">
									<img src="${data.bookUrl}" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
							<li data-thumb="${data.bookUrl}">
								<div class="thumb-image">
									<img src="${data.bookUrl}" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
							<li data-thumb="${data.bookUrl}">
								<div class="thumb-image">
									<img src="${data.bookUrl}" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div
				class="col-md-6 single-right-left simpleCart_shelfItem animated wow slideInRight animated"
				data-wow-delay=".5s"
				style="visibility: visible; animation-delay: 0.5s; animation-name: slideInRight;">
				<h3>${data.bookName }</h3>
				<p>
					<span class="item_price">作者：</span>
				</p>
				<p>
					<span class="item_price">商品id:${data.id }</span>
				</p>
				<p>
					<span class="item_price">价格：${data.bookPrice }元</span>

				</p>

				<div class="rating1">
					<p>用户评价(已有${fn:length(review) }人评价）</p>
					<span class="starRating"> <input id="rating5" type="radio"
						name="rating" value="5"> <label for="rating5">5</label> <input
						id="rating4" type="radio" name="rating" value="4"> <label
						for="rating4">4</label> <input id="rating3" type="radio"
						name="rating" value="3" checked=""> <label for="rating3">3</label>
						<input id="rating2" type="radio" name="rating" value="2">
						<label for="rating2">2</label> <input id="rating1" type="radio"
						name="rating" value="1"> <label for="rating1">1</label>
					</span>
				</div>
				<!--		<div class="description">
						<h5>Check delivery, payment options and charges at your location</h5>
						<input type="text" value="Enter pincode" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter pincode';}" required="">
						<input type="submit" value="Check">
					</div>   -->
				<div class="color-quality">
					<div class="color-quality-right">
						<p>购买数量：</p>
						<!--		<h5>购买数量:</h5>  -->
						<select id="country1" onchange="change_country(this.value)"
							class="frm-field required sect">
							<c:forEach var="item" begin="1" end="${data.bookNumber }">
								<option value="${item }">${item }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<br>
				<div class="occasion-cart">
					<c:choose>

						<c:when test="${data.bookNumber>0 }">
							<a href="javascript:addToShoppingCart()"
								class="item_add single-item hvr-outline-out button2">添加到购物车</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);" class=" btn btn-info  disabled">库存不足</a>
						</c:otherwise>
					</c:choose>

					<a
						href="/mall/collect/saveCollect.do?userId=${userId}&bookId=${data.id }"
						class="item_add hvr-outline-out button2">加入收藏</a>
					<%-- <div id="tip">
						<font color=red><b>${tip}</b></font>
					</div> --%>
				</div>

			</div>
			<div class="clearfix"></div>

			<div class="bootstrap-tab animated wow slideInUp animated"
				data-wow-delay=".5s"
				style="visibility: visible; animation-delay: 0.5s; animation-name: slideInUp;">
				<div class="bs-example bs-example-tabs" role="tabpanel"
					data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home"
							id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
							aria-expanded="true">商品详情</a></li>
						<li role="presentation"><a href="#profile" role="tab"
							id="profile-tab" data-toggle="tab" aria-controls="profile">评论</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel"
							class="tab-pane fade in active bootstrap-tab-text" id="home"
							aria-labelledby="home-tab">
							<h5>内容推荐</h5>
							<!-- <p>为纪念汶川大地震八周年，中国出版集团 中译出版社推出著名作家李鸣生长篇纪实文学《
								后地震时代》。李鸣生为三届鲁迅文学奖得主，被网民称为“有良知的作家”。大地震发生后，他先后六赴灾区，走访了数十个城镇、乡村、学校及上百位灾民，行程上万里，并深入深山，与灾民同吃同住。继《震中在人心》之后，又创作了《后地震时代》。该作紧贴废墟，直面伤痕，如实记录了灾区人民在血迹斑斑的废墟上重建家园的感人故事。既颂扬了灾区震不跨的伟大精神，又讲述了众多灾民和乡镇干部苦不堪言的灵魂挣扎和不堪重负的精神苦闷；同时也反思了灾后重建中的种种问题与矛盾。书中故事质朴可信，引人反省。

							</p> -->
						</div>
						<div role="tabpanel" class="tab-pane fade bootstrap-tab-text"
							id="profile" aria-labelledby="profile-tab">
							<div class="bootstrap-tab-text-grids">
								<div class="bootstrap-tab-text-grid">
									<c:forEach items="${review}" var="item">
										<div class="bootstrap-tab-text-grid-left">
											<img src="<%=path%>/images/men3.jpg" alt=""
												class="img-responsive">
										</div>
										<div class="bootstrap-tab-text-grid-right">
											<ul>
												<li>${item.userName }</a></li>
											</ul>
											<p>${item.reviewContent }</p>
										</div>
										<div class="clearfix"></div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var userId = $("#userId").text();
		//alert("userId:"+userId);
		var username = $("#username").text();
		var bookId = $("#bookId").text();

		function addToShoppingCart() {
			var number = $("#country1").val();
			window.location.href = "/mall/shoppingCart/addToShoppingCart.do?userId="
					+ userId + "&bookId=" + bookId + "&number=" + number;
		}
	</script>
	<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>
