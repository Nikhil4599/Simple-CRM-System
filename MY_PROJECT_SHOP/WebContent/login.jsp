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
<h1 align="center">LOGIN</h1>
<font color="red"><c:out value="${msg}"/></font>
<form action="Controller" method="post" >
<input type="hidden" value="login" name="page">
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
<table>
	<tr>
		<td></td>
		<td><a href="Controller?page=sign">click here to sign up</a></td>
	</tr>
</table>
</div>
</body>
</html>