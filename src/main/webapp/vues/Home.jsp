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

	<header class=" text-center py-5">
		<div class="container">
			<hr class="message-inner-separator">
			<h2>Bienvenue sur FreelanceESSAT</h2>
			<hr class="message-inner-separator">
			<h3 class="font-italic text-danger">
				Trouvez le projet idéal<i class="fa fa-exclamation-triangle"
					aria-hidden="true"></i>
			</h3>
			<h3>Connectez-vous avec des freelancers de talent!</h3>
			<sec:authorize access="hasRole('CLIENT')">
				<a href="${cxt}/addProject"
					class="btn btn-outline btn-lg mt-3"> Création projet <i
					class="fas fa-briefcase ml-2"></i>
				</a>
			</sec:authorize>
			<sec:authorize access="hasRole('FREELANCER')">
				<a href="${cxt}/addProfil"
					class="btn btn-outline btn-lg mt-3"> Création Profil<i
					class="fas fa-user ml-2 "></i></a>
			</sec:authorize>
		</div>
	</header>

	<section id="projects" class="py-5">
		<div class="container">
			<h2 class="text-center mb-4">Projets Récents</h2>
			<div class="row">
				<c:forEach items="${projs }" var="p">
					<div class="col-md-4 mb-4">
						<div class="card shadow-sm h-100">
							<div class="card-body d-flex flex-column">
								<img src="https://via.placeholder.com/350" class="card-img-top"
									alt="Projet 1">
								<h5 class="card-title">${p.titre }</h5>
								<p class="card-text">${p.description }]</p>
								<a href="detail_project/${p.id}" class="btn btn-danger btn-sm">Voir
									le Projet</a>
							</div>
						</div>
					</div>
				</c:forEach>



			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp" />

</body>
</html>
