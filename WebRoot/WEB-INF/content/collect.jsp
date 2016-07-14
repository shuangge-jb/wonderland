<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>collection</title>
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
<script type="text/javascript">
   function comfrimDelCollect(){
	   if(confirm("确定要移除收藏夹吗?"))
		   return true;
	   else return false;
    //return false;
   } 
  </script>
  </head> 
  <body>
    <div id="collection">
		<table class="timetable_sub">
			<thead>
				<tr>
					<th>商品名称</th>
					<th>商品价格</th>
					<th>操作</th>
					
				</tr>
			</thead>
			<c:forEach items="${listCollect}"  var="collectList" varStatus="cs">
			<tr class="rem1">
				<td class="invert">
				${collectList.bookName}</td>
				<td class="invert">${collectList.bookPrice}</td>
				<td class="invert">
					<h3 class="typ1 t-button">
						<a href="/mall/collect/deleteCollect.do?bookId=${collectList.id }&userId=${userId}" style="text-decoration :none;" onclick="return comfrimDelCollect();"> <span class="label label-warning">删除</span>
						</a>
					</h3>
					</td>
				
			</tr>
			</c:forEach>
		</table>
	</div>
  </body>
</html>
