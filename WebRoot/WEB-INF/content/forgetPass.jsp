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
<title>forgetPass</title>

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

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">输入密保答案</h3>
					</div>
					<div class="panel-body">
						<form role="form" action="toResetPassword.do" method="post" onsubmit="return checkAnswer()">
						
							<fieldset>
								<input  type="hidden" id="username" name="username" style="font-size:4em;"value="${username }">
								<span id="aswer" name="aswer" style="display:none;" value="${answer }">${answer }</span>
								<div class="form-group">
									<font size="4em">用户名：${username }</font>
								</div>

								<div class="form-group">
									<font size="4em">密保问题：${question}</font>
								</div>
								<div class="form-group">
									<input id="answer" class="form-control" placeholder="输入密保答案"
										name="answer" type="text"  value=""/> <font id="answerTips"
										color="red"></font>
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<button type="submit" class="btn btn-lg btn-success btn-block">确定提交</button>
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
		/* 	$("#nameTips").hide();
			$("#passwordTips").hide();
			$("#username").blur(function() {
				$("#nameTips").show();
				var name = $("#username").val();
				if (name.length == 0) {
					$("#nameTips").text("* 用户名不可以为空");
				} else {
					$.get("/mall/login/isUsernameExisted.do", {
						"username" : name
					}, function(result) {
						if (result == "false") {
							$("#nameTips").text("* 该用户不存在");
						} else {
							$("#nameTips").text("");
						}
					});
				}
			}); */
			$("#answerTips").hide();
			$("#answer").mouseleave(function() {
				$("#answerTips").show();
				var answer = $("#answer").val();
				var aswer=$("#aswer").text();
				if (answer!=aswer) {
					$("#answerTips").text("* 密保答案错误，请重新输入！");
				} else {
					
							$("#answerTips").text("√").css("color","green");
						}
					});
					
						});
		
		function checkAnswer()
		{
			if($("#answer").val()==null)
			{
				alert("请输入密保答案！");
				return false;
			}
			else
			{
				if($("#answer").val()!=$("#aswer").text())
				{
					alert("密保答案错误！请重新输入！");
					return false;
				}
				return true;
			}
		};
	</script>
</body>
</html>
