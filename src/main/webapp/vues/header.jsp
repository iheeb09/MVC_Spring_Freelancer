<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<spring:url value="/src/bootstrap" var="bts" />
<link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<sec:authentication property="principal" var="u" />
<c:set var="cxt" value="${pageContext.request.contextPath}" />


<!-- Navbar pour le rôle CLIENT -->
<c:if test="${u.role.role == 'CLIENT'}">
	<nav class="navbar  navbar-expand-lg navbar-light bg-info fixed-top"
		style="background: linear-gradient(to right, #de6262, #ffb88c);">
		<div class="container">
			<a class="navbar-brand">FreelanceESSAT</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item active"><a class="nav-link" href="${cxt}/"><i
							class="fa-solid fa-house"></i> Home </a></li>


					<li class="nav-item"><a class="nav-link"
						href="${cxt}/projects/client/${u.id}"> <i
							class="fas fa-briefcase"></i> Mes Projets
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${cxt}/clientProposition"> <i class="fas fa-envelope"></i>
							Mes Propositions
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#about"><i
							class="fas fa-info-circle"></i> À Propos</a></li>
					<li class="nav-item"><a class="nav-link" href="#contact"><i
							class="fas fa-phone-alt"></i> Contact</a></li>

					<li class="nav-item"><sec:authorize access="isAuthenticated()">
							<a class="btn btn-light text-dark fw-bold"
								href="<c:url value='/logout' />"> <sec:authentication
									property="name" /> (Déconnexion) <i
								class="fas fa-sign-out-alt"> </i>
							</a>
						</sec:authorize></li>


				</ul>
			</div>
		</div>
	</nav>
</c:if>

<!-- Navbar pour le rôle FREELANCER -->
<c:if test="${u.role.role == 'FREELANCER'}">

	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		style="background: linear-gradient(45deg, rgba(70, 130, 180, 0.9), rgba(70, 130, 180, 0.9));">

		<div class="container">
			<a class="navbar-brand">FreelanceESSAT</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item active"><a class="nav-link" href="${cxt}/"><i
							class="fa-solid fa-house"></i> Home </a></li>

					<li class="nav-item"><a class="nav-link"
						href="${cxt}/profil/${u.id}"> <i class="fas fa-user"></i> Mon
							Profil
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${cxt}/projects/Freelances/${u.id}"> <i
							class="fas fa-briefcase"></i> My Applications
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${cxt}/projClients"><i class="fa-solid fa-layer-group"></i>Projets
							Disponibles</a></li>

					<li class="nav-item"><a class="nav-link" href="#about"> <i
							class="fas fa-info-circle"></i> À Propos
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#contact">
							<i class="fas fa-phone-alt"></i> Contact
					</a></li>
					<li class="nav-item"><sec:authorize access="isAuthenticated()">
							<a class="btn btn-light text-dark fw-bold"
								href="<c:url value='/logout' />"> <sec:authentication
									property="name" /> (Déconnexion) <i
								class="fas fa-sign-out-alt"></i>
							</a>
						</sec:authorize></li>
				</ul>
			</div>
		</div>
	</nav>

</c:if>

