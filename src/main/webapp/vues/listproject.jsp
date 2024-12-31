<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Freelance Projects</title>
<spring:url value="/src/bootstrap" var="bts" />

<link rel="stylesheet" href="${bts}/css/bootstrap.min.css">



<style>
body {
    padding-top: 56px;
    background: linear-gradient(120deg, rgba(204, 229, 255, 0.8), /* Bleu clair translucide */
                                   rgba(204, 255, 229, 0.8)); /* Vert clair translucide */
    background-size: cover;
    background-position: center;
    font-family: 'Roboto', sans-serif;
    color: #333; /* Couleur du texte pour le contraste */
}

.card {
    border-radius: 15px; /* Coins arrondis */
    overflow: hidden; /* Assure un découpage propre */
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
}

.card:hover {
    transform: translateY(-10px); /* Léger effet de levée */
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
}

.btn {
    border-radius: 30px;
    background: linear-gradient(90deg, #ff7eb3, #ff758c); /* Dégradé rose/violet */
    color: white;
    transition: background 0.3s ease, transform 0.3s ease;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
}

.btn:hover {
    background: linear-gradient(90deg, #ff758c, #ff7eb3); /* Inversion du dégradé */
    transform: scale(1.1);
}

</style>
</head>
<body>
	<c:set var="cxt" value="${pageContext.request.contextPath}" />
	<jsp:include page="header.jsp" />
	<div class="container mt-5">
		<h1>Projets Disponibles</h1>
		<c:if test="${not empty successMessage}">
			<div class="alert alert-success">${successMessage}</div>
		</c:if>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>Titre</th>
					<th>Description</th>
					<th>Budget</th>
					<th>Date Limite</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="project" items="${projects}">
					<tr>
						<td>${project.id}</td>
						<td>${project.titre}</td>
						<td>${project.description}</td>
						<td>${project.budget}</td>
						<td>${project.date_limite}</td>
						<td><a href="${cxt}/detail_project/${project.id}"
							class="btn btn-danger btn-sm">Postuler</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>

<jsp:include page="footer.jsp" />

</body>
</html>
