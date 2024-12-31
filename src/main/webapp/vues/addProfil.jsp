<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<spring:url value="src/bootstrap" var="bts" />
<link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<sec:authentication property="principal" var="u" />
<title>Compléter Mon Profil</title>

<style>
body {
    padding-top: 56px;
    background-color: #f5f7fa; /* Teinte légèrement plus douce */
    font-family: 'Helvetica Neue', Arial, sans-serif;
    color: #343a40; /* Couleur de texte pour un bon contraste */
    line-height: 1.6; /* Espacement pour améliorer la lisibilité */
}

.profile-container {
    max-width: 600px;
    margin: auto;
    padding: 20px;
    background: linear-gradient(180deg, #ffffff, #f9f9f9); /* Léger dégradé pour une profondeur subtile */
    border-radius: 10px; /* Coins plus arrondis pour un design fluide */
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* Ombre douce mais légèrement plus définie */
    border: 1px solid #e9ecef; /* Fine bordure pour structurer la carte */
}

.profile-container h1 {
    font-size: 24px;
    font-weight: bold;
    text-align: center;
    color: #495057; /* Gris moderne */
    margin-bottom: 15px;
}

.profile-container p {
    font-size: 16px;
    text-align: justify; /* Pour un alignement soigné du texte */
    color: #6c757d; /* Couleur douce pour les paragraphes */
}

.profile-container .btn {
    display: block;
    width: 100%;
    padding: 10px 15px;
    background-color: #007bff; /* Bleu primaire */
    color: white;
    text-align: center;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s ease;
    border: none;
}

.profile-container .btn:hover {
    background-color: #0056b3; /* Teinte plus sombre au survol */
    transform: translateY(-2px); /* Légère levée pour l’interactivité */
}

</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<c:set var="cxt" value="${pageContext.request.contextPath}" />
	<div class="container my-5">
		<div class="profile-container">
			<h2 class="text-center">Compléter Mon Profil</h2>

			<form:form method="POST" action="${cxt}/saveProfil"
				modelAttribute="prf">
				<div class="mb-3">
					<label for="bio" class="form-label">Biographie</label>
					<form:input path="biographie" class="form-control" id="bio"
						rows="3"
						placeholder="Parlez un peu de vous et de votre expérience." />
				</div>
				
				<div class="mb-3">
					<label for="skills" class="form-label">Skills</label>
					<form:input path="skills" type="text" class="form-control"
						id="skills"
						placeholder="Entrez vos compétences (séparées par des virgules)" />
				</div>
				<div class="mb-3">
					<label for="experience" class="form-label">Nombre d'années
						d'expérience professionnelle</label>
					<form:input path="nbExperience" type="number" class="form-control"
						id="experience" placeholder="Entrez votre expérience en années" />
				</div>
				<div class="mb-3">
					<label for="tarif" class="form-label">Tarif Horaire</label>
					<form:input path="tarif" type="text" class="form-control"
						id="tarif" placeholder="Entrez votre Tarif Horaire" />
				</div>
				<div class="mb-3">
					<label for="photo" class="form-label">Photo de Profil</label>
					<form:input path="photo" type="file" name="profilePicture"
						id="photo" class="form-control" />

				</div>

				<input type="hidden" name="freelancer.id" value="${u.id}" />
				<button type="submit" class="btn btn-primary w-100">Enregistrer
					le Profil</button>
			</form:form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
