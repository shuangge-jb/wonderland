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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title>订单查询结果</title>
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
		<script type="text/javascript"
			src="<%=path%>/js/bootstrap-3.1.1.min.js"></script>
		<!-- //for bootstrap working -->
		<link href='http://fonts.useso.com/css?family=Montserrat:400,700'
			rel='stylesheet' type='text/css'>
		<link
			href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
			rel='stylesheet' type='text/css'>
		<script src="<%=path%>/js/jquery.easing.min.js"></script>
	</head>
	<body>
		<h3 class="tittle">
			订单查询结果
		</h3>

		<div id="myorder">
			<table class="timetable_sub">
				<thead>
					<tr>
						<th>
							id
						</th>
						<th>
							下单时间
						</th>
						<th>
							订单状态
						</th>
						<th>
							操作
						</th>
						<input type="hidden" value="${fn:length(listOrder)}" id="len" />
					</tr>
				</thead>
				<c:forEach items="${listOrder}" var="orderInfo" varStatus="vs">
					<tr class="rem1" id="${orderInfo.id}">
						<td class="invert">
							${orderInfo.id}
						</td>
						<td class="invert">
							${orderInfo.pubTime }
						</td>
						<td class="invert" id="status${vs.index}">
							${orderInfo.status}
						</td>
						<td class="invert" id="operation${vs.index}">
							<h4 class="t-button">
								<a href="/mall/orderInfo/getOrderInfo1.do?id=${orderInfo.id}">
									<span class="label label-warning">查看详情</span> </a>
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
				var status=$('#status'+i).text();
				 if(status==1){
					$('#status'+i).text("已付款等待发货");
					var orderId=$('#status'+i).parent().attr('id');
					$('#operation'+i).append("<h4 class=\"t-button\"><a href=\"/mall/orderInfo/delivery.do?id="+orderId+"\"><span class=\"label label-warning\">订单发货</span></a></h4>");
				}else if(status==0){
					$('#status'+i).text("用户未付款");					
				}else if(status==2){
					$('#status'+i).text("已发货用户没确认收货");					
				}else if(status==3){
					$('#status'+i).text("用户已确认收货");					
				}else if(status==4){
					$('#status'+i).text("用户确认收货并评价了商品");					
				}	
			}
		});
	</script>
		
	</body>
</html>