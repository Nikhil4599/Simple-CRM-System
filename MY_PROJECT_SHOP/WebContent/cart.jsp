<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>CART IS:</h1>
<HR>
<c:set value="0" var="total"></c:set>
<table>
	<c:forEach items="${cartlist}" var="c">
		<c:forEach items="${list}" var="p">
			<c:if test="${c==p.getId()}">
				<tr>
	    			<td><c:out value="${p.getPname()}"/></td>
	    			<td> : </td>
	    			<td><c:out value="${p.getPprice()}"/></td>
	    		</tr>
				<c:set value="${total+ p.getPprice()}" var="total"/>
			</c:if>
		</c:forEach>
	</c:forEach>
	<tr>
		<td><h4>TOTAL:</h4></td>
		<td> : </td>
		<td><h4><c:out value="${total }"/></h4></td>
	</tr>
</table>
<a href="Controller?page=form"><input type="button" value="PLACE ORDER"></a>
</body>
</html>