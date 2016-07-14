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
							for="item-0"><span><b>个人中心</b></span></label></li>
						<li><input type="checkbox" id="item-1" checked="checked" /><label
							for="item-1"><span><b>订单中心</b></span></label>
								<ul>
										<li><a href="/mall/orderInfo/getOrderInfoList.do?userId=${userId}" target="whx">我的订单</a></li>
										<li><a href="/mall/address/getAddressList.do?userId=${userId}" target="whx">收货地址</a></li>
										<li><a href="/mall/review/selectcomment.do?username=${username}" target="whx" >我的评论</a></li>
										<li><a href="/mall/collect/selectCollect.do?userId=${userId}" target="whx">我的收藏</a></li>
								</ul>
						</li>
						<li><input type="checkbox" checked="checked" id="item-2" /><label
							for="item-2"><span><b>用户中心</b></span></label>
								<ul>
										<li><a href="/mall/user/welcome.do?username=${username }" target="whx"">欢迎页</a></li>
										<li><a href="/mall/user/getUserInfo.do?username=${username}" target="whx">用户信息修改</a></li>
										<li><a href="/mall/user/pwChange.do" target="whx">用户密码修改</a></li>
										<li><a href="/mall/user//reCharge.do" target="whx">用户充值</a></li>
								</ul>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-8 products-right">
					<iframe name="whx" src="/mall/user/welcome.do?username=${username }" scrolling="auto" marginwidth="0" marginheight="0" frameborder="0" width="100%" height="100%">
                   </iframe>
                  
		
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
