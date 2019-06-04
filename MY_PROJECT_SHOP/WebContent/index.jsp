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
<!----------------------------------------------CART LIST SCAN----------------------------------------------------------->
<c:set value="0" var="count"></c:set>
<c:forEach var="i" items="${cartlist}"> 
	<c:set value="${count+1}" var="count"/>
</c:forEach>

<!-----------------------------------------------------------HEADER------------------------------------------------------------------->
<a href="Controller?page=home">HOME</a>
<a href="Controller?page=cart">CART(<c:out value="${count}"/>)</a>
<br>
<c:out value="${warn}"></c:out>
<div class="row">
<c:out value="${msg}"/>
<br>
  <div class="column1" style="background-color:#cccccc;">
    <h2>CATAGORY</h2>
    <br><br>
    <a href="Controller?page=product&value=mobile&id=1">MOBILE</a>
    <br><br>
    <a href="Controller?page=product&value=laptop&id=2">LAPTOP</a>
    <br><br>
    <a href="Controller?page=product&value=car&id=3">CAR</a>
  </div>
<!----------------------------------------------------LIST SCAN----------------------------------------------------------->
  <div class="column2" style="background-color:white;">
    <h2>FEATURED PRODUCT</h2>
    <table class="table">
    <c:forEach var="p" items="${list}">
    	<c:if test="${p.getFid()==1}">
    	<tr>
    		<td><c:out value="${p.getPname() }"/></td>
    		<td><c:out value="${p.getPprice() }"/></td>
    		<td><c:out value="${p.getPdesc() }"/></td>
    		<td><a href="Controller?page=addCartIndex&pid=<c:out value="${p.getId() }"/>">...click here to add</a></td>
    	</tr>
    	<tr/><tr/>
    	<tr/><tr/>
    	<tr/><tr/>
    	<tr/><tr/>
    	</c:if>
    </c:forEach>
    </table>
  </div>
</div>


</body>
</html>