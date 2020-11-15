<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <div class="card-body">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Title</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="services" items="${services}">
                    <c:if test="${services.done eq false}">
                        <tr>
                            <td>${services.title}</td>
                            <td>${services.category.name}</td>
                            <td>${services.price}</td>
                            <td>
                                <a href="${context}/service/${services.id}">consulter</a>
                                <c:if test="${services.available eq true}">
                                    <a href="${context}/service/finish/${services.id}">finir</a>
                                </c:if>
                                <a href="${context}/service/delete/${services.id}">annuler</a>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
