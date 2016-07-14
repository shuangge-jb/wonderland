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
<title>resetPass</title>

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
						<h3 class="panel-title">重置密码</h3>
					</div>
					<div class="panel-body">
						<form role="form" action="saveNewPassword.do" method="post" onsubmit="return checkPass()">
							<fieldset>
								<input  type="hidden" id="username" name="username" value="${username }"/>
								<div class="form-group">
									<input id="password" class="form-control" placeholder="新密码"
										name="password" type="password" value="" /> <span id="passwordTips" style="color: Red"></span>
								</div>

								<div class="form-group">
									<input id="password2" class="form-control" placeholder="重复输入新密码"
										name="password2" type="password" value="" /> <font
										id="password2Tips" color="red"></font>
								</div>
								
								<!-- Change this to a button or input when using this as a form -->
								<button type="submit" class="btn btn-lg btn-success btn-block">提交</button>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function checkPass()
		{
			var c=/^.{6,20}$/;
			if($("#password").val()=="")
			{
				$("#passwordTips").text("*请输入新密码");
				return false;
			}
			else
			{
				if(!c.test($("#password").val()))
				{
					$("#passwordTips").text("*密码必须是6-20位的数字或字母或字符");
					return false;
				}
				else
				{
					$("#passwordTips").text("");
				}
			}
			
			if($("#password2").val()=="")
			{
				alert("请重复输入新密码！");
				return false;
			}
			if($("#password").val()!=$("#password2").val())
			{
				alert("两次输入密码不一样！");
				return false;
			}
			else 
			{
				return true;
			}
		};
		function regist()
	{
		var a=/^\w{4,12}$/;
		if(document.getElementById("username").value=="")
		{
			 document.getElementById("name").innerHTML="*请输入用户名,";
			 return false;
		}
		else
		{
			if(!(a.test(document.getElementById("username").value)))
			{
				document.getElementById("name").innerHTML="*用户名只能由4-12位数字或字母组成";
				return false;
			}
			else
			{
				document.getElementById("name").innerHTML=null;
			}
		}
		var b=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
		if(document.getElementById("useremail").value=="")
		{
			 document.getElementById("email").innerHTML="*请输入email";
			 return false;
		}
		else
		{
			if(!(b.test(document.getElementById("useremail").value)))
			{
				document.getElementById("email").innerHTML="*请输入正确的email";
				return false;
			}
			else
			{
				document.getElementById("email").innerHTML=null;
			}
		}
		var c=/^.{6,20}$/;
		if(document.getElementById("input1").value=="")
		{
			document.getElementById("password1").innerHTML="*请输入密码";
			return false;
		}
		else
		{
			if(!(c.test(document.getElementById("input1").value)))
			{
				document.getElementById("password1").innerHTML="*密码必须是6-20位的数字或字母或字符";
				return false;
			}
			else
			{
				document.getElementById("password1").innerHTML=null;
			}
		}
		if(document.getElementById("input2").value=="")
		{
			document.getElementById("password2").innerHTML="*请再输入一遍确认密码";
			return false;
		}
		else
		{
			if(document.getElementById("input1").value!=document.getElementById("input2").value)
			{
				document.getElementById("password2").innerHTML="*两次输入的密码不一致";
				return false;
			}
			else
			{
				return true;
			}
		}
		
	}
	</script>
</body>
</html>
