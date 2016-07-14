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

<title>用户密码修改</title>

<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
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
	<div style="border:1px solid #CFCFCF">
		<h3 style="color:#FFFFFF;background-color: #FFA500">
		<span id="username">${username}</span>用户密码修改</h3>
		<br>
		<form name="p">
			<div class="contact-form2">
				<div class="form-group">
					<input class="form-control" placeholder="原密码" name="password"
						id="password" type="password" value="" /> <span id="password2tip"
						style="color: Red"></span>
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="新密码" name="password1"
						id="password1" type="password" value="" /> <span
						id="password1tip" style="color: Red"></span>
				</div>

				<div class="form-group">
					<input class="form-control" placeholder="重复密码" name="password2"
						id="password2" type="password" value="" /> <span
						id="password2tip" style="color: Red"></span>
				</div>
				<div align="right">
					<input
						style="background-color: #FDA30E;color:#FFFFFF;margin-right: 50px;margin-bottom: 10px"
						type="button" value="确定修改密码" onclick="check()" />
				</div>
				
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function check(){
		if($("#password1").val()!=$("#password2").val()){
			alert("两次输入的新密码不一致，请重新输入");
			window.location.href=window.location.href;
		}else if(!(/^[\w.]{6,20}$/).test($("#password2").val())){
		   
		    alert("*密码必须是6-20位的数字或字母或字符")
		}
		else{
		var p=$("#password").val();
		var p1=$("#password1").val();
		var username=$("#username").text();
		//alert("123"+username);
			$.post("/mall/user/changePassword.do?username="+username+"&password="+p+"&password1="+p1,
				function(data){
				alert(data)
				});
		}
		}
		</script>
</body>
</html>