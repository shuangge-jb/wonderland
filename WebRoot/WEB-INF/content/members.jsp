<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户管理</title>

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
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/jquery-ui.css">
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
<h3 class="tittle">用户管理</h3>
<div id="myorder">
		<table class="timetable_sub">
			<thead>
				<tr>					
					<th>用户id</th>	
					<th>用户名</th>									
					<th>查看用户基本信息</th>
					<th>查看用户的订单信息</th>
					<th>查看用户的收货地址信息</th>
					<th>查看用户的评论信息</th>
					<th>查看用户的收藏夹</th>
				</tr>
			</thead>
			<c:forEach items="${listUsers}" var="user" varStatus="vs">
			<tr class="rem1" id="${user.id}">
				<td class="invert">${user.id}</td>
				<td class="invert">${user.username}</td>				
				<td class="invert" >
					<h4 class="t-button">
						<a href="/mall/user/getUser.do?username=${user.username}"> <span class="label label-warning">用户详情</span>
						</a>
					</h4>
				</td>
				<td class="invert" >
					<h4 class="t-button">
						<a href="/mall/user/findOrdersByuserId.do?userId=${user.id}"> <span class="label label-warning"> 订单</span>
						</a>
					</h4>
				</td>
				<td class="invert" >
					<h4 class="t-button">
						<a href="/mall/address/getAddressList1.do?userId=${user.id}"> <span class="label label-warning">收货地址</span>
						</a>
					</h4>
				</td>
				<td class="invert" >
					<h4 class="t-button">
						<a href="/mall/review/selectcomment.do?username=${user.username}"> <span class="label label-warning">查看评论</span>
						</a>
					</h4>
				</td>
				<td class="invert" >
					<h4 class="t-button">
						<a href="/mall/collect/selectCollect3.do?userId=${user.id}"> <span class="label label-warning">查看收藏</span>
						</a>
					</h4>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>