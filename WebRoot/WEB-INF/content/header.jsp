<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>主页</title>

</head>

<body>
	<!-- header -->
	<div class="header">
		<div class="container">
			<ul>
				<li><span class="glyphicon glyphicon-time" aria-hidden="true"></span>Wonderland网上书店</li>
				<li><span class="glyphicon glyphicon-shopping-cart"
					aria-hidden="true"></span>优惠又实惠</li>
				<li><span class="glyphicon glyphicon-envelope" aria-hidden="true">
				</span><a href="javascript:void(0);">1489492211@qq.com</a></li>	
			</ul>
		</div>
	</div>
	
	<jsp:include page="login_inf.jsp"></jsp:include>
	<!-- //header -->
	<!-- header-bot -->
	<div class="header-bot">
		<div class="container">
			<div class="col-md-3 header-left">
				<h1>
					<a href="/mall/index.do"><img src="<%=path%>/images/logo3.jpg"></a>
				</h1>
			</div>
			<div class="col-md-6 header-middle">
				<script>
					/* function search(){
					var bookName=$("#bookNameInput").val();
					alert("bookName= "+bookName);
					window.location.href="/mall/findLike.do?";
					} */
				</script>
				<form action="/mall/findLike.do" method="POST">
					<div class="search">
						<input id="bookNameInput" name="bookName" type="search" value="null"
							onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'null';}" required="">
					</div>

					<div class="section_room">
						<select id="country" name="bookFirstType"
							onchange="change_country(this.value)" class="frm-field required">
							<option value="null" selected="selected">所有分类</option>
							<!-- <option value="null">Electronics</option>
							<option value="AX">kids Wear</option>
							<option value="AX">Men's Wear</option>
							<option value="AX">Women's Wear</option>
							<option value="AX">Watches</option> -->
						</select>
					</div>
					<div class="sear-sub">
						<input type="submit" value="">
					</div>
					<div class="clearfix"></div>
				</form>
			</div>
			<script>
				$(window).load(
						function() {
							//alert("hello world!");
							function loadType() {
								var text=$("#bookNameInput").val();
								$.get("/mall/findBookFirstType.do", function(
										data) {
									var list = data.result;
									$.each(list, function(i) {
										var item = list[i];
										$("#country").append(
												"<option value='"+item+"'>"+item+"</option>");
										
									});
									//alert($("#bookNameInput").val());
									$("#bookNameInput").text(text);
								}, "json");
							}
							
								loadType();
							
						});
			</script>
			<div class="col-md-3 header-right footer-bottom">
				<ul>

					<li><a href="/mall/user/userInfo.do" class="use1"><span>个人中心</span></a>



					</li>
					<li><a class="fb" href="#"></a></li>
					<li><a class="twi" href="#"></a></li>
					<li><a class="insta" href="#"></a></li>
					<li><a class="you" href="#"></a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //header-bot -->
	<!-- banner -->
	<div class="ban-top">
		<div class="container">
			<div class="top_nav_left">
				<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu--shylock"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav menu__list">
							<li class="active menu__item menu__item--current"><a
								class="menu__link" href="/mall/index.do">首页 <span class="sr-only">(current)</span></a></li>
							<li class="dropdown menu__item"><a href="#"
								class="dropdown-toggle menu__link" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">文艺
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="row">
										<div class="col-sm-6 multi-gd-img1 multi-gd-text ">
											<a href="mens.html"><img src="<%=path%>/images/woo1.jpg"
												alt=" " /></a>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="mens.html">小说文学</a></li>
												<li><a href="mens.html">传记</a></li>
												<li><a href="mens.html">青春文学</a></li>
												<li><a href="mens.html">动漫/幽默</a></li>
												<li><a href="mens.html">Accessories</a></li>
												<li><a href="mens.html">艺术</a></li>
												<li><a href="mens.html">摄影</a></li>
											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="mens.html">偶像明星</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul></li>
							<li class="dropdown menu__item"><a href="#"
								class="dropdown-toggle menu__link" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">人文社科
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="row">
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">哲学宗教</a></li>
												<li><a href="womens.html">历史政治</a></li>
												<li><a href="womens.html">历史军事文化</a></li>
												<li><a href="womens.html">社会科学</a></li>
												<li><a href="womens.html">心理学</a></li>
												<li><a href="womens.html">古籍</a></li>
												<li><a href="womens.html">法律& Hats</a></li>
											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">经济</a></li>
											</ul>
										</div>
										<div class="col-sm-6 multi-gd-img multi-gd-text ">
											<a href="womens.html"><img src="<%=path%>/images/woo.jpg"
												alt=" " /></a>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul></li>
							<li class="dropdown menu__item"><a href="#"
								class="dropdown-toggle menu__link" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">童书
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="row">
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">0-2岁</a></li>
												<li><a href="womens.html">3-6岁</a></li>
												<li><a href="womens.html">7-10岁</a></li>
												<li><a href="womens.html">11-14岁</a></li>
												<li><a href="womens.html">中国儿童文学</a></li>
												<li><a href="womens.html">外国儿童文学</a></li>
												<li><a href="womens.html">精装图画书</a></li>
											</ul>
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">平装图画书</a></li>
											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">科普/百科婴儿读物</a></li>
											</ul>
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">幼儿启蒙</a></li>
											</ul>
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">益智游戏</a></li>
											</ul>
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">玩具书</a></li>
											</ul>
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">动漫卡通</a></li>
											</ul>
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">少儿英语</a></li>
											</ul>
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">进口儿童书</a></li>
											</ul>
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">少年期刊</a></li>
											</ul>
										</div>
										<div class="col-sm-6 multi-gd-img multi-gd-text ">
											<a href="womens.html"><img src="<%=path%>/images/woo.jpg"
												alt=" " /></a>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul></li>
							<li class="dropdown menu__item"><a href="#"
								class="dropdown-toggle menu__link" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">经管
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="row">
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">经济</a></li>
												<li><a href="womens.html">管理</a></li>
												<li><a href="womens.html">投资理财</a></li>
												<li><a href="womens.html">股票</a></li>
												<li><a href="womens.html">金融市场</a></li>
												<li><a href="womens.html">销售会计</a></li>
											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">互联网</a></li>
											</ul>
										</div>
										<div class="col-sm-6 multi-gd-img multi-gd-text ">
											<a href="womens.html"><img src="<%=path%>/images/woo.jpg"
												alt=" " /></a>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul></li>
							<li class="dropdown menu__item"><a href="#"
								class="dropdown-toggle menu__link" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">教育<span
									class="caret"></span></a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="row">
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">中小学教辅</a></li>
												<li><a href="womens.html">考试</a></li>
												<li><a href="womens.html">大中专教材</a></li>
												<li><a href="womens.html">外语工具书</a></li>
												<li><a href="womens.html">教师用书</a></li>
												<li><a href="womens.html">新概念</a></li>
												<li><a href="womens.html">黄冈小状元</a></li>
											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">英语四级</a></li>
												<li><a href="womens.html">英语六级</a></li>
												<li><a href="womens.html">考研</a></li>
												<li><a href="womens.html">公务员</a></li>
											</ul>
										</div>
										<div class="col-sm-6 multi-gd-img multi-gd-text ">
											<a href="womens.html"><img src="<%=path%>/images/woo.jpg"
												alt=" " /></a>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul></li>
							<li class="dropdown menu__item"><a href="#"
								class="dropdown-toggle menu__link" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">励志
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="row">
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">励志/成功</a></li>
												<li><a href="womens.html">心灵修养</a></li>
												<li><a href="womens.html">职场</a></li>

											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">

											</ul>
										</div>
										<div class="col-sm-6 multi-gd-img multi-gd-text ">
											<a href="womens.html"><img src="<%=path%>/images/woo.jpg"
												alt=" " /></a>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul></li>
							<li class="dropdown menu__item"><a href="#"
								class="dropdown-toggle menu__link" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">科技
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="row">
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">科普读物</a></li>
												<li><a href="womens.html">计算机/网络</a></li>
												<li><a href="womens.html">医学</a></li>
												<li><a href="womens.html">工业技术</a></li>
												<li><a href="womens.html">建筑</a></li>
												<li><a href="womens.html">自然科学</a></li>
												<li><a href="womens.html">农业/林业</a></li>
											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
											</ul>
										</div>
										<div class="col-sm-6 multi-gd-img multi-gd-text ">
											<a href="womens.html"><img src="<%=path%>/images/woo.jpg"
												alt=" " /></a>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul></li>
							<li class="dropdown menu__item"><a href="#"
								class="dropdown-toggle menu__link" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">生活
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="row">
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">两性</a></li>
												<li><a href="womens.html">孕期</a></li>
												<li><a href="womens.html">亲子家教</a></li>
												<li><a href="womens.html">保健</a></li>
												<li><a href="womens.html">运动</a></li>
												<li><a href="womens.html">休闲</a></li>
												<li><a href="womens.html">旅游</a></li>
											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="womens.html">美食</a></li>
												<li><a href="womens.html">美妆</a></li>
												<li><a href="womens.html">手工DIY</a></li>
												<li><a href="womens.html">家庭家居</a></li>
												<li><a href="womens.html">风水占卜</a></li>
											</ul>
										</div>
										<div class="col-sm-6 multi-gd-img multi-gd-text ">
											<a href="womens.html"><img src="<%=path%>/images/woo.jpg"
												alt=" " /></a>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul></li>
						</ul>
					</div>
				</div>
				</nav>
			</div>
			<div class="top_nav_right">
				<div class="cart box_1">
					<a href="/mall/shoppingCart/findHTML.do">
						 <h3>
							<div class="total">
								<i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
								<%--  <span class="simpleCart_total"></span> (<span
									id="simpleCart_quantity" class="simpleCart_quantity"></span>
								items)  --%>
							</div>

						</h3> 
					</a>
					<p>
						<a href="/mall/shoppingCart/findHTML.do?userId=${userId}&username=${username}" class="simpleCart_empty">购物车</a>
					</p>

				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</body>
</html>
