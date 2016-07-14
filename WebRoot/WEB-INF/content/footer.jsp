<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<!-- footer -->
<div class="footer">
	<div class="container">
		<div class="col-md-3 footer-left">
			<h2><a href="index.html"><img src="<%=path %>/images/logo3.jpg" alt=" " /></a></h2>
			<p>我们的商城将竭诚为您服务，在这里，您可以找到最新，最齐全，最实惠的图书，祝您购物愉快！</p>
		</div>
		<div class="col-md-9 footer-right">
			<div class="col-sm-6 newsleft">
				<h4>小提示：登陆才能添加商品到购物车哦 !</h4>
			</div>
			
			<div class="clearfix"></div>
			<div class="sign-grds">
				<div class="col-md-4 sign-gd">
					<h4>链接：</h4>
					<ul>
						<li><a href="/mall/login">登录</a></li>
						<li><a href="/mall/regist">注册</a></li>
						<li><a href="/mall/index.do">首页</a></li>
						<li><a href="/mall/shoppingCart/findHTML.do?userId=${userId}&username=${username}">购物车</a></li>
						<li><a href="/mall/user/userInfo.do">个人中心</a></li>						
					</ul>
				</div>
				
				<div class="col-md-4 sign-gd-two">
					<h4>请联系我们！</h4>
					<ul>
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>广东省广州大学城华南理工大学c10楼 </li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Email : 1489492211@qq.com</li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>Phone : 18811111111</li>
					</ul>
				</div>
				<div class="col-md-4 sign-gd flickr-post">
					<h4></h4>
					<ul>
						<li><img src="<%=path %>/images/b15.jpg" alt=" " class="img-responsive" /></li>
						<li><img src="<%=path %>/images/b16.jpg" alt=" " class="img-responsive" /></li>
						<li><img src="<%=path %>/images/b17.jpg" alt=" " class="img-responsive" /></li>
						<li><img src="<%=path %>/images/b18.jpg" alt=" " class="img-responsive" /></li>
						<li><img src="<%=path %>/images/b15.jpg" alt=" " class="img-responsive" /></li>
						<li><img src="<%=path %>/images/b16.jpg" alt=" " class="img-responsive" /></li>
						<li><img src="<%=path %>/images/b17.jpg" alt=" " class="img-responsive" /></li>
						<li><img src="<%=path %>/images/b18.jpg" alt=" " class="img-responsive" /></li>
						<li><img src="<%=path %>/images/b15.jpg" alt=" " class="img-responsive" /></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="clearfix"></div>
		<p class="copy-right">Copyright &copy; 2016.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
	</div>
</div>
<!-- //footer -->
</body>
</html>