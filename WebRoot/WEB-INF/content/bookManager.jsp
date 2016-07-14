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
  
<title>商品管理</title>  

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
<!-- //js -->
<!-- cart -->
<script src="<%=path %>/js/simpleCart.min.js"></script>
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

<h3 class="tittle" >商品管理</h3>

<div class="table-responsive checkout-right animated wow slideInUp" data-wow-delay=".5s">
				<table class="timetable_sub" id="deleteBook">
					<thead>
						<tr>
							<th>编号</th>
							<th>商品图片</th>
							<th>商品名字</th>
							<th>库存</th>	
							<th>价格</th>						
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
					
				</table>
</div>
			<script>
			$(function(){
				$.get("/mall/bookManagerData.do",
					function(data){		
					 	var str=eval(data);
						$.each(str,function(index){					
							var table=$('#deleteBook');
							var row;
							row=$("<tr class=\"rem1\">");
							row.append($("<td class=\"invert\">"+this.id+"</td>"));
							row.append($("<td class=\"invert-image\"><a href=\"#\"><img src="+this.bookUrl+" alt=\" \" class=\"img-responsive\" /></a></td>"));
							row.append($("<td class=\"invert\">"+this.bookName+"</td>"));
							row.append($("<td class=\"invert\"><input type=\"text\" id=\"number"+this.id+"\" value=\""+this.bookNumber+"\"></input></td>"));			
							row.append($("<td class=\"invert\"><input type=\"text\" id=\"price"+this.id+"\" value=\""+this.bookPrice+"\"></input></td>"));
							row.append($("<td class=\"invert-closeb\"><input type=\"button\" onclick=\"update(this.id)\" id="+this.id+" value=\"修改\"/><input type=\"button\" onclick=\"del(this.id)\" id="+this.id+" value=\"删除\"/></td></tr>"));
							table.append(row);						
						});
					}
					);
				}
			);
		function del(id){
		
			if(confirm("确定删除此项商品吗？")){	
				$.get("/mall/deleteBook.do",{bookId:id},function(data){
						window.location.href="/mall/bookManager.do";//modified by gjb on 7.10
					}
				);
			}			
		}
		function update(id){
			if($('#number'+id).val()<=0){
				alert("库存必须大于0");
				return null;
			}
			if($('#price'+id).val()<=0){
				alert("价格必须大于0");
				return null;
			}
			if(isNaN($('#number'+id).val())){
				alert("库存格式必须是数字");
				return null;
			}
			if(isNaN($('#price'+id).val())){
				alert("价格格式必须是数字");
				return null;
			}
			$.get("/mall/update.do",{bookId:id,bookNumber:$('#number'+id).val(),bookPrice:$('#price'+id).val()},function(data){alert(data)});
		}
		</script>
<br/>		
<h3 class="tittle">添加商品</h3>
<div class="contact-form2">
<form name="addBook" action="/mall/saveBook.do"  method="post" onsubmit="return add(this)" enctype="multipart/form-data" >
<div style="width:500px;"><span style="display:inline-block;width:90px;">
商品名称：     </span>
<input type="text" name="bookName" value="商品名称" onfocus="this.value = '';"
 				onblur="if (this.value == '') {this.value = '商品名称';}" /> 				
 				</div>

<div style="width:500px;"><span style="display:inline-block;width:90px;">
商品图片：       </span>		<input type="file" name="file" />	</div>
<div style="width:500px;"><span style="display:inline-block;width:90px;">
商品的一级目录：</span><input type="text" name="firstType" value="商品的一级目录" onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = '商品的一级目录';}" />	</div>	
			
<div style="width:500px;"><span style="display:inline-block;width:90px;">
商品的二级目录：</span><input type="text" name="secondType" value="商品的二级目录" onfocus="this.value = '';"
 				onblur="if (this.value == '') {this.value = '商品的二级目录';}" />	</div>

<div style="width:500px;"><span style="display:inline-block;width:90px;">
商品价格:     </span><input type="text" name="bookPrice" value="1" onfocus="this.value = '';" 
					onblur="if (this.value == '') {this.value = '1';}" /></div>
				
<div style="width:500px;"><span style="display:inline-block;width:90px;">
商品库存:</span><input type="text" name="bookNumber" value="1" onfocus="this.value = '';" 
					onblur="if (this.value == '') {this.value = '1';}" />	</div>


 <input type="submit" value="添加" />
</form>
</div>
	<script>
		function add(obj){
			if(obj.bookName.value=="商品名称"){
			alert("请输入书名");
			return false;
			}
			if(obj.file.value==""){
			alert("请上传图片");
			return false;
			}
			if(obj.firstType.value=="商品的一级目录"){
			alert("请输入商品的一级目录");
			return false;
			}
			if(obj.secondType.value=="商品的二级目录"){
			alert("请输入商品的二级目录");
			return false;
			}
			return true;
		}

	</script>
</body>  

</html> 