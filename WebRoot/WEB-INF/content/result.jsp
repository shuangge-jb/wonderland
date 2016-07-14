<%@ page pageEncoding="utf-8"%>  
<!DOCTYPE html>  
<html>  
<head>  
<meta charset="utf-8">  
<title>上传结果</title>  
</head>  
<body>  
 <img alt="whx" src="${fileUrl }" /> 
 <img alt="whx23" src="/mall/upload/123.png" />
<table class="timetable_sub">
						<thead>
							<tr>
								<th>书名</th>
								<th>评论内容</th>
								<th>评论时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<c:forEach items="book" var="item" varStatus="c">
						<tr class="rem1">
							<td class="invert">${item.bookName}<!-- 《钢铁是怎么炼成的》 --></td>
							<td class="invert">${comment[c.index].reviewContent}<!-- 很不错哟 --></td>
							<td class="invert">${comment[c.index].pubTime}<!-- 2016-06-12 8:30 --></td>
							<td class="invert">
								<h1 class="t-button">
									<a href="#"> <span class="label label-warning">删除</span>
									</a>
								</h1>
							</td>
						</tr>
					</c:forEach>
					</table>
</body>  
</html> 