<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> Edit Product</h1>
<BR>
<form action="admin" method="get">
	<input type="hidden" name="page" value="edit_product">
	<input type="hidden" name="id" value="<c:out value="${p.getId() }"/>">
	Name: <input type="text" name="pname" value="<c:out value="${p.getPname() }"/>">			<BR><BR>
	Price: <input type="text" name="pprice" value="<c:out value="${p.getPprice() }"/>">			<BR><BR>
	DESC: <input type="text" name="pdesc" value="<c:out value="${p.getPdesc() }"/>">			<BR><BR>
	CAT_ID: <input type="text" name="pcat_id" value="<c:out value="${p.getPcat_id() }"/>">		<BR><BR>
	FID: <input type="text" name="fid" value="<c:out value="${p.getFid() }"/>">					<BR><BR>
	<input type="submit" value="Process">
</form>
</body>
</html>