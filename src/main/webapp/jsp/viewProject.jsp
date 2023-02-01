<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Title -->
    <title>Christian Bafaro: Progetti</title>

    <!-- Style of the page -->
    <jsp:include page="style.jsp"/>
</head>

<body>
<!-- Header of the Page -->
<header>
    <!-- Navbar -->
    <jsp:include page="navbar.jsp"/>
</header>

<div class="container ml-5 mr-5">
    <article>
        <h5 class="display-5">Progetti</h5>
        <h6 class="display-6">Ecco una lista dei miei progetti:</h6>
        <table class="table table-striped table-responsive">
            <thead>
            <tr>
                <th scope="col">Nome</th>
                <th scope="col">Descrizione</th>
                <th scope="col">Link <i class="bi bi-github"></i></th>
                <th scope="col"></th>
                <sec:authorize access="hasRole('ADMIN')">
                    <th scope="col"></th>
                </sec:authorize>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${Projects}" var="Projects">
                <tr>
                    <td><c:out value="${Projects.getNome()}"/></td>
                    <td><c:out value="${Projects.getDescrizione()}"/></td>
                    <td><a href="<c:out value="${Projects.getLink()}"/>" target="_blank">
                        Repository</a>
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}/project/update/page" method="post"
                              class="d-flex">
                            <input class="form-control me-2" type="hidden" name="id"
                                   value="<c:out value="${Projects.getId()}"/>">
                            <button type="submit" class="border-0 " style="color: black; background-color: transparent">
                                <i class="bi bi-pencil-square"></i>
                            </button>
                        </form>
                    </td>
                    <sec:authorize access="hasRole('ADMIN')">
                        <td>
                            <form action="${pageContext.request.contextPath}/project/delete" method="post"
                                  class="d-flex">
                                <input class="form-control me-2" type="hidden" name="id"
                                       value="<c:out value="${Projects.getId()}"/>">
                                <button type="submit" class="border-0 "
                                        style="color: black; background-color: transparent">
                                    <i class="bi bi-trash3"></i>
                                </button>
                            </form>
                        </td>
                    </sec:authorize>
                    <td>
                        <c:if test="${id == Projects.getId()}">
                            <p role="alert" style="color: green; font-size: large">
                                <i class="bi bi-check-lg"></i>
                            </p>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </article>
    <article>
        <c:if test="${delete == true}">
            <div class="alert alert-success" role="alert">
                Eliminazione avvenuta con successo.
            </div>
        </c:if>

        <c:if test="${delete == false}">
            <div class="alert alert-danger" role="alert">
                L'ID che vuoi eliminare non è stato trovato.
            </div>
        </c:if>
    </article>
</div>
</body>

<footer>
    <jsp:include page="scriptJS.jsp"/>
</footer>
</html>