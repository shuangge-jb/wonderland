<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>mens</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //for-mobile-apps -->
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" type="text/css" href="../css/jquery-ui.css">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="../js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="../js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='http://fonts.useso.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
<script src="../js/jquery.easing.min.js"></script>

</head>
<body>
	<jsp:include page="header.jsp" flush="true"></jsp:include>
	<!-- banner -->
	<div class="page-head">
		<div class="container">
			<h3>艺术</h3>
		</div>
	</div>
	<!-- //banner -->

	<!-- mens -->
	<div class="men-wear">
		<div class="container">
			<div class="col-md-4 products-left">
				<div class="filter-price">
					<h3>价格区间</h3>
					<ul class="dropdown-menu6">
						<li>
							<div id="slider-range"></div> <input type="text" id="amount"
							style="border: 0; color: #ffffff; font-weight: normal;" />
						</li>
					</ul>
					<!---->
					<script type='text/javascript'>
						//<![CDATA[ 
						$(window)
								.load(
										function() {
											$("#slider-range")
													.slider(
															{
																range : true,
																min : 0,
																max : 9000,
																values : [
																		1000,
																		7000 ],
																slide : function(
																		event,
																		ui) {
																	$("#amount")
																			.val(
																					"$"
																							+ ui.values[0]
																							+ " - $"
																							+ ui.values[1]);
																}
															});
											$("#amount")
													.val(
															"$"
																	+ $(
																			"#slider-range")
																			.slider(
																					"values",
																					0)
																	+ " - $"
																	+ $(
																			"#slider-range")
																			.slider(
																					"values",
																					1));

										});//]]>
					</script>
					<script type="text/javascript" src="../js/jquery-ui.js"></script>
					<!---->
				</div>
				<div class="css-treeview">
					<h4>分类</h4>
					<ul class="tree-list-pad">
						<li><input type="checkbox" checked="checked" id="item-0" /><label
							for="item-0"><span></span>Men's Wear</label>
							<ul>
								<li><input type="checkbox" id="item-0-0" /><label
									for="item-0-0">Ethinic Wear</label>
									<ul>
										<li><a href="mens.html">Shirts</a></li>
										<li><a href="mens.html">Caps</a></li>
										<li><a href="mens.html">Shoes</a></li>
										<li><a href="mens.html">Pants</a></li>
										<li><a href="mens.html">SunGlasses</a></li>
										<li><a href="mens.html">Trousers</a></li>
									</ul></li>
								<li><input type="checkbox" id="item-0-1" /><label
									for="item-0-1">Party Wear</label>
									<ul>
										<li><a href="mens.html">Shirts</a></li>
										<li><a href="mens.html">Caps</a></li>
										<li><a href="mens.html">Shoes</a></li>
										<li><a href="mens.html">Pants</a></li>
										<li><a href="mens.html">SunGlasses</a></li>
										<li><a href="mens.html">Trousers</a></li>
									</ul></li>
								<li><input type="checkbox" id="item-0-2" /><label
									for="item-0-2">Casual Wear</label>
									<ul>
										<li><a href="mens.html">Shirts</a></li>
										<li><a href="mens.html">Caps</a></li>
										<li><a href="mens.html">Shoes</a></li>
										<li><a href="mens.html">Pants</a></li>
										<li><a href="mens.html">SunGlasses</a></li>
										<li><a href="mens.html">Trousers</a></li>
									</ul></li>
							</ul></li>
						<li><input type="checkbox" id="item-1" checked="checked" /><label
							for="item-1">Best Collections</label>
							<ul>
								<li><input type="checkbox" checked="checked" id="item-1-0" /><label
									for="item-1-0">New Arrivals</label>
									<ul>
										<li><a href="mens.html">Shirts</a></li>
										<li><a href="mens.html">Shoes</a></li>
										<li><a href="mens.html">Pants</a></li>
										<li><a href="mens.html">SunGlasses</a></li>
									</ul></li>

							</ul></li>
						<li><input type="checkbox" checked="checked" id="item-2" /><label
							for="item-2">Best Offers</label>
							<ul>
								<li><input type="checkbox" id="item-2-0" /><label
									for="item-2-0">Summer Discount Sales</label>
									<ul>
										<li><a href="mens.html">Shirts</a></li>
										<li><a href="mens.html">Shoes</a></li>
										<li><a href="mens.html">Pants</a></li>
										<li><a href="mens.html">SunGlasses</a></li>
									</ul></li>
								<li><input type="checkbox" id="item-2-1" /><label
									for="item-2-1">Exciting Offers</label>
									<ul>
										<li><a href="mens.html">Shirts</a></li>
										<li><a href="mens.html">Shoes</a></li>
										<li><a href="mens.html">Pants</a></li>
										<li><a href="mens.html">SunGlasses</a></li>
									</ul></li>
								<li><input type="checkbox" id="item-2-2" /><label
									for="item-2-2">Flat Discounts</label>
									<ul>
										<li><a href="mens.html">Shirts</a></li>
										<li><a href="mens.html">Shoes</a></li>
										<li><a href="mens.html">Pants</a></li>
										<li><a href="mens.html">SunGlasses</a></li>
									</ul></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<div class="col-md-8 products-right">
				<!--	<h5>Product Compare(0)</h5>   -->
				<div class="sort-grid">
					<div class="sorting">
						<h6>排序</h6>
						<select id="country1" onchange="change_country(this.value)"
							class="frm-field required sect">
							<option value="null">Default</option>
							<option value="null">Name(A - Z)</option>
							<option value="null">Name(Z - A)</option>
							<option value="null">Price(High - Low)</option>
							<option value="null">Price(Low - High)</option>
							<option value="null">Model(A - Z)</option>
							<option value="null">Model(Z - A)</option>
						</select>
						<div class="clearfix"></div>
					</div>
					<div class="sorting">
						<h6>每页展示</h6>
						<select id="country2" onchange="change_country(this.value)"
							class="frm-field required sect">
							<option value="null">7</option>
							<option value="null">14</option>
							<option value="null">28</option>
							<option value="null">35</option>
						</select>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="men-wear-top">
					<script src="../js/responsiveslides.min.js"></script>
					<script>
						// You can also use "$(window).load(function() {"
						$(function() {
							// Slideshow 4
							$("#slider3")
									.responsiveSlides(
											{
												auto : true,
												pager : true,
												nav : false,
												speed : 500,
												namespace : "callbacks",
												before : function() {
													$('.events')
															.append(
																	"<li>before event fired.</li>");
												},
												after : function() {
													$('.events')
															.append(
																	"<li>after event fired.</li>");
												}
											});
						});
					</script>
					<div id="top" class="callbacks_container">
						<ul class="rslides" id="slider3">
							<li><img class="img-responsive" src="images/men1.jpg"
								alt=" " /></li>
							<li><img class="img-responsive" src="images/men2.jpg"
								alt=" " /></li>
							<li><img class="img-responsive" src="images/men1.jpg"
								alt=" " /></li>
							<li><img class="img-responsive" src="images/men2.jpg"
								alt=" " /></li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="men-wear-bottom">
					<div class="col-sm-4 men-wear-left">
						<img class="img-responsive" src="images/men3.jpg" alt=" " />
					</div>
					<div class="col-sm-8 men-wear-right">
						<h4>专属文艺的集合</h4>
						<p>这里是文艺的天地，有你想要属于文艺的灵感。徜徉在艺术的殿堂，感受艺术给你带来不一样的人生。</p>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="single-pro">

				<div class="col-md-3 product-men">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="images/a8.png" alt="" class="pro-image-front"> <img
								src="images/a8.png" alt="" class="pro-image-back">
							<div class="men-cart-pro">
								<div class="inner-men-cart-pro">
									<a href="single.html" class="link-product-add-cart">快速查看</a>
								</div>
							</div>
							<span class="product-new-top">包邮（9折）</span>
						</div>
						<div class="item-info-product ">
							<h4>
								<a href="single.html">后地震时代</a>
							</h4>
							<div class="info-product-price">
								<span class="item_price">$45.99</span>
								<del>$69.71</del>
							</div>
							<a href="#" class="item_add single-item hvr-outline-out button2">加入购物车</a>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="pagination-grid text-right">
				<ul class="pagination paging">
					<li><a href="#" aria-label="Previous"><span
							aria-hidden="true">«</span></a></li>
					<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //mens -->

	<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>
