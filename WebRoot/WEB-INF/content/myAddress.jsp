<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>myAddress</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 


</script>
<!-- //for-mobile-apps -->
<link href="<%=path%>/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/jquery-ui.css">
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
	<div style="border:1px solid #CDC9C9">
		<h3 style="color:#FFFFFF;background-color: #FFA500 ">我的收货地址</h3>
		<input type="hidden" value="${fn:length(addressList)}" id="len"/>
		<c:forEach items="${addressList}" var="address" varStatus="vs">
			<div>
				<form  method="post" name="address" action="editAddress.do" id="${vs.index }">
					<input id="id" type="hidden" name="id" value=${address.id }>
					<%-- <input id="id" type="hidden" name="id" value=${vs.index }> --%>
					<div class="bs-docs-example" style="border-bottom:1px solid #CDC9C9">
						<table class="table table-striped">
							<tr>
								<%-- <td>id：${vs.count}</td> --%>
								
								<td>收货人：<input id="person${vs.index}" type="text" name="getPerson"
									value="${address.getPerson }"></td>
								<td>联系电话：<input id="tel${vs.index}" type="text" name="tel"
									value="${address.tel }"></td>
									<td>邮编：<input id="postcode${vs.index}" type="text" name="postcode"
									value="${address.postcode }"></td>
							</tr>
							<tr>
								<td>详细地址：<input id="address${vs.index }" type="text" name="getAddress" style="wideth:200px"
									value="${address.getAddress }" >
									</td>
									</tr>
						</table>
						
							<%-- <tr>
								
								<td>详细地址：<input id="address" type="text" name="getAddress"
									value="${address.getAddress }" disabled="true"></td> 
							 </tr> --%>
					
						<div align="right">
							<h4 class="t-button" style="margin-right:50px">

								<!--  <input type="submit" value="修改" style="width:50;height:20;">  javascript:$('#${vs.index }').submit();-->
								 <a href="javascript:$('#${vs.index }').submit();"><span class="label label-warning">修改</span></a>
								<a href="/mall/address/deleteAddress.do?id=${address.id}&userId=${userId}"><span
									class="label label-warning">删除</span></a>
							</h4>
						</div>
					</div>
				</form>
			</div>
		</c:forEach>
		<div id="editaddress">
			<h3 style="color:#FFFFFF;background-color: #FFA500 ">编辑新的收货地址</h3>
			<div class="bs-docs-example" >
				<form action="editAddress.do" method="post" name="newaddress">
					<input id="id" type="hidden" name="id" value=${address.id }>
					<input id="123address" name="getAddress" type="hidden"/>
					<table class="table table-striped">
						<tr>
							<td>收货人：<input id="123person" name="getPerson"
								value="${address.getPerson }"></td>
							<td>联系电话：<input id="123tel" name="tel" value="${address.tel }"></td>
							<td>邮编：<input id="123postcode" name="postcode"
								value="${address.postcode }"></td>
						</tr>
						<%--  <tr>
							
							<td>详细地址：<input id="address" name="getAddress"
								value="${address.getAddress }"></td>
						</tr> --%>
						
					</table>
					<div style="margin-left: 20px;font-size:10px">
								详细地址：
								<select name="caselect" id="caselect" onchange="change(this)">
								<option value="01">请选择</option>
								<option value="广东省">广东</option>
								<option value="云南省">云南</option>
								<option value="广西省">广西</option>
								<option value="河北省">河北</option>
								<option value="山西省">山西</option>
								<option value="辽宁省">辽宁</option>
								<option value="吉林省">吉林</option>
								<option value="黑龙江省">黑龙江</option>
								<!-- <option value="江苏省">江苏</option>
								<option value="浙江省">浙江</option>
								<option value="安徽省">安徽</option>
								<option value="福建省">福建</option>
								<option value="江西省">江西</option>
								<option value="河南省">河南</option>
								<option value="湖北省">湖北</option>
								<option value="湖南省">湖南</option>
								<option value="海南省">海南</option>
								<option value="四川省">四川</option>
								<option value="贵州省">贵州</option>
								<option value="陕西省">陕西</option>
								<option value="甘肃省">甘肃</option>
								<option value="青海省">青海</option>
								<option value="台湾省">台湾</option> -->
								</select>省
								<select name="deselect" id="deselect" onchange="select(this)">
								</select>市/州/
								<input type="text" id="inputAddress" placeholder="输入详细地址">
					</div>
					<div align="right">
						<h4 class="t-button" style="margin-right:50px">
							<a href="#" onclick="javascript:cancel()"><span
								class="label label-warning">取消</span></a>
							<a href="javascript:checkAddress();"><span class="label label-warning">提交</span></a> 
						</h4>
					</div>
				</form>
			</div>
		</div>
		<div align="right" id="newaddress">
			<h3 class="t-button" style="margin-right:50px">
				<a href="#" onclick="newAddress()"><span
					class="label label-warning">新增地址</span></a>
			</h3>
		</div>
	</div>
	<script type="text/javascript">
		var pxj;
		var address1;
		var address2;
		var address3;
		$(document).ready(function() {
			$('#editaddress').hide();
		});
		function newAddress() {
			$('#editaddress').show();
			$('#newaddress').hide();
		}
		function cancel() {
			$('#editaddress').hide();
			$('#newaddress').show();
		}
		// 构造2个数组
		var detail_show = [];
		var detail_value = [];
		detail_show[1] = [];
		detail_value[1] = [];
		detail_show[1][0] ='请选择';
		detail_value[1][0] = '请选择';
		detail_show[1][1] ='深圳';
		detail_value[1][1] = '深圳市';
		detail_show[1][2] ='珠海';
		detail_value[1][2] = '珠海市';
		detail_show[1][3] ='广州';
		detail_value[1][3] = '广州市';
		detail_show[2] = [];
		detail_value[2] = [];
		detail_show[2][0] ='请选择';
		detail_value[2][0] = '请选择';
		detail_show[2][1] ='昆明';
		detail_value[2][1] = '昆明市';
		detail_show[2][2] ='大理';
		detail_value[2][2] = '大理市';
		detail_show[2][3] ='普洱';
		detail_value[2][3] = '普洱市';
		detail_show[3] = [];
		detail_value[3] = [];
		detail_show[3][0] ='请选择';
		detail_value[3][0] = '请选择';
		detail_show[3][1] ='柳州';
		detail_value[3][1] = '柳州市';
		detail_show[3][2] ='桂林';
		detail_value[3][2] = '桂林市';
		detail_show[3][3] ='贺州';
		detail_value[3][3] = '贺州市';
		detail_show[4] = [];
		detail_value[4] = [];
		detail_show[4][0] ='请选择';
		detail_value[4][0] = '请选择';
		detail_show[4][1] ='石家庄';
		detail_value[4][1] = '石家庄市';
		detail_show[4][2] ='衡水';
		detail_value[4][2] = '衡水市';
		detail_show[4][3] ='唐山';
		detail_value[4][3] = '唐山市';
		detail_show[5] = [];
		detail_value[5] = [];
		detail_show[5][0] ='请选择';
		detail_value[5][0] = '请选择';
		detail_show[5][1] ='太原';
		detail_value[5][1] = '太原市';
		detail_show[5][2] ='大同';
		detail_value[5][2] = '大同市';
		detail_show[5][3] ='临汾';
		detail_value[5][3] = '临汾市';
		detail_show[6] = [];
		detail_value[6] = [];
		detail_show[6][0] ='请选择';
		detail_value[6][0] = '请选择';
		detail_show[6][1] ='沈阳';
		detail_value[6][1] = '沈阳市';
		detail_show[6][2] ='大连';
		detail_value[6][2] = '大连市';
		detail_show[6][3] ='鞍山';
		detail_value[6][3] = '鞍山市';
		detail_show[7] = [];
		detail_value[7] = [];
		detail_show[7][0] ='请选择';
		detail_value[7][0] = '请选择';
		detail_show[7][1] ='长春';
		detail_value[7][1] = '长春市';
		detail_show[7][2] ='四平';
		detail_value[7][2] = '四平市';
		detail_show[7][3] ='通化';
		detail_value[7][3] = '通化市';
		detail_show[8] = [];
		detail_value[8] = [];
		detail_show[8][0] ='请选择';
		detail_value[8][0] = '请选择';
		detail_show[8][1] ='哈尔滨';
		detail_value[8][1] = '哈尔滨市';
		detail_show[8][2] ='齐齐哈尔';
		detail_value[8][2] = '齐齐哈尔市';
		detail_show[8][3] ='黑河';
		detail_value[8][3] = '黑河市';
		
		
		function change(target)
		{
			var len = $('#len').val();
			
			// 获取级联的下拉列表
			var deselect = document.getElementById("deselect");
			// 清空第二个下拉列表的选项
			deselect.innerHTML = null;
			var m = target.selectedIndex;
			if ( m >= 1 ) 
			{
				for(var i = 0; i < detail_show[m].length; i++)
				{
					// 循环构造很多option,然后放在指定的option中
					// new Option(show,value)可以构造一个一个的option
					 deselect.options[i] = new Option(detail_show[m][i], 
						detail_value[m][i]);
				}
				// 设置默认选中第一个列表项
					 deselect.options[0].selected = true; 	
			}
			address1=target.value;
			
		}
		function select(target)
		{
			address2=target.value;
			
		}
		function checkAddress()
		{	
			if($("#123person").val()=="")
			{
				alert("请输入收货人");
				return false;
			}
			//验证联系电话（不能为空，必须13、18、15、14开头
			var reg=/^0?1[3|4|5|8][0-9]\d{8}$/; 
			if($("#123tel").val()=="")
			{
				alert("请输入联系电话！");
				return false;
			}
			else
			{
				if(!(reg.test($("#123tel").val())))
				{
					alert("不是正确的11位联系电话，请重新输入！");
					return false;
				}
			}

			//邮编验证 （开头不能为0，共6位）
			var re= /^[1-9][0-9]{5}$/;
			if($("#123postcode").val()=="")
			{
				alert("请输入邮编号码！");
				return false;
			}
			else
			{
				if(!(re.test($("#123postcode").val())))
				{
					alert("邮编格式不正确！请重新输入！");
					return false;
				}
			}
			address3=$("#inputAddress").val();
			/* alert("address1的值："+address1);
			alert("address2的值："+address2);
			alert("address3的值："+address3); */
			pxj=address1+address2+address3;
			/* alert(pxj); */
			document.getElementById("123address").value=pxj;
			if(typeof(address1) == "undefined"||typeof(address2) == "undefined"||address3== ""||address1=="01"||address2=="请选择")
			{
				alert("请填写正确的收货地址，是否省、市、详细地址已选择或填写！");
				return false;
			}
			else
			{
				document.newaddress.submit();
			}	
		}
		function modify()
		{
			if($("#person").val()=="")
			{
				alert("收货人不能为空！");
				return false;
			}
			//验证联系电话（不能为空，必须13、18、15、14开头
			var reg=/^0?1[3|4|5|8][0-9]\d{8}$/; 
			if($("#123tel").val()=="")
			{
				alert("请输入联系电话！");
				return false;
			}
			else
			{
				if(!(reg.test($("#123tel").val())))
				{
					alert("不是正确的11位联系电话，请重新输入！");
					return false;
				}
			}
			//邮编验证 （开头不能为0，共6位）
			var re= /^[1-9][0-9]{5}$/;
			if($("#123postcode").val()=="")
			{
				alert("请输入邮编号码！");
				return false;
			}
			else
			{
				if(!(re.test($("#123postcode").val())))
				{
					alert("邮编格式不正确！请重新输入！");
					return false;
				}
			}
			
		}
	</script>
</body>
</html>
