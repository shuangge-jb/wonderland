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
<title>myorder</title>

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

	<div id="myorder">
	<h3 class="tittle" >我的订单</h3>
		<table class="timetable_sub">
			<thead>
				<tr>
					<th>id</th>
					<th>用户id</th>	
					<th>下单时间</th>									
					<th>订单状态</th>
					<th>操作</th>
					<input type="hidden" value="${fn:length(orderInfoList)}" id="len"/>
				</tr>
			</thead>
			<c:forEach items="${orderInfoList}" var="orderInfo" varStatus="vs">
			<tr class="rem1" id="${orderInfo.id}">
				<td class="invert">${orderInfo.id}</td>
				<td class="invert" id="userId">${orderInfo.userId}</td>
				<td class="invert">${orderInfo.pubTime }</td>
				<td class="invert" id="status${vs.index}">${orderInfo.status}</td>
				<td class="invert" id="operation${vs.index}">
					<h4 class="t-button">
						<a href="/mall/orderInfo/getOrderInfo.do?id=${orderInfo.id}"> <span class="label label-warning">查看详情</span>
						</a>
					</h4>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">
		$(function(){
			
			var len = $('#len').val();
			for(var i=0;i<len;i++){
				var str=$('#status'+i).text();
				var status=str.substr(str.length-1,1);
				if(status=="0"){
					$('#status'+i).text("未付款");
					var orderId=$('#status'+i).parent().attr('id');
					var userId=$('#userId').text();//added by gjb on 7.10
					$('#operation'+i).append("<h4 class=\"t-button\"><a id=\""+orderId+"@"+userId+"\" onclick=\"pay(this.id)\" href=\"#\"><span class=\"label label-warning\">确认付款</span></a></h4>");
				}else if(status=="1"){
					$('#status'+i).text("已付款未发货");
					var orderId=$('#status'+i).parent().attr('id');
					var userId=$('#userId').text();
				}else if(status=="2"){
					$('#status'+i).text("已付款已发货未收货");
					var orderId=$('#status'+i).parent().attr('id');
					$('#operation'+i).append("<h4 class=\"t-button\"><a href=\"/mall/orderInfo/receipt.do?id="+orderId+"\"><span class=\"label label-warning\">确认收货</span></a></h4>");
					
				}else if(status=="3"){
					$('#status'+i).text("已付款已发货已收货未评价");
					var orderId=$('#status'+i).parent().attr('id');
					var userId=$('#userId').text();
				}else if(status=="4"){
					$('#status'+i).text("已评价");
					var orderId=$('#status'+i).parent().attr('id');
				}
			}
		});
		
		function pay(id){
			var orderId=id.split("@")[0];
			var userId=id.split("@")[1];
			$.get("/mall/orderInfo/pay.do",{userId:userId,id:orderId},function(data){
				
				if(data=="0"){
					alert("支付成功");
					var userId=$('#userId').text();
					window.location.href="/mall/orderInfo/getOrderInfoList.do?userId="+userId;
				}else{
					if(data=="1"){			
						if(confirm("用户余额不足,请确认跳转充值页面")){
							window.location.href="/mall/user/reCharge.do";
						}
						
					}else{
					if(data=="2"){
						alert("您的订单中商品货存不足，请重新下单");
					}
					}
				}
			});
		}
	</script>
</body>
</html>
