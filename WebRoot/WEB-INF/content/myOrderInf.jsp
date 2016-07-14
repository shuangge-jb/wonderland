<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>myOrderInf.jsp</title>
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
	<div style="border:1px solid #CFCFCF" >
	<h3 style="color:#FFFFFF;background-color: #FFA500 ">配送信息:</h3>
		<div class="bs-docs-example" >
			
			<table class="table table-striped" >
				<tr>
					<td>订单号：${orderInfo.id }</td>
					<td>客户号：${orderInfo.userId }</td>
					<td>下单时间：${orderInfo.pubTime}</td>
				</tr>
				<tr>
					<td>订单金额：${price}</td>
					<td id="status">订单状态：${orderInfo.status}</td>
					<td>收货人：${orderInfo.address.getPerson }</td>
				</tr>
				<tr>
					<td>收货人地址：${orderInfo.address.getAddress}</td>
					<td>收货人手机：${orderInfo.address.tel}</td>
					<td>邮编：${orderInfo.address.postcode}</td>
				</tr>
			</table>
		</div>
		<h3 style="color:#FFFFFF;background-color: #FFA500 ">商品信息:</h3>
		<div class="bs-docs-example" >			
			<table class="table table-striped" id="mytable">
				<thead>
               		 <tr>
                  		 <th>id</th>
                 		 <th>商品名称</th>
                 		 <th>单价</th>
                 		 <th>数量</th>
                 		 <th>小计</th>
                 		 <th>操作</th>
               		 </tr>
             	</thead>
				<tbody>
				<c:forEach var="bookNum" items="${bookNumSet}" varStatus="vs">
				<tr>
					<td>${vs.count}</td>
					<td>${bookNum.bookInfo.bookName }</td>
					<td><span id="bookPrice">${bookNum.bookInfo.bookPrice }</span></td>
					<td><span id="bookNum">${bookNum.bookNum }</span></td>
					<td><span id="price">${bookNum.bookInfo.bookPrice*bookNum.bookNum}</span></td>
					<td class="invert" id="operation">
					<h4 class="t-button">
						<a href="/mall/review/orderToComment.do?bookId=${bookNum.bookInfo.id}&userId=${userId}&bookName=${bookNum.bookInfo.bookName}&username=${username}&id=${orderInfo.id}"> <span class="label label-warning">评价</span>
						</a>
					</h4>
				</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>	
		
	</div>
	<div >
			<a href="/mall/orderInfo/getOrderInfoList.do?userId=${userId }"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>返回上一页</a>
		</div>
	<script type="text/javascript">
	$(function(){
		var str=$('#status').text();
		var status=str.substr(str.length-1,1);
		if(status=="0"){
			var a=$('#mytable a');
			for(var i=0;i<a.length;i++){
				a.eq(i).hide();
			}
			$('#status').text("订单状态：未付款");
		}else if(status=="1"){
			var a=$('#mytable a');
			for(var i=0;i<a.length;i++){
				a.eq(i).hide();
			}
			$('#status').text("订单状态：已付款未发货");
		}else if(status=="2"){
			var a=$('#mytable a');
			for(var i=0;i<a.length;i++){
				a.eq(i).hide();
			}
			$('#status'+i).text("订单状态：已付款已发货未收货");
		}else if(status=="3"){
			
			$('#status').text("订单状态：已付款已发货已收货未评价");
		}else if(status=="4"){
			var a=$('#mytable a');
			for(var i=0;i<a.length;i++){
				a.eq(i).hide();
			}
			$('#status').text("订单状态：已评价");
		}
	});
		
	</script>
</body>
</html>
