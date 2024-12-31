<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="u" />


<c:set var="cxt" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inscription Freelancer</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
	padding-top: 56px;
	background-color: #f8f9fa;
}

.signup-container {
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

	<div class="container my-5">
		<div class="signup-container">
			<h2 class="text-center">Inscription Freelancer</h2>
			<form:form method="POST" action="${cxt}/saveFreelancer"
				modelAttribute="user">

				<div class="mb-3">
					<label for="name" class="form-label">Nom Complet</label>
					<form:input path="nom" type="text" class="form-control" name="name"
						placeholder="Votre nom complet" />
				</div>
				<div class="mb-3">
					<label for="username" class="form-label">Username</label>
					<form:input path="username" type="text" class="form-control"
						name="username" placeholder="Votre username" />
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">Adresse E-mail</label>
					<form:input path="email" type="email" class="form-control"
						name="email" placeholder="Votre adresse e-mail" />
				</div>
				<div class="mb-3">
					<label>Phone Number</label> 
					<form:input path ="fphone" type="text"
						placeholder="Enter phone number" name="fphone"  />
				</div>


				<div class="mb-3">
					<label for="password" class="form-label">Mot de Passe</label>
					<form:input path="password" type="password" class="form-control"
						id="password" name="password"
						placeholder="Choisissez un mot de passe" />
				</div>

				<button type="submit" class="btn btn-primary w-100">S'inscrire</button>
			</form:form>

			<div class="mt-3 text-center">
				<p>
					Déjà un compte ? <a href=''>Connectez-vous ici</a>
				</p>
			</div>
		</div>
	</div>



</body>
</html>
