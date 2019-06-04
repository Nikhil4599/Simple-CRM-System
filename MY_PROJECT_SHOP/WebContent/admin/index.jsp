<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>  
<h1>Admin Section</h1>

<sql:setDataSource user="root" password="" driver="com.mysql.jdbc.Driver" 
url="jdbc:mysql://localhost:3306/cart" var="ds" />

<sql:query  dataSource="${ds }" var="result"> 
select * from product
</sql:query>
<c:set var="i" value="0"/>

<c:out value="${msg }"/> <BR> <BR>
<c:forEach items="${result.rows}" var="row" >
 <c:set var="i" value="${i+1 }"/>
	<c:out value="${i }"/>. <c:out value="${row.pname}"/>--Rs.<c:out value="${row.pprice}"/>
	<a href="<%=request.getContextPath() %>/admin?page=delete&id=${row.pid}">delete</a> | 
	<a href="<%=request.getContextPath() %>/admin?page=edit&id=${row.pid}">edit</a>
	<hr>
</c:forEach>
</body>
</html>