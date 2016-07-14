<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${addressList }" var="address" varStatus="vs">
		<tr>
			<td align="center">地址${vs.count }：</td>
			<td align="center">person:${address.getPerson }</td>
			<td align="center">address:${address.getAddress }</td>
			<td align="center">tel:${address.tel }</td>
			<td align="center">postcode：${address.postcode }</td>
		</tr>
		<a href="deleteAddress.do?id=${address.id}">delete</a>
		<a href="edit.do?id=${address.id}">update</a>
		<br>
	</c:forEach>
	<a href="edit.do">new_address</a>

</body>
</html>