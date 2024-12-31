<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<spring:url value="src/bootstrap" var="bts"></spring:url>
<link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">FreelanceESSAT</a>
		</div>
	</nav>

	<div class="container my-5">
		<div class="login-container">
			<h2 class="text-center">Connexion</h2>
			<form method="POST" action="login">

				<div class="mb-3">
					<label for="email" class="form-label">Username</label> <input
						type="text" class="form-control" name="username"
						placeholder="Votre username" required>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Mot de Passe</label> <input
						type="password" class="form-control" name="password"
						placeholder="Votre mot de passe" required>
				</div>
				<button type="submit" class="btn btn-primary w-100">Se
					Connecter</button>
			</form>
			<div class="text-center mt-3">
				<p>
					Pas encore de compte ? <br>
					<br> <a href="/register" class="btn btn-info">Inscrivez-vous
						Freelancer</a> <a href="/register" class="btn btn-warning">Inscrivez-vous
						Client</a>
				</p>
			</div>
		</div>
	</div>

	<footer class="bg-light py-4">
		<div class="container text-center">
			<p>&copy; 2024 FreelanceESSAT. Tous droits réservés.</p>
		</div>
	</footer>

</body>
</html>
