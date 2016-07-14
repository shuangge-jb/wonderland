<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<title>欢迎页</title>
</head>

<body>
<div style="height: 373px;background-color: #FFFAFA">
<div style="margin-left: 10px;">
<h3 style="color:#999999">

您好！尊敬的用户${username}，欢迎来到个人中心！<br>
<font>您的余额为：${balance } 元</font><br>
<font>您的积分为：${userScore } 分</font>

</h3>

</div>
</div>
</body>
</html>