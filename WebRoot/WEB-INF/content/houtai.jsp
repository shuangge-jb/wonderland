<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>personal</title>
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
	<jsp:include page="header.jsp"></jsp:include>
	<!-- mens -->
	<div class="men-wear">
		<div class="container">
			<div class="col-md-4 products-left">
				<div class="css-treeview">
					<ul class="tree-list-pad">
						<li><input type="checkbox" checked="checked" id="item-0" /><label
							for="item-0"><span><b>管理中心</b></span></label></li>
						<li><input type="checkbox" id="item-1" checked="checked" /><label
							for="item-1"><span><b>商品管理</b></span></label>
								<ul>
										<li><a href="#" onclick="ordershow()">我的订单</a></li>
										<li><a href="#">收货地址</a></li>
										<li><a href="#" onclick="reviewshow()">我的评论</a></li>
										<li><a href="#">我的收藏</a></li>
								</ul>
						</li>
						<li><input type="checkbox" checked="checked" id="item-2" /><label
							for="item-2"><span><b>商品目录管理</b></span></label>
								<ul>
										<li><a href="#" onclick="welcome()">欢迎页</a></li>
										<li><a href="#">用户信息修改</a></li>
										<li><a href="#">用户密码修改</a></li>
								</ul>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-8 products-right">
				<div id="review">
					<table class="timetable_sub">
						<thead>
							<tr>
								<th>书名</th>
								<th>评论内容</th>
								<th>评论时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tr class="rem1">
							<td class="invert">《钢铁是怎么炼成的》</td>
							<td class="invert">很不错哟</td>
							<td class="invert">2016-06-12 8:30</td>
							<td class="invert">
								<h1 class="t-button">
									<a href="#"> <span class="label label-warning">删除</span>
									</a>
								</h1>
							</td>
						</tr>
					</table>
				</div>
				<div id="order">
					<table class="timetable_sub">
						<thead>
							<tr>
								<th>订单id</th>
								<th>评论内容</th>
								<th>评论时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tr class="rem1">
							<td class="invert">23121</td>
							<td class="invert">很不错哟</td>
							<td class="invert">2016-06-12 8:30</td>
							<td class="invert">
								<h1 class="t-button">
									<a href="#"> <span class="label label-warning">删除</span>
									</a>
								</h1>
							</td>
						</tr>
					</table>
				</div>
				<div id="collection">
					
				</div>
				<div id="welcome">
					<p align="center">欢迎来到个人中心</p>
				</div>
				<div id="address">
				
				</div>
			</div>
		</div>
	</div>
	<!-- //mens -->
	<script>
	$(document).ready(function(){
		$('#review').hide();
		$('#order').hide();
	});
	function reviewshow()
	{
		$('#welcome').hide();
		$('#order').hide();
		$('#review').show();
	}
	function ordershow()
	{
		$('#welcome').hide();
		$('#review').hide();
		$('#order').show();
	}
	function welcome()
	{
		$('#order').hide();
		$('#review').hide();
		$('#welcome').show();
	}
	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
