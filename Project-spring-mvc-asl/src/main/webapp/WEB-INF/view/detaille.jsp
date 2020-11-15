
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="service" value="${service}"/>
<c:set var="context" value="${pageContext.request.contextPath}" />



<!DOCTYPE html>
<html>

<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"  crossorigin="anonymous">

</head>

<body>
<div class="container">
    <form action="#" method="post">
        <div class="row justify-content-center my-5">
            <div class="col-md-5">
                <div class="card card-default">
                    <div class="card-header">
                        Detail de ce Service
                    </div>
                        <div class="card card-body">
                            <h5 class="card-title">${service.title}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">${service.category}</h6>
                            <p class="card-text">${service.desc}</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Price : ${service.price} pts</li>
                            <li class="list-group-item">Limit : ${service.clients.size()} / ${service.limit}</li>
                            <li class="list-group-item">Disponible : ${service.available}</li>
                        </ul>
                </div>
                <div class="form-group text-center card-footer">
                    <p class="card-text">Proposer par : ${service.provider.getUsername()}</p>
                </div>

                <a class="" href="${context}/service/list">Back to home</a>
            </div>

        </div>
    </form>
</div>
</body>
</html>