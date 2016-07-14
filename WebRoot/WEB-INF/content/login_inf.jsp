<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>login_inf</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div class="header">
		<div class="container">
			 <ul>
				<li><span > </span> </li>
				<li><span ></span></li>
				<li><span ></span>
				<c:choose>
				<c:when test="${username == null }">
				请先<a href="/mall/regist" style="color: #000000">&nbsp;注册</a>或<a href="/mall/login" style="color: #000000">&nbsp;登录</a>！
				</c:when>
				<c:otherwise>
				userId:<span id="userId" >${userId}</span><br>
				username:${username }<br>
				欢迎你！<c:out value="${username}"/>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="/mall/login/logout.do" style="color: #000000">安全退出</a>
				</c:otherwise>
				</c:choose>
				</li>
			</ul>
		</div>
	</div>
  </body>
</html>
