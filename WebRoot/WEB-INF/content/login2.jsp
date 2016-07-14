<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>login</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<%=path%>/css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=path%>/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=path%>/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- jQuery -->
<script src="<%=path%>/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=path%>/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=path%>/js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=path%>/js/sb-admin-2.js"></script>

</head>
<script>
function isCorrect(){
	   if($("#nameTips").text()!="√"){
	   return false;
	   }
	   else  if($("#passwordTips").text()!="√"){
	   return false;
	   }
	   else return true;
	 }
	 
function checkUsername(){		
	if($("#username").val()==""){
		$("#nameTips").text("*先填写用户名");
		return false;
	}else{
		/* $("#nameTips").text(""); */
		$.post("/mall/login/isUsernameExisted.do", {
				"username" : $("#username").val()
			}, function(tip) {
				if (tip) {
					$("#nameTips").text("* 该用户不存在");
					return false;
				} else {
					$("#nameTips").text("√");
					var username=$("#username").val();
					window.location.href="/mall/login/toFindPassword.do?username="+username;
				}
			});
	}
};
</script>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">登录</h3>
					</div>
					<div class="panel-body">
						<form role="form" action="/mall/login/login.do" method="post" onsubmit="return isCorrect();">
							<fieldset>
								<div class="form-group">
									<input id="username" class="form-control" placeholder="用户名"
										name="username" type="text"  /> <font id="nameTips"
										></font>
								</div>

								<div class="form-group">
									<input id="password" class="form-control" placeholder="密码"
										name="password" type="password" value="" /> <font
										id="passwordTips" color="red"></font>
								</div>
								<div >
									<label><a href="javascript:checkUsername();" id="forget">?忘记密码</a>
									</label>
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<button type="submit" class="btn btn-lg btn-success btn-block">登录</button>
								<div class="checkout-right-basket animated wow slideInRight">
									<a href="/mall"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>返回首页</a>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	
	$(window).load(function() {
		
		
		
		
		
		$("#username").mouseleave(function() {
			$("#nameTips").show();	 
					$.post("/mall/login/isUsernameExisted.do", {
						"username" : $("#username").val()
					}, function(tip) {
					if(!tip){
							$("#nameTips").text("√").css("color","green"); 
					}
					else {
					$("#nameTips").text(tip).css("color","red");
			}
					});
			});
		
		$("#password").mouseleave(function(){
			$("#passwordTips").show();
			$.post("/mall/login/isPasswordCorrect.do",{
				"username" : $("#username").val(),
			"password":$("#password").val()
			},function(tipp1){
			if(!tipp1){
			 $("#passwordTips").text("√").css("color","green");
			}
			else{
			$("#passwordTips").text(tipp1).css("color","red");	
			}
			});
			});
	});
	</script>
</body>
</html>
