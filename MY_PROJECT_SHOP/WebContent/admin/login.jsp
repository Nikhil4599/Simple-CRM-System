<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>LOGIN FORM</h1>
<form action="admin" method="post" >
<input type="hidden" value="login_form" name="page">
	<table>
	<tr>
		<td>USERNAME:</td>
		<td><input type="text" name="username" placeholder="Enter username"></td>
	</tr>
	<tr>
		<td>PASSWORD:</td>
		<td><input type="password" name="password" placeholder="Enter Password"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="LOGIN"></td>
	</tr>
	</table>
</form>
</body>
</html>