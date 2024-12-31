<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

	<sec:authentication property="principal" var="u" />
	
	
	<c:if test="${ u.role.role=='ROLE_CLIENT'}">
	<nav class="navbar navbar-expand-lg navbar-light bg-warning fixed-top">
	</c:if>
	
	<c:if test="${ u.role.role=='ROLE_FREELANCER'}">
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
	</c:if>
	




    <div class="container">
        <a class="navbar-brand" href="#">FreelanceESSAT</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#projects">Projets</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#about">À Propos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#contact">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-primary" href="#login">Se Connecter</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

	
