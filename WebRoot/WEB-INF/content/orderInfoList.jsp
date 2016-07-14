<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${orderInfoList }" var="orderInfo" varStatus="vs">
		<tr>
			<td>订单：${vs.count }</td>
			<td>用户ID：${orderInfo.userId }</td>
			<td>下单时间：${orderInfo.pubTime }</td>
			<td>发货时间：${orderInfo.sendTime }</td>
			<td>收货时间：${orderInfo.getTime }</td>
			<td>发货地址${orderInfo.sendAddress }</td>
			<td>状态：${orderInfo.status }</td>
		</tr>
		<form action="payOrder.do" method="post">
		<input type="hidden" name="id" value="${orderInfo.id }" >
		<input type="submit" value="付款">
		</form>
		<br>
	</c:forEach>
</body>
</html>