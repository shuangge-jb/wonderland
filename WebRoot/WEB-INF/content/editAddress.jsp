<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addAddress</title>
</head>
<body>
	<form action="editAddress.do"  method="post">
		<input id="id" type="hidden" name="id" value=${address.id }>
		<input id="userId" type="hidden" name="userId" value=${userId }>
		<p>getPerson:<input id="getPerson" type="text" name="getPerson" value=${address.getPerson }></p>
		<p>getAddress:<input id="getAddress" type="text" name="getAddress" value=${address.getAddress }></p>
		<p>tel:<input id="tel" type="text" name="tel" value=${address.tel }></p>
		<p>postcode:<input id="postcode" type="text" name="postcode" value=${address.postcode }></p>
		<input type="submit" value="Submit">
	</form>
</body>
</html>