<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>www.whx.com</title>
<style type="text/css">
   #test ul{
   list-style:none;
   }
   #test1 ul{
   list-style:none;
   }
   #test li{
   float:left;
   padding:12px;
   color:#6A6C6F;
   }
    #test1 li{
   padding:12px;
   color:#6A6C6F;
   }
   #pay{
   background:#F06C0A;
   width:100px;
   height:40px;
   border-radius:8px;
   border:1px solid #F38031;
   color:#fff;
   font-size:18px;
   font-weight:bolder;
   }
</style>
<script type="text/javascript" src="<%=path%>/js/jquery-2.1.4.min.js"></script>
<script language="javascript">
function codefans(){ 
	var box=document.getElementById("tip"); 
	box.style.display="none"; 
	} 
	setTimeout("codefans()",2000);//2秒 
	function checkBalance(){
	 if($("#balancetip").text()!="√"){
	   return false;
	   }
	   else if($("#buyPasswordtip").text()!="√"){
	   return false;
	   }
	   else return true;
	}
</script>
<script type="text/javascript">
$(document).ready(function(){  
$("#tab1").show();
$(".hx1").css("color","#FF9100");
$("#tab4").hide();
  $(".hx1").click(function() { 
  $(".hx1").css("color","#FF9100");
  $(".hx2").css("color","#6A6C6F");
  $("#tab1").show();
  $("#tab4").hide();
  }); 
   $(".hx2").click(function() { 
   $(".hx2").css("color","#FF9100");
  $(".hx1").css("color","#6A6C6F");
  $("#tab1").hide();
  $("#tab4").show();
  }); 
});
</script>
</head>
<body>
<div style="border:1px solid #D2D2D2;">
<div id="chongzhi" style="border-bottom:1px solid #D2D2D2;height:63px;margin-top:-10px;">
    <div style="float:left;margin-top:5px;"><img src="/mall/images/rec.PNG" alt="whx" /></div> 
    <div id="test">
     <ul>
     <li>
                 充值中心
     </li>
      <li style="color:#FE7E00;">
                  账户充值
     </li>
     </ul>
     </div>
  </div>
  <div id="test1">
    <form action="/mall/user/chongZhi.do" onsubmit=" return checkBalance()">
     <ul>
     <li>
                 充值账户:
      <input type="text" name="username" id="username" value="${username}"   style="border-radius:5px;height:25px;border:2px solid #FFD0AE;" readOnly="true"/>
     </li>
     <li>
                充值金额： <input type="text" id="balance" name="balance"  style="border-radius:5px;height:25px;border:2px solid #FFD0AE;"/>元
                <span id="balancetip"></span>
     </li>
      <li>
                充值方式：<span class="hx1">储蓄卡</span>&nbsp;<span class="hx2">信用卡</span>
            <div id="tab1" class="tab_content" ><img src="/mall/images/xinyong.PNG" alt="whx" style="width:600px;"/></div>     
            <div id="tab4" class="tab_content"><img src="/mall/images/cunxu.PNG" alt="whx" style="width:600px;" /> </div>        
     </li>
      <li>
                输入支付密码： <input type="password" id="buyPassword" name="buyPassword"  style="border-radius:5px;height:25px;border:2px solid #FFD0AE;"/>
                <span id="buyPasswordtip"></span>
     </li>
     <li>
     <input type="submit" value="立即支付" id="pay"/><div id="tip"><font color=red>${tip}</font></div>
     </li>
     </ul>
  </form>
  </div>
  </div>
  <script type="text/javascript">
	$(window).load(function() {
			$("#balance").blur(function() {
			$("#balancetip").show();	 
					$.post("/mall/user/isBalanceCorrect.do", {
						"balance" : $("#balance").val()
					}, function(tipb) {
					if(!tipb){
							$("#balancetip").text("√").css("color","green"); 
					}
					else {
					$("#balancetip").text(tipb).css("color","red");
			}
					});
			});
			$("#buyPassword").mouseleave(function() {
			$("#buyPasswordtip").show();	 
					$.post("/mall/user/isPasswordCorrect.do", {
						"buyPassword" : $("#buyPassword").val(),
						"username":$("#username").val()
					}, function(tipp) {
					if(!tipp){
							$("#buyPasswordtip").text("√").css("color","green"); 
					}
					else {
					$("#buyPasswordtip").text(tipp).css("color","red");
			}
					});
			});
			})
</script>
</body>
</html>