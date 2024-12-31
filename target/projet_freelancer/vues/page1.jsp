<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="fr">
<head>
<spring:url value="src/bootstrap" var="bts"></spring:url>
	<link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Freelance Projects</title>
    <style>
        body {
            padding-top: 56px;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

<header class="bg-primary text-white text-center py-5">
    <div class="container">
        <h1>Bienvenue sur FreelanceESSAT</h1>
        <p class="lead">Connectez-vous avec des freelancers de talent et trouvez le projet idéal.</p>
        <a class="btn btn-light btn-lg" href="#projects">Voir les Projets</a>
    </div>
</header>

<section id="projects" class="py-5">
    <div class="container">
        <h2 class="text-center mb-4">Projets Récents</h2>
        <div class="row">
        
        
       	   <c:forEach  items="${projs }" var="p" >
             <div class="col-md-4">
                <div class="card mb-4">
                    <img src="https://via.placeholder.com/350" class="card-img-top" alt="Projet 1">
                    <div class="card-body">
                        <h5 class="card-title">${p.titre }</h5>
                        <p class="card-text">${p.description }]</p>
                        <a href="#" class="btn btn-primary">Voir le Projet</a>
                    </div>
                </div>
              </div>  
            </c:forEach>    
            
           
           
        </div>
    </div>
</section>

<footer class="bg-light py-4">
    <div class="container text-center">
        <p>&copy; 2024 FreelanceESSAT. Tous droits réservés.</p>
        <a href="#about">À Propos</a> | 
        <a href="#contact">Contact</a>
    </div>
</footer>


</body>
</html>
