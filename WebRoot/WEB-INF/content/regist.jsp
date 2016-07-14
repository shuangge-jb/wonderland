<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>regist</title>
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
<%-- <script src="<%=path%>/js/jquery-2.1.4.min.js"></script> --%>
<!-- Bootstrap Core JavaScript -->
<script src="<%=path%>/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=path%>/js/metisMenu.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=path%>/js/sb-admin-2.js"></script>
 <script type="text/javascript"> 
	function regist()
	{
	   if($("#nametip").text()!="√"){
	   return false;
	   }
	   else  if($("#emailtip").text()!="√"){
	   return false;
	   }
	   else  if($("#password1tip").text()!="√"){
	   return false;
	   }
	    else  if($("#password2tip").text()!="√"){
	   return false;
	   }
	   else  if($("#payPassword1tip").text()!="√"){
	   return false;
	   }
	    else  if($("#payPassword2tip").text()!="√"){
	   return false;
	   }
	    else  if($("#questiontip").text()!="√"){
	   return false;
	   }
	    else  if($("#answertip").text()!="√"){
	   return false;
	   }
	   else
	   
	   return true;
	 }

			
</script> -->
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title" >注册 <font color=red size=1>(*填完所有信息才能成功注册)</font></h3>
					</div>
					<div class="panel-body">
						<form role="form" action="/mall/regist/regist.do" method="post" onsubmit="return regist();">
							<fieldset>  
							   <font color=red>${Tip } </font> 
								<!-- <span id="name" style="color: Red"></span> -->
								<div class="form-group">
									<input class="form-control" placeholder="用户名" name="username" id="username"
										type="text"  autofocus/><font id="nametip" color="red"></font>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Email" name="email" id="email"
										type="text" value="" />
												<span id="emailtip" style="color: Red"></span>
								</div>
								
								<div class="form-group">
									<input class="form-control" placeholder="登录密码" name="password1"  id="password1"
										type="password" value="" />
										<span id="password1tip" style="color:Red"></span>
								</div>
								
								<div class="form-group">
									<input class="form-control" placeholder="重复登录密码" name="password2" id="password2"
										type="password" value="" />
										<span id="password2tip" style="color:Red"></span>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="支付密码" name="payPassword1" id="payPassword1"
										type="password" value="" />
										<span id="payPassword1tip" style="color:Red"></span>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="重复支付密码" name="payPassword2" id="payPassword2"
										type="password" value="" />
										<span id="payPassword2tip" style="color:Red"></span>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="设置密保问题 如我的生日？" name="question" id="question"
										type="text" value="" />
										<span id="questiontip" style="color:Red"></span>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="密保答案" name="answer" id="answer"
										type="text" value=""  />
										<span id="answertip" style="color:Red"></span>
								</div>								
								
								<!-- Change this to a button or input when using this as a form -->
								<button type="submit" class="btn btn-lg btn-success btn-block">注册</button>
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
			$("#username").blur(function() {
			$("#nametip").show();	 
					$.post("/mall/regist/isUserNameExist.do", {
						"username" : $("#username").val()
					}, function(tip) {
					if(!tip){
							$("#nametip").text("√").css("color","green"); 
					}
					else {
					$("#nametip").text(tip).css("color","red");
			}
					});
			});
			$("#email").blur(function(){
			$("#emailtip").show();
			$.post("/mall/regist/isEmailCorrect.do",{
			    "email":$("#email").val()
			    },function(tipe){
			      if(!tipe){
			      $("#emailtip").text("√").css("color","green"); 
			      }else{
			       $("#emailtip").text(tipe).css("color","red");
			       }
			    });
			})
			$("#password1").blur(function(){
			$("#password1tip").show();
			$.post("/mall/regist/isPasswordFormatCorrect.do",{
			"password1":$("#password1").val()
			},function(tipp1){
			if(!tipp1){
			 $("#password1tip").text("√").css("color","green");
			}
			else{
			$("#password1tip").text(tipp1).css("color","red");	
			}
			});
			})
			$("#payPassword1").blur(function(){
			$("#payPassword1tip").show();
			$.post("/mall/regist/isPayPasswordRight.do",{
			    "payPassword1":$("#payPassword1").val()
			    },function(tippay1){
			      if(!tippay1){
			      $("#payPassword1tip").text("√").css("color","green"); 
			      }else{
			       $("#payPassword1tip").text(tippay1).css("color","red");
			       }
			    });
			})
			$("#payPassword2").blur(function(){
			$("#payPassword2tip").show();
			$.post("/mall/regist/isTwoPayPasswordSame.do",{
			    "payPassword2":$("#payPassword2").val(),
			    "payPassword1":$("#payPassword1").val()
			    },function(tippay2){
			      if(!tippay2){
			      $("#payPassword2tip").text("√").css("color","green"); 
			      }else{
			       $("#payPassword2tip").text(tippay2).css("color","red");
			       }
			    });
			})
			$("#question").blur(function(){
			$("#questiontip").show();
			$.post("/mall/regist/isQuestionCorrect.do",{
			    "question":$("#question").val()
			    },function(tippq){
			      if(!tippq){
			      $("#questiontip").text("√").css("color","green"); 
			      }else{
			       $("#questiontip").text(tippq).css("color","red");
			       }
			    });
			})
			$("#answer").mouseleave(function(){
			$("#answertip").show();
			$.post("/mall/regist/isAnswerCorrect.do",{
			    "answer":$("#answer").val()
			    },function(tippa){
			      if(!tippa){
			      $("#answertip").text("√").css("color","green"); 
			      }else{
			       $("#answertip").text(tippa).css("color","red");
			       }
			    });
			})
			$("#password2").blur(function(){
			$("#password2tip").show();
			$.post("/mall/regist/isTwoPasswordSame.do",{
			"password2":$("#password2").val(),
			"password1":$("#password1").val()
			},function(tipp2){
			if(!tipp2){
			 $("#password2tip").text("√").css("color","green");
			}
			else{
			$("#password2tip").text(tipp2).css("color","red");	
			}
			});
			})
			});
			</script>
</body>
</html>
