<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>购物车</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="<%=path %>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=path %>/css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="<%=path %>/js/jquery-2.1.4.min.js"></script>
<script src="<%=path %>/js/simpleCart.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap-3.1.1.min.js"></script>
<link href='http://fonts.useso.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
<script src="<%=path %>/js/jquery.easing.min.js"></script>
</head>

<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- //banner-top -->
	<!-- banner -->
	<div class="page-head">
		<div class="container"></div>
	</div>
	<!-- //banner -->
	<!-- check out -->
	<span id="userId" type="button" style="display:none;">${userId }</span>
	<span id="username" type="button" style="display:none;">${username }</span>
	<div class="checkout">
		<div class="container">
			<h3>我的购物车</h3>
			<div class="table-responsive checkout-right animated wow slideInUp"
				data-wow-delay=".5s">
				<table class="timetable_sub" id="shoppingcart">
					<thead>
						<tr>
							<th>删除</th>
							<th>商品名</th>
							<th>购买数量</th>
							<th>价格</th>						
							<th>小计</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>

			<div class="checkout-left">
				<div class="checkout-right-basket animated wow slideInRight"
					data-wow-delay=".5s">
					<a style="cursor:default" id="money"></a>
				</div>
				<div class="checkout-right-basket animated wow slideInRight"
					data-wow-delay=".5s">
					<a onclick="toorder()"><span class="glyphicon glyphicon-menu-left"
						aria-hidden="true"></span>确认订单</a>
				</div>
				<div class="checkout-right-basket animated wow slideInRight"
					data-wow-delay=".5s">
					<a href="/mall/index.do"><span class="glyphicon glyphicon-menu-left"
						aria-hidden="true"></span>返回商品首页</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var money=0;
		var l=0;
		var nownum=0;
		var userId=$("#userId").text();
		//alert("userId:"+userId);
		var username=$("#username").text();
		$(function(){
			//var userId=${userId};
			$.ajaxSetup({  
			    async : false  
			}); 
			$.get("/mall/shoppingCart/find.do",{"userId":userId},
				function(data){
					if(data.length>2000){
						window.location.href="/mall/login";
					}
				 	var str=eval(data);
				 	l=str.length;
					$.each(str,function(index){
						money=money+this.bookPrice*this.number;
						var table=$('#shoppingcart');
						var row;
						row=$("<tr class=\"rem1\" id=\"tr"+this.bookId+"\">");
						//row.append($("><td class=\"invert\">"+this.bookName+"</td>"));
						//$("<td class=\"invert\">"+(this.bookPrice*this.number)+"</td></tr>";
						row.append($("<td class=\"invert-closeb\"><div class=\"rem\"><div class=\"close1\" id="+this.bookId+" onclick=\"del(this.id)\"></div><input type=\"hidden\" value="+this.bookNumber+" id=\"hidden"+this.bookId+"\"/></div></td>"));
						row.append($("<td class=\"invert\">"+this.bookName+"</td>"));
						row.append($("<td class=\"invert\"><div class=\"quantity\"><div class=\"quantity-select\"><div id="+this.bookId+" onclick=\"down(this.id)\" class=\"entry value-minus\">&nbsp;</div><div class=\"entry value\"><span><input id=\"num"+this.bookId+"\" text=\"text\" style=\"width:30px;\" value=\""+this.number+"\"/></span></div><div id="+this.bookId+" onclick=\"up(this.id)\" class=\"entry value-plus active\">&nbsp;</div></div></td>"));
						row.append($("<td id=\"price"+this.bookId+"\" class=\"invert\">"+this.bookPrice+"元"+"</td>"));
						//row.append($("<td class=\"invert-closeb\"><div class=\"rem\"><div class=\"close1\"></div></div></td>"));
						row.append($("<td id=\"oneall"+this.bookId+"\" class=\"invert\">"+(this.bookPrice*this.number)+"元"+"</td>"));
						table.append(row);
						$('#num'+this.bookId).focus(function(){
							nownum=$(this).val();
						});
						$('#num'+this.bookId).change(function(){
							var number=$(this).val();
							if(number<=0){
								alert("商品数量不能为0或负数");
								$(this).val(nownum);
								return null;
							}
							if(isNaN(number)){
								alert("请输入数字");
								$(this).val(nownum);
								return null;
							}
							var b=false;
							$.get("/mall/shoppingCart/update.do",{userId:userId,bookId:$(this).attr("id").split("m")[1],number:$(this).val()},function(data){
								if(data=="\"修改成功\"")
								{
									b=true;
								}else{
									alert(data);
									b=false;
								}
							});
							if(b){
								var bookid=$(this).attr("id").split("m")[1];
								$('#oneall'+bookid).text($('#num'+bookid).val()*$('#price'+bookid).text().split("元")[0]+"元");
								
								var mybookid=$('#shoppingcart tr');
								var tmoney=0;
								for(var i=1;i<mybookid.length;i++){
									tmoney+=parseInt($('#oneall'+mybookid.eq(i).attr("id").split("r")[1]).text().split("元")[0]);
								}
								$('#money').html("总计："+tmoney+"元");
							}else{
								$(this).val(nownum);
							}
						});
					});
					$('#money').html("总计："+money+"元");
				}
			);				
		}); 
		
		function up(id){
			if($('#num'+id).val()==$('#hidden'+id).val()){
				alert("对不起已达到商品库存上限");
				return null;
			}
			$.get("/mall/shoppingCart/bookNumberAutoIncrement.do",{userId:$('#userId').text(),bookId:id},function(data){
					$('#num'+id).val(parseInt($('#num'+id).val())+1);
					$('#oneall'+id).text($('#num'+id).val()*$('#price'+id).text().split("元")[0]+"元");
					var mybookid=$('#shoppingcart tr');
					var tmoney=0;
					for(var i=1;i<mybookid.length;i++){
						tmoney+=parseInt($('#oneall'+mybookid.eq(i).attr("id").split("r")[1]).text().split("元")[0]);
					}
					$('#money').html("总计："+tmoney+"元");
				}
			);
		}
		function down(id){
			if($('#num'+id).val()<=1){
				alert("商品数量不能为0或负数");
				return null;
			}
			$.get("/mall/shoppingCart/bookNumberAutoDecrement.do",{userId:$('#userId').text(),bookId:id},function(data){
					$('#num'+id).val(parseInt($('#num'+id).val())-1);
					$('#oneall'+id).text($('#num'+id).val()*$('#price'+id).text().split("元")[0]+"元");
					var mybookid=$('#shoppingcart tr');
					var tmoney=0;
					for(var i=1;i<mybookid.length;i++){
						tmoney+=parseInt($('#oneall'+mybookid.eq(i).attr("id").split("r")[1]).text().split("元")[0]);
					}
					$('#money').html("总计："+tmoney+"元");
				}
			);
		}
		function del(id){
			if(confirm("确定删除购物车中此项商品吗？")){
				$.get("/mall/shoppingCart/deleteFromShoppingCart.do",{userId:$('#userId').text(),bookId:id},function(data){
						var data2;
						eval("data2="+data);
						alert(data2.deleteFromShoppingCartResult);
						window.location.href=window.location.href;
					}
				);
			}			
		}
		
		function toorder(){
			if(l>0){
				window.location.href="/mall/orderInfo/toOrder.do";
			}else{
				alert("购物车为空，请选择商品再进行结算");
			}
		}
	</script>

	<!-- //check out -->

	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- //footer -->
</body>
</html>
