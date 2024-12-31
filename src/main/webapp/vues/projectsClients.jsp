<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="fr">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Freelance Projects</title>

<spring:url value="/src/bootstrap" var="bts" />
<link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
	<section id="projects" class="py-5">
		<div class="container">
			<h2 class="text-center mb-4">Mes Projets</h2>
			<div class="row">
				<c:forEach items="${ProjC}" var="p">
					<div class="col-md-4 mb-4">
						<div class="card shadow-sm h-100">
							<div class="card-body d-flex flex-column">
								<h4 class="card-title">${p.titre}</h4>
								<p class="card-text">${p.description}</p>
								<p class="text-muted mt-auto">Budget : ${p.budget} DT</p>
								<div class="d-flex justify-content-between mt-3">
									<a href="${cxt}/detail_project/${p.id}"
										class="btn btn-sm btn-info"> <i class="fas fa-eye"></i>
										Voir le Projet
									</a>
									<button class="btn btn-danger btn-sm">
										<i class="fas fa-trash"></i> Supprimer
									</button>
									<button class="btn btn-sm btn-warning">
										<i class="fas fa-edit"></i> Modifier
									</button>

								</div>
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
