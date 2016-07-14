<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	订单信息：${orderInfo. }
	<c:forEach var="bookNum" items="${bookNumSet }">

	价格：${bookNum.bookInfo.bookPrice }
	名字：${bookNum.bookInfo.bookName }
	数量：${bookNum.bookNum }
	</c:forEach>
</body>
</html>