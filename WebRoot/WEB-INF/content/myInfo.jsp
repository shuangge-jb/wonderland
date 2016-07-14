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
<style type="text/css">
.text_time {
	width: 207px;
	height: 35px;
	background: #ffffff;
	border: 1px solid #56da9e;
}
</style>

</head>

<body>

	<div style="border:1px solid #CDC9C9">
		<h3 style="color:#FFFFFF;background-color: #FFA500 ">我的基本信息</h3>
		<br>
		<div class="contact-form2">

			<form action="/mall/user/changeUserInfo.do" method="post" onsubmit="return checkAll();"
				enctype="multipart/form-data">
		
				<input id="id" type="hidden" name="username" value=${username }>
				<span style="display:inline-block;width:110px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别:</span>
				<label><input name="sex" type="radio" value="1" checked="checked"
					${userInfo.sex=="1"?"checked":""}  />男</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label><input name="sex" type="radio" value="0"
					${userInfo.sex=="0"?"checked":""} />女</label>
				<span style="color:Red" id="mysex"></span>	
					<br/> <br/>
				<span style="display:inline-block;width:110px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;email:</span>
				<input type="text" name="email" id="email" value="${userInfo.email}"
					onblur="checkEmail()" /> 
				<span style="color:Red" id="myemail"></span>
					<br/><br/> 
				<span style="display:inline-block;width:110px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系电话:</span>
				<input id="tel" type="text" name="tel" value="${userInfo.tel}" onblur="checkTel()" 
					 /> 
				<span style="color:Red" id="mytel"></span>
					<br/><br/>
				<span style="display:inline-block;width:110px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密保问题:</span>
				<input id="question" type="text" name="question" value="${userInfo.question}" onblur="checkQuestion()" 
					 /> 
				<span style="color:Red" id="myquestion"></span>
					<br/><br/>
				<span style="display:inline-block;width:110px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密保答案:</span>
				<input id="answer" type="text" name="answer" value="${userInfo.answer}" onblur="checkAnswer()" 
					 />
				<span style="color:Red" id="myanswer"></span>
					<br/><br />
				<%-- <span style="display:inline-block;width:110px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;支付密码:</span>
				<input id="buyPassword" disabled="true" type="text" name="buyPassword" value="${userInfo.buyPassword}"
					 /> 
				<span style="color:Red" id="mybuyPassword"></span>
					<br/><br/> --%>
				<div align="right">
					<span id="tip" style="color:Green"></span><input type="submit" value="修改"
						style="margin-right: 150px;margin-bottom: 30px" />
				</div>
				<div><font color=red>${tip1}</font></div>
			</form>

		</div>
	</div>
	<script>
		  function checkTel()
		  {
			var reg=/^0?1[3|4|5|8][0-9]\d{8}$/; 
			if(document.getElementById("tel").value=="")
			{
				document.getElementById("mytel").innerHTML="*联系电话不能为空！";
				return false;
			}
			else
			{
				
				if(!(reg.test(document.getElementById("tel").value)))
				{           
					
					document.getElementById("mytel").innerHTML="*不是正确的11位的电话号码!";  
					return false;           
				}else
				{ 
		         	document.getElementById("mytel").innerHTML="√";
				}
			}
			}
		function checkEmail()
		{
			 var b=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
			var email=document.getElementById("email").value; 
			if(document.getElementById("email").value=="")
			{
				 document.getElementById("myemail").innerHTML="*email不能为空！";
				 return false;
			}
			else
			{
				if(!(b.test(email)))
				{
					document.getElementById("myemail").innerHTML="*请输入正确的email";
					return false;
				}
				else
				{
					document.getElementById("myemail").innerHTML="√";
				}
			}
			}
			function checkQuestion()
			{
			if(document.getElementById("question").value=="")
			{
				document.getElementById("myquestion").innerHTML="*请设置密保问题！";
				return false;
			}
			else
			{
				document.getElementById("myquestion").innerHTML="√";
			}
			}
			function checkAnswer()
			{
			if(document.getElementById("answer").value=="")
			{
				document.getElementById("myanswer").innerHTML="*密保答案不能为空！";
				return false;
			}
			else
			{
				document.getElementById("myanswer").innerHTML="√";
				return true;
			}     
			}  
			 
		
		function checkAll()
		{
			var reg=/^0?1[3|4|5|8][0-9]\d{8}$/; 
			if(document.getElementById("tel").value=="")
			{
				document.getElementById("mytel").innerHTML="*联系电话不能为空！";
				return false;
			}
			else
			{
				
				if(!(reg.test(document.getElementById("tel").value)))
				{           
					
					document.getElementById("mytel").innerHTML="*不是正确的11位的电话号码!";  
					return false;           
				}else
				{ 
		         	document.getElementById("mytel").innerHTML="√";
				}
			}
			
			var b=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
			var email=document.getElementById("email").value; 
			if(document.getElementById("email").value=="")
			{
				 document.getElementById("myemail").innerHTML="*email不能为空！";
				 return false;
			}
			else
			{
				if(!(b.test(email)))
				{
					document.getElementById("myemail").innerHTML="*请输入正确的email";
					return false;
				}
				else
				{
					document.getElementById("myemail").innerHTML="√";
				}
			}
			//验证密保问题
			if(document.getElementById("question").value=="")
			{
				document.getElementById("myquestion").innerHTML="*请设置密保问题！";
				return false;
			}
			else
			{
				document.getElementById("myquestion").innerHTML="√";
			}
			//验证密保答案
			if(document.getElementById("answer").value=="")
			{
				document.getElementById("myanswer").innerHTML="*密保答案不能为空！";
				return false;
			}
			else
			{
				document.getElementById("myanswer").innerHTML="√";
				return true;
			}     
		if ($("#myemail").text() != "√") {
				return false;
			} else if ($("#mytel").text() != "√") {
				return false;
			} else if ($("#myquestion").text() != "√") {
				return false;
			} else if ($("#myanswer").text() != "√") {
				return false;
			} /* else if($("#mysex").text()!="√"){
				return false;
			} */
			else
				return true;
		}
	</script>
</body>

</html>
