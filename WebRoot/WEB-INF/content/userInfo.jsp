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

<title>用户基本信息详情</title>

<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<style type="text/css">
.text_time {
	width: 207px;
	height: 35px;
	background: #ffffff;
	border: 1px solid #56da9e;
}
</style>
</head>
<body>
<div style="border:1px solid #CFCFCF" >
	<h3 style="color:#FFFFFF;background-color: #FFA500 ">${username}的基本信息 </h3>
		<div class="bs-docs-example" >
			
			<table class="table table-striped" >
				<tr>
					<td>用户id：${user.id }</td>
					<td>用户名：${user.username }</td>
					<td>性别：${user.sex==1?"男":"女"}</td>
				</tr>
				<tr>
					<td>邮箱：${user.email}</td>
					<td id="status">电话：${user.tel}</td>
					<td> </td>
				</tr>
				<tr>
					<td>账户金额：${user.balance}元</td>
					<td>用户积分:${user.userScore}</td>
					<td></td>
				</tr>				
			</table>
			</div>
		</div>
		
</body>
</html>