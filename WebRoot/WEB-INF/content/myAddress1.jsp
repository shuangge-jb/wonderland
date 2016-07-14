<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>myAddress</title>
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
	<div style="border:1px solid #CDC9C9">
		<h3 style="color:#FFFFFF;background-color: #FFA500 ">收货地址</h3>
		<input type="hidden" value="${fn:length(addressList)}" id="len"/>
		<c:forEach items="${addressList}" var="address" varStatus="vs">
			<div>
				<form  method="post" name="address" action="editAddress.do" id="${vs.index }">
					<input id="id" type="hidden" name="id" value=${address.id }>
					<div class="bs-docs-example" style="border-bottom:1px solid #CDC9C9">
						<table class="table table-striped">
							<tr>
								<%-- <td>id：${vs.count}</td> --%>
								
								<td>收货人：<input id="person" type="text" name="getPerson"
									value="${address.getPerson }"></td>
								<td>联系电话：<input id="tel" type="text" name="tel"
									value="${address.tel }"></td>
									<td>邮编：<input id="postcode" type="text" name="postcode"
									value="${address.postcode }"></td>
							</tr>
							<tr>
								<td>详细地址：<input id="address" type="text" name="getAddress" style="wideth:200px"
									value="${address.getAddress }" >
									</td>
									</tr>
						</table>
						
							<%-- <tr>
								
								<td>详细地址：<input id="address" type="text" name="getAddress"
									value="${address.getAddress }" disabled="true"></td> 
							 </tr> --%>
					
						<div align="right">
							<h4 class="t-button" style="margin-right:50px">

								<!--  <input type="submit" value="修改" style="width:50;height:20;">  -->
								 <a href="javascript:$('#${vs.index }').submit();" ><span class="label label-warning">修改</span></a>
								<a href="/mall/address/deleteAddress.do?id=${address.id}&userId=${userId}"><span
									class="label label-warning">删除</span></a>
							</h4>
						</div>
					</div>
				</form>
			</div>
		</c:forEach>
		
		
	</div>
	
</body>
</html>
