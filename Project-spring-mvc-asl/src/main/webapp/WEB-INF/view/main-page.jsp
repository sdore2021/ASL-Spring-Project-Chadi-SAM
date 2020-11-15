<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page errorPage="error.jsp"%>

<c:set var="user" value="${user}"/>
<c:set var="context" value="${pageContext.request.contextPath}" />


<html>
<head>
    <meta charset="utf-8">
    <title>Partage de competences</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"  crossorigin="anonymous">
</head>

<body>
<nav class="navbar navbar-expand-sm">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="${context}/service/list">Accueil</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${context}/service/form">Proposer Un Service</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${context}/user/myservices">Mes Services</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${context}/user/purchases">Achats</a>
        </li>
        <li class="nav-item">
            <c:if test="${user.role eq 'mod' || user.role eq 'admin'}">
                <a class="nav-link" href="${context}/service/moderation">Moderation</a>
            </c:if>
        </li>
        <li class="nav-item">
            <c:if test="${user.role eq 'admin'}">
                <a class="nav-link" href="${context}/user/list">Administration</a>
            </c:if>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${context}/logout">Logout</a>
        </li>
        <li class="nav-item">
            <span class="nav-link">${user.username} : ${user.getPoints()} </span>
        </li>
    </ul>
</nav>

<h1 class="text-center my-2">Plateforme de Partage de Competences</h1>

<div class="container">
        <div class="card card-default">
            <div class="card-header">
                <form method="post" class="form-inline my-2 my-lg-0" action="${context}/service/search">
                    <input class="form-control mr-sm-2" type="search" name="title" placeholder="Title" aria-label="Search">
                    <input class="form-control mr-sm-2" type="search" name="tags" placeholder="Tags" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Provider</th>
                        <th scope="col">Title</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="services" items="${services}">
                            <c:if test="${services.available eq true}">
                                <c:if test="${services.done eq false}">
                                    <tr>
                                            <th scope="row">${services.provider.getUsername()}</th>
                                            <td>${services.title}</td>
                                            <td>${services.category}</td>
                                            <td>${services.price}</td>
                                            <td>
                                                <c:if test="${services.clients.size() < services.limit}">
                                                    <c:if test="${services.provider.username ne user.username}">
                                                        <c:if test="${services.price < user.points}">
                                                            <a href="${context}/service/buy/${services.id}">acheter</a>
                                                        </c:if>
                                                    </c:if>
                                                </c:if>
                                                <a href=${context}/service/${services.id}>consulter</a
                                            </td>
                                        </tr>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
</div>
</body>
</html>
