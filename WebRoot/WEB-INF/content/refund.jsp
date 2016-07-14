<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>退款页面</title>
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
	
	<h3 class="tittle" >退款页面</h3>
<div style="border:1px solid #CDC9C9">


		<br>
		<div class="contact-form2">

			<form action="/mall/user/changeUserInfo.do" method="post" onsubmit="return refund(this)"
				enctype="multipart/form-data">	
				为了我们能更好的为您服务，请告诉我们您的退款理由，谢谢您的合作！			
				<textarea  name="reason" onfocus="this.value = '';"
					 onblur="if (this.value == '') {this.value = '退款理由...';}" >退款理由。。。</textarea>						
				<br />
				<div align="right">
					<input type="submit" value="申请退款"  
						style="margin-right: 150px;margin-bottom: 30px" />
				</div>
			</form>

		</div>
	</div>
	<script>
	function refund(obj){
		alert("您的退款申请已经发送给商家，请等待商家退款。。。");
		return false;
	}
	</script>
</body>
</html>