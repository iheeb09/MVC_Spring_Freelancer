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


<!-- Inclure Bootstrap et FontAwesome -->
<spring:url value="/src/bootstrap" var="bts" />
<spring:url value="/src/images" var="img" />
<link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<sec:authentication property="principal" var="u" />
<c:set var="cxt" value="${pageContext.request.contextPath}" />


<title>Connexion</title>
<style>
body {
	padding-top: 56px;
	background-color: #f8f9fa;
}

.login-container {
	max-width: 500px;
	margin: auto;
	padding: 20px;
	background-color: white;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<!-- Capture le contexte de l'application -->


	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
			<div class="container">
				<a class="navbar-brand" href="#">FreelanceESSAT</a>
			</div>
		</nav>
	</header>

	<main>
		<div class="container my-5">
			<div class="login-container">
				<h2 class="text-center">Connexion</h2>

				<!-- Formulaire de connexion -->
				<form method="POST" action="login">

					<div class="mb-3">
						<label for="username1" class="form-label">Username</label> <input
							type="text" class="form-control" name="username"
							placeholder="Taper Votre username" required>
					</div>

					<div class="mb-3">
						<label for="password" class="form-label">Mot de Passe</label> <input
							type="password" class="form-control" name="password"
							placeholder="Taper Votre mot de passe" required>
					</div>

					<button type="submit" class="btn btn-primary w-100">Se
						Connecter</button>
				</form>

				<div class="text-center mt-3">
					<p>
						Pas encore de compte ? <br> <br> <br> <a
							href="${cxt}/registerFreelancer">Inscrivez-vous Freelancer</a> <br>
						<a href="${cxt}/registerClient">Inscrivez-vous Client</a>
					</p>
				</div>
			</div>
		</div>
	</main>

	<jsp:include page="footer.jsp" />
</body>
</html>
