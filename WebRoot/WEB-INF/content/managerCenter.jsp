<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理中心 </title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //for-mobile-apps -->
<link href="<%=path%>/css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" type="text/css" href="../css/jquery-ui.css">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
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


<div class="men-wear">
<h3 class="tittle" >欢迎您，管理员先生！</h3>
<jsp:include page="login_inf.jsp"></jsp:include>
<h3 class="tittle" style="margin-right:50px">后台管理</h3>
	<div class="container">
		<div class="col-md-4 products-left">
		<div class="css-treeview">
		<ul class="tree-list-pad">
			<li><input type="checkbox" id="item-0" checked="checked" /><label
							for="item-0"><span><b>管理中心</b></span></label>
					<ul>
						<li><a href="/mall/bookManager.do" target="whx">商品管理</a></li>
						
						<li><a href="/mall/orderManager.do" target="whx" >订单管理</a></li>
						<li><a href="/mall/SalesSta/selectSalesStastics.do" >销售量查询</a></li>
						
						<li><a href="/mall/user/findAllUsers.do" target="whx">会员管理</a></li>
					</ul>
			</li>
		</ul>
		
		</div>
		</div>
			<div class="col-md-8 products-right">
			<iframe name="whx" scrolling="auto" marginwidth="0" marginheight="0" frameborder="0" width="100%" height="100%">
            </iframe>
        </div>
</div>
</div>

<!-- mens -->
<script>

</script>
</body>
</html>