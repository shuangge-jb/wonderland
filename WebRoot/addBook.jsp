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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>  
  
<title>上传图片</title>  

<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="<%=path %>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pignose css -->
<link href="<%=path %>/css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
<!-- //pignose css -->
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="<%=path %>/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="<%=path %>/js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="<%=path %>/js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='http://fonts.useso.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
<script src="<%=path %>/js/jquery.easing.min.js"></script>
</head>  
<body>  
<h3 class="tittle">Contact Form</h3>
<div class="contact-form2">
<form action="/mall/saveBook.do" method="post" enctype="multipart/form-data">  
<input type="text" name="bookName" value="商品名称" onfocus="this.value = '';"
 				onblur="if (this.value == '') {this.value = '商品名称';}" />
				
 <input type="text" name="firstType" value="商品的一级目录" onfocus="this.value = '';"
 				onblur="if (this.value == '') {this.value = '商品的一级目录';}" />		
				
 <input type="text" name="secondType" value="商品的二级目录" onfocus="this.value = '';"
 				onblur="if (this.value == '') {this.value = '商品的二级目录';}" />	

<input type="text" name="bookPrice" value="商品价格" onfocus="this.value = '';" 
					onblur="if (this.value == '') {this.value = '商品价格';}" />
					<br/>
<input type="text" name="bookNumber" value="商品库存" onfocus="this.value = '';" 
					onblur="if (this.value == '') {this.value = '商品库存';}" />	
					
<textarea  onfocus="this.value = '';" onblur="if (this.value == '') 
				{this.value = '商品详情。。。';}" >商品详情。。。</textarea>		
<br>			
<input type="file" name="file" /> <input type="submit" value="添加" />
</form>
</div>
</body>  
</html> 