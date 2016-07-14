<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的评论</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pignose css -->
<link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
<!-- //pignose css -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='http://fonts.useso.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>
</head>

<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- //banner-top -->
	<!-- banner -->
	<div class="page-head">
		<div class="container"></div>
	</div>
	<!-- //banner -->
	<!-- check out -->
	<div class="checkout">
		<div class="container">
			<h3>我的订单</h3>
			<div class="table-responsive checkout-right animated wow slideInUp"
				data-wow-delay=".5s">
				<table class="timetable_sub">
					<thead>
						<tr>
							<th>书名</th>
							<th>评论内容</th>
							<th>评论的时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tr class="rem1">
						<td class="invert">《如何做一个很壮的小孩子》</td>
						<td class="invert">很棒！</td>
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
				</div>
				</div>
				
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- //footer -->
</body>
</html>
