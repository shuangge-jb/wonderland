<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>login</title>

<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
	<!-- login -->

	<div class="modal-body modal-spa">
		<div class="login-grids">
			<div class="login">
				<div class="login-bottom">
					<h3>免费注册</h3>
					<form>
						<div class="sign-up">
							<h4>用户名:</h4>
							<input type="text" value="Type here" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Type here';}"
								required="">
						</div>
						<div class="sign-up">
							<h4>密码:</h4>
							<input type="password" value="Password"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Password';}"
								required="">

						</div>
						<div class="sign-up">
							<h4>重复密码 :</h4>
							<input type="password" value="Password"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Password';}"
								required="">

						</div>
						<div class="sign-up">
							<input type="submit" value="立即注册">
						</div>

					</form>
				</div>
				<div class="login-right">
					<h3>已有账号登陆</h3>
					<form action="/mall/login/login.do" method="post">
						<div class="sign-in">
							<h4>用户名:</h4>
							<input type="text" value="Type here" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Type here';}"
								required="" name="username">
						</div>
						<div class="sign-in">
							<h4>密码 :</h4>
							<input type="password" value="Password"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Password';}"
								required="" name="password"> <a href="#">忘记密码?</a>
						</div>
						<div class="single-bottom">
							<input type="checkbox" id="brand" value=""> <label
								for="brand"><span></span>记住我.</label>
						</div>
						<div class="sign-in">
							<input type="submit" value="登录">
						</div>
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
			<br/>
			<br/>
			<br/>
			<br/>
			<p>
				By logging in you agree to our <a href="#">Terms and Conditions</a>
				and <a href="#">Privacy Policy</a>
			</p>
		</div>
	</div>
	</div>
</body>
</html>
