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
<title>订单查询</title>  

<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="<%=path %>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pignose css -->
<link href="<%=path %>/css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
<!-- //pignose css -->
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="<%=path %>/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/laydate-master/laydate.dev.js"></script>
<!-- //js -->
<!-- cart -->
<script src="<%=path %>/js/simpleCart.min.js"></script>
<style type="text/css">
        .demo1{
            height:300px;
        }
</style>

<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="<%=path %>/js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='http://fonts.useso.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
<script src="<%=path %>/js/jquery.easing.min.js"></script>
</head>  
<body> 
<form name="order1" action="/mall/orderInfo/findAllAll.do"  
method="post"  enctype="multipart/form-data" >
<input type="submit" value="一键查看所有订单" 
   style="width:200px;height:50px;">
</form>
<br/>
<h3 class="tittle">订单查询</h3>
<div class="contact-form2">
根据时间段进行查看
<form name="order" action="/mall/orderInfo/findBetween.do"  method="post" onsubmit="return query(this)" enctype="multipart/form-data" >
    <div class="demo1">
          起始日期：<input type="text" name="begin" id="begin">   
    <br/>
          终止日期：<input type="text" name="end" id="end">
    
    &nbsp &nbsp <input type="submit" " value="查询"/>
    </div> 
</form>
</div>
	<div>
		<iframe name="whx" scrolling="auto" marginwidth="0" marginheight="0" frameborder="0" width="100%" height="100%">
    	</iframe>
    </div>
	<script >
	 laydate({
            elem: '#begin'
        });
        laydate({
            elem: '#end'
        });
        
        function query(obj){
        if(obj.begin.value==""||obj.end.value==""){
        	alert("日期不能为空");
        	  return false;
        }
        var a=obj.begin.value;
        var b=obj.end.value;
         var arr = a.split("-");
    	var starttime = new Date(arr[0], arr[1], arr[2]);
    	var starttimes = starttime.getTime();

    	var arrs = b.split("-");
    	var lktime = new Date(arrs[0], arrs[1], arrs[2]);
    	var lktimes = lktime.getTime();

    	if (starttimes > lktimes) {

        alert("开始日期大于离开时间，请检查");
        return false;
        } 
		return true;
		};
		
	</script>
</body>
</html>