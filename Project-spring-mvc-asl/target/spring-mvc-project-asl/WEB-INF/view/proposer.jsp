<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />





<!DOCTYPE html>
<html>

<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"  crossorigin="anonymous">

</head>

<body>
<div class="container">
    <form action="create" method="post" modelAttribute="service">
        <div class="row justify-content-center my-5">
            <div class="col-md-5">
                <div class="card card-default">
                    <div class="card-header">
                        Proposer un service
                    </div>
                    <div class="card card-body">
                        <div class="form-group form-inline">
                            <label class="mr-2 my-1" for="category">Categorie :</label>
                            <select class="custom-select ml-auto col-7" id="category">
                            </select>
                        </div>
                        <div class="form-group form-inline">
                            <label class="mr-2 my-1" for="title">Titre :</label>
                            <input type="text" path="title" name="title" id="title" placeholder="title" class="form-control ml-auto col-7" />
                        </div>
                        <div class="form-group form-inline">
                            <label class="mr-2 my-1" for="desc">Description :</label>
                            <textarea  class="form-control ml-auto col-7" id="desc" path="desc" name="desc" rows="5" cols="40" placeholder="placer votre text ici"></textarea>
                        </div>
                        <div class="form-group form-inline">
                            <label class="mr-2 my-1" for="limit">Participants max :</label>
                            <input type="number" name="limit" id="limit" path="limit"  class="form-control ml-auto col-7" />
                        </div>
                        <div class="form-group form-inline">
                            <label class="mr-2 my-1" for="tags">les Tags (separateur ,) :</label>
                            <textarea  class="form-control ml-auto col-7" id="tags" name="tags" path="tags" rows="2" cols="40" placeholder="ATTENTION EXEMPLE:css,java,php"></textarea>
                        </div>
                        <div class="form-group form-inline">
                            <label class="mr-2 my-1" for="price">Nbr de Points :</label>
                            <input type="number" name="price" id="price" path="price" class="form-control ml-auto col-7" />
                        </div>
                    </div>
                </div>
                <div class="form-group text-center card-footer">
                    <button type="submit" class="bnt bnt-primary">Proposer</button>
                </div>
                <a class="" href="${context}/service/list">Back to home</a>
            </div>

        </div>
    </form>
</div>
</body>
</html>