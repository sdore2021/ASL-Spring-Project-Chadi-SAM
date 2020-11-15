<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <form action="user/create" method="post" modelAttribute="user" >
              <div class="row justify-content-center my-5">
                  <div class="col-md-5">
                      <div class="card card-default">
                          <div class="card-header">
                              Register Form
                          </div>
                          <div class="card card-body">
                              <div class="form-group form-inline">
                                  <label class="mr-2 my-1" for="email">Email :</label>
                                  <input type="text" path="email" name="email" id="email" placeholder="email" class="form-control ml-auto" />
                              </div>
                              <div class="form-group form-inline">
                                  <label class="mr-2 my-1" for="username">Pseudo</label>
                                  <input type="text" path="username" name="username" id="username" placeholder="speudo" class="form-control ml-auto" />
                              </div>
                              <div class="form-group form-inline">
                                  <label class="mr-2 my-1" for="password">Password</label>
                                  <input type="password" path="password" name="password" id="password" placeholder="password" class="form-control ml-auto" />
                              </div>
                              </div>
                          </div>
                          <div class="form-group text-center card-footer">
                              <button type="submit" class="bnt bnt-primary">s'inscrire</button>
                          </div>
                      <a class="" href="${context}/login">Back to login</a>
                     </div>
                  
              </div>
        </form>
    </div>
</body>
</html>








