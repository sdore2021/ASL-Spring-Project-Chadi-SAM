<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page errorPage="error.jsp"%>
<c:set var="user" value="${user}"/>
<c:set var="context" value="${pageContext.request.contextPath}" />


<html>
<head>
    <meta charset="utf-8">
    <title>Administration</title>
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


<h1 class="text-center my-2">Administration</h1>

<div class="container">
    <div class="card card-default">
        <div class="card-body">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Username</th>
                    <th scope="col">Email</th>
                    <th scope="col">Role</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="tempuser" items="${users}">
                    <tr>
                        <td>${tempuser.username}</td>
                        <td>${tempuser.email}</td>
                        <td>${tempuser.role}</td>
                        <td>
                            <c:if test="${user.role ne 'BANNED'}">
                                <a href="${context}/user/ban/${tempuser.username}">Bannir</a>
                                <c:if test="${user.role ne 'ADMIN'}">
                                    <a href="${context}/user/promote/${tempuser.username}">Promouvoir</a>
                                </c:if>
                            </c:if>
                            <c:if test="${user.role eq 'BANNED'}">
                                <a href="${context}/user/unban/${tempuser.username}">Débannir</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
