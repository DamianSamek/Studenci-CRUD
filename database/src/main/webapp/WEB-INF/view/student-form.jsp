<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
	<title>Dodaj studenta</title>

	<link type="text/css" rel="stylesheet" 
	href="${pageContext.request.contextPath}/resources/css/style.css">
	
	<link type="text/css" rel="stylesheet" 
	href="${pageContext.request.contextPath}/resources/css/add-student-style.css"/>
	
	
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>Zarzadzanie baza studentow</h2>
		</div>
	</div>
	
	<div id="container">
		<h3>Dodawanie/Edycja studenta</h3>
	
		<form:form action="saveStudent" modelAttribute="students" method="POST">
		
		<form:hidden path="id"/>
		
		<table>
			<tbody>
				
				<tr>
					<td><label>Imie:</label></td>
					<td><form:input path="firstName" /></td>
				</tr>
				
				<tr>
					<td><label>Nazwisko:</label></td>
					<td><form:input path="lastName" /></td>
				</tr>
				
				<tr>
					<td><label>PESEL:</label></td>
					<td><form:input path="pesel" /></td>
				</tr>
				
				<tr>
					<td><label>E-mail:</label></td>
					<td><form:input path="email" /></td>
				</tr>
				
				<tr>
					<td><label></label></td>
					<td><input type="submit" value="Dodaj/Zapisz" class="save"/></td>
				</tr>
				
			</tbody>
		
		</table>
		
		
		</form:form>
		
		<div style="clear; both;"></div>
		
		<p>
			<a href="${pageContext.request.contextPath}/student/list">Powrot do listy</a>
		</p>
	</div>

</body>

</html>