<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<style>
* {
    box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column1 {
    float: left;
    width: 20%;
    padding: 10px;
    height: 520px; /* Should be removed. Only for demonstration */
    border:  solid;
}
.column2 {
    float: left;
    width: 80%;
    padding: 10px;
    height: 520px; /* Should be removed. Only for demonstration */
    border:  solid;
    
}
.column3 {
    float: left;
    width: 100%;
    height: 50px; /* Should be removed. Only for demonstration */
    border:solid;
}
/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1  align="center" class="column3" style="background-color:#ddddbb;">WELCOME</h1>
<br>
<br>
<c:set value="0" var="count"></c:set>
<c:forEach var="i" items="${cartlist}"> 
	<c:set value="${count+1}" var="count"/>
</c:forEach>

<a href="Controller?page=home">HOME</a>
<a href="Controller?page=cart">CART(<c:out value="${count}"/>)</a>
<br>
<c:out value="${msg}"/>
<br>
<div class="row">
  <div class="column1" style="background-color:#cccccc;">
    <h2>CATAGORY</h2>
    <br><br>
    <a href="Controller?page=product&value=mobile&id=1">MOBILE</a>
    <br><br>
    <a href="Controller?page=product&value=laptop&id=2">LAPTOP</a>
    <br><br>
    <a href="Controller?page=product&value=car&id=3">CAR</a>
</div>
<div class="column2" style="background-color:white;">
   <h2>CART <c:out value="${product}"></c:out></h2>
<table>
<c:choose>
	<c:when test="${id==1}">
		<c:forEach items="${list}" var="p">   
			<c:if test="${p.getPcat_id()==1}">
				<tr>
		    		<td><c:out value="${p.getPname() }"/></td>
		    		<td><c:out value="${p.getPprice() }"/></td>
		    		<td><c:out value="${p.getPdesc() }"/></td>
		    		<td><a href="Controller?page=addCartProduct&value=mobile&id=1&pid=<c:out value="${p.getId() }"/>">...click here to add</a></td>
	    		</tr>  <tr/><tr/><tr/><tr/><tr/><tr/><tr/>
			</c:if> 
		</c:forEach>
	</c:when>
	<c:when test="${id==2}">
		<c:forEach items="${list}" var="p">   
			<c:if test="${p.getPcat_id()==2}">
				<tr>
		    		<td><c:out value="${p.getPname() }"/></td>
		    		<td><c:out value="${p.getPprice() }"/></td>
		    		<td><c:out value="${p.getPdesc() }"/></td>
		    		<td><a href="Controller?page=addCartProduct&value=laptop&id=2&pid=<c:out value="${p.getId() }"/>">...click here to add</a></td>
	    		</tr>  <tr/><tr/><tr/><tr/><tr/><tr/><tr/>
			</c:if> 
		</c:forEach>
	</c:when>
	<c:when test="${id==3}">
		<c:forEach items="${list}" var="p">   
			<c:if test="${p.getPcat_id()==3}">
				<tr>
		    		<td><c:out value="${p.getPname() }"/></td>
		    		<td><c:out value="${p.getPprice() }"/></td>
		    		<td><c:out value="${p.getPdesc() }"/></td>
		    		<td><a href="Controller?page=addCartProduct&value=car&id=3&pid=<c:out value="${p.getId() }"/>">...click here to add</a></td>
		    		</tr>
	    		<tr/> <tr/><tr/><tr/><tr/><tr/><tr/><tr/>
			</c:if> 
		</c:forEach>
	</c:when>
</c:choose>
</table>
</div>
</div>
</body>
</html>