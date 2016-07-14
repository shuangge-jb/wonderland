<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>结算</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<link href="<%=path%>/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="<%=path%>/css/pignose.layerslider.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="<%=path%>/js/jquery-2.1.4.min.js"></script>
<script src="<%=path%>/js/simpleCart.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/bootstrap-3.1.1.min.js"></script>
<link href='http://fonts.useso.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
<script src="<%=path%>/js/jquery.easing.min.js"></script>
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
	<span id="userId" type="button" style="display:none;">${userId }</span>
	<span id="username" type="button" style="display:none;">${username }</span>
	<div class="checkout">
		<div class="container">
			<h3>结算</h3>
			<div class="table-responsive checkout-right animated wow slideInUp"
				data-wow-delay=".5s">
				<table class="timetable_sub" id="shoppingcart">
					<thead>
						<tr>
							<th>商品名称</th>
							<th>数量</th>
							<th>订单总价</th>
							<th>小计</th>
						</tr>
					</thead>

				</table>
			</div>
			<br>
			<div class="row">
				<div class="col-lg-6">
					<div class="form-group" class="col-lg-6">
						<label>请选择收货地址:<span style="color:red">(*)</span></label> <select
							class="form-control" id="address">
							<option id="null"></option>
						</select>
					</div>
				</div>
			</div>
			<%-- <div class="col-lg-6">
				<div class="row">
					<div class="input-group" id="input">
						<span class="input-group-addon" id="sizing-addon2">请输入支付密码:<span
							style="color:red">(*)</span></span> <input type="password"
							class="form-control" id="pass" />
					</div>
				</div>
			</div> --%>
			<div class="checkout-right">
				<div class="checkout-right-basket animated wow slideInRight"
					data-wow-delay=".5s">
					<a style="cursor:default" id="money"></a>
				</div>
				<div class="checkout-right-basket animated wow slideInRight"
					data-wow-delay=".5s">
					<a href="/mall/user/userInfo.do?"><span
						class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>新增个人收货地址</a>
				</div>
				<div class="checkout-right-basket animated wow slideInRight"
					data-wow-delay=".5s">
					<a onclick="order()"><span
						class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>创建订单</a>
				</div>
			</div>

		</div>
	</div>

	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- //footer -->

	<script type="text/javascript">
		var l = 0;
		var userId = $("#userId").text();
		//alert("userId:"+userId);
		var username = $("#username").text();

		$(function() {

			$
					.get(
							"/mall/orderInfo/preOrder.do",//modified by gjb on 7.10
							{
								"userId" : userId
							},
							function(data) {
								var data2;
								var money = 0;
								//var str=data.parseJSON();
								eval("data2=" + data);
								l = data2.shopcar.length;
								//alert(data2.shopcar);
								$.each(data2.shopcar,function(i, item) {
													money = money+ item.bookPrice* item.number;
													var table = $('#shoppingcart');
													var row;
													row = $("<tr class=\"rem1\">");
													//row.append($("><td class=\"invert\">"+this.bookName+"</td>"));
													//$("<td class=\"invert\">"+(this.bookPrice*this.number)+"</td></tr>";
													row
															.append($("<td class=\"invert\">"
																	+ item.bookName
																	+ "</td>"));
													row
															.append($("<td class=\"invert\"><div class=\"quantity\"><div class=\"quantity-select\"><div class=\"entry value\"><span>"
																	+ this.number
																	+ "</span></div></div></td>"));
													row
															.append($("<td class=\"invert\">"
																	+ item.bookPrice
																	+ "</td>"));
													//row.append($("<td class=\"invert-closeb\"><div class=\"rem\"><div class=\"close1\"></div></div></td>"));
													row
															.append($("<td class=\"invert\">"
																	+ (item.bookPrice * item.number)
																	+ "</td>"));
													table.append(row);
												});
								$.each(data2.address, function(i, item) {
									var address = $('#address');
									var op;
									op = $("<option id=\""+item.id+"\">"
											+ item.getAddress + "</option>");
									address.append(op);
								});
								$('#money').html("总计：" + money);
								$('#pass').val("");
							});
		});
		/* $("#pass").blur(function() {
			isBuyPasswordCorrect();
		}); */
		function isBuyPasswordCorrect() {
			var buyPassword = $('#pass').val();
            var result=false;
			$.ajax({
				 type : "get",  
		          url : "/mall/user/isBuyPasswordCorrect.do",  
		          data : {
						"username" : username,
						"buyPassword" : buyPassword
					},  
		          async : false,  //ajax同步调用,否则无法改变外部变量result的值
		          success : function(data){  
		        	  //alert("isBuyPasswordCorrect result: " + (data == "true") );
						result=(data == "true");
		          }  
			});
            return result;
		}
		function order() {

			/* if ($('#pass').val() == "") {
				alert("请输入密码!");
				return null;
			}
			//alert(isBuyPasswordCorrect());
			if (!isBuyPasswordCorrect() ) {
				
				alert("您输入的密码有误!");
				return null;
			} */

			if (l == 0) {
				alert("购物车为空，无法提交订单");
				return null;
			}
			if ($('#address option:selected').attr("id") == "null") {
				alert("请选择收货地址");
				return null;
			}

			if (!confirm("请确认订单信息")) {
				$.get("/mall/orderInfo/unpay.do", {
					addressId : $('#address option:selected').attr("id"),
					userId : $('#userId').text()
				}, function(data) {
					alert("unpay: " + data);
				});
				return null;
			}

			$.get("/mall/orderInfo/order.do", {
				addressId : $('#address option:selected').attr("id"),
				userId : $('#userId').text()
			}, function(data) {
				if (data == "true") {
					alert("创建订单成功,即将跳转个人中心");
					window.location.href = "/mall/user/userInfo.do";
				} else {
					alert("因为网络问题，创建订单失败！");
				}
			});
		}
	</script>

</body>
</html>
