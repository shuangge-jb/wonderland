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

<title>myInfo</title>

<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- //for-mobile-apps -->
<link href="<%=path%>/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<!-- pignose css -->
<link href="<%=path%>/css/pignose.layerslider.css" rel="stylesheet"
	type="text/css" media="all" />
<!-- //pignose css -->
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
	<h3 style="color: #EE9A00">你的评论</h3>
	<br>
	<div class="contact-form2">
		<form action="insertcomment.do" method="post" enctype="multipart/form-data">

			<input id="id" type="hidden" name="userId" value=${userId }>
			<input id="id1" type="hidden" name="bookId" value=${bookId }>
			<input id="id2" type="hidden" name="username" value=${username }>
			<span style="display:inline-block;width:90px;">商品名称:</span>
			<input type="text" name="bookname" disabled="true" value=${bookName } /> <br/> <br/>
			<span style="display:inline-block;width:90px;">评分:</span>
			<label><input name="score" type="radio" value="1" />*很不喜欢</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label><input name="score" type="radio" value="2" />**不喜欢</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label><input name="score" type="radio" value="3" />***一般</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label><input name="score" type="radio" value="4" />****喜欢</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label><input name="score" type="radio" value="5" checked/>*****很喜欢</label><br/> <br/>
			<span style="display:inline-block;width:90px;">评论内容:</span>
			<textarea  onfocus="this.value = '';" onblur="if (this.value == '') 
				{this.value = '请输入评论内容';}" name="reviewContent">写下你宝贵的评论。。。</textarea>
				<input name="id" value="${id}" type="hidden"/>
			<input type="submit" value="提交" />
		</form>
	</div>
	<div></div>
</body>
</html>
