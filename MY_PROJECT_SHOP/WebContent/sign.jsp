<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.column {
	    float: left;
	    width: 20%;
	    padding: 30px;
	    height: 60%; /* Should be removed. Only for demonstration */
	    border:  solid;
	    margin-left: 550px;
	    margin-top: 40px;
	}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div align="center" class="column" style="background-color:#ddddbb;">
<h1 align="center">SIGN UP</h1>
<font color="red"><c:out value="${msg}"/></font>
<form action="Controller" method="post" >
<input type="hidden" value="sign_up" name="page">
	<table>
	<tr>
		<td>NAME:</td>
		<td><input type="text" name="name" placeholder="Enter name"></td>
	</tr>
	<tr>
		<td>ADDRESS:</td>
		<td><input type="text" name="address" placeholder="Enter Address"></td>
	</tr>
	<tr>
		<td>EMAIL</td>
		<td><input type="email" name="email" placeholder="Enter email"></td>
	</tr>
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
		<td><input type="submit" value="sign up"></td>
	</tr>
	</table>
</form>
</div>
</body>
</html>