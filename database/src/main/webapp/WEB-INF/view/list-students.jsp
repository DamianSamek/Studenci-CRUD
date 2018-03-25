<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
	<title>Lista studentow</title>
	
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>

</head>

<body>

<div id="wrapper">
	<div id="header">
		<h2>Zarzadzanie baza studentow</h2>
	</div>
</div>

<div id="container">
	<div id="content">
	
	<input type="button" value="Dodaj studenta"
		onclick="window.location.href='showFormForAdd'; return false;" 
		class="add-button"/>
	
	<table>
		<tr>
			<th>Imie</th>
			<th>Nazwisko</th>
			<th>PESEL</th>
			<th>E-mail</th>
			<th>Akcja</th>
		</tr>
		
		<c:forEach var="tempStudent" items="${students}">
		
		<c:url var="updateLink" value="showFormForUpdate">
			<c:param name="studentId" value="${tempStudent.id}"/>
		</c:url>
		
		<c:url var="deleteLink" value="delete">
			<c:param name="studentId" value="${tempStudent.id}"/>
		</c:url>
		<tr>
			<td>${tempStudent.firstName}</td>
			<td>${tempStudent.lastName}</td>
			<td>${tempStudent.pesel}</td>
			<td>${tempStudent.email}</td>
			<td><a href="${updateLink}">Edytuj</a>
			|
			<a href="${deleteLink}"
			 onclick="if (!(confirm('Czy na pewno chcesz usunac studenta?'))) return false">Usun</a></td>
		</tr>
		
		</c:forEach>
	</table>
	
	<p>
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		
			<input type="submit" value="Wyloguj" class="add-button" />
		
		</form:form>
	</p>
	
	
	</div>
</div>

</body>
</html>