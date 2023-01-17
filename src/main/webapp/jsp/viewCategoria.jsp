<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Title -->
    <title>Christian Bafaro: Skill</title>

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
        <h5 class="display-5">Categorie</h5>
        <h6 class="display-6">Ecco una lista delle categorie:</h6>
        <table class="table table-striped table-responsive">
            <thead>
            <tr>
                <th scope="col">Nome</th>
                <th scope="col">Descrizione</th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${Categorie}" var="Categorie">
                <tr>
                    <td><c:out value="${Categorie.getNome()}"/></td>
                    <td><c:out value="${Categorie.getDescrizione()}"/></td>
                    <td>
                        <form action="${pageContext.request.contextPath}/categoria/update/page" method="post" class="d-flex">
                            <input class="form-control me-2" type="hidden" name="id"
                                   value="<c:out value="${Categorie.getId()}"/>">
                            <button type="submit" class="border-0 " style="color: black; background-color: transparent">
                                <i class="bi bi-pencil-square"></i>
                            </button>
                        </form>
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}/categoria/delete" method="post" class="d-flex">
                            <input class="form-control me-2" type="hidden" name="id"
                                   value="<c:out value="${Categorie.getId()}"/>">
                            <button type="submit" class="border-0 " style="color: black; background-color: transparent">
                                <i class="bi bi-trash3"></i>
                            </button>
                        </form>
                    </td>
                    <td>
                        <c:if test="${id == Categorie.getId()}">
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
                Eliminazione con successo.
            </div>
        </c:if>

        <c:if test="${delete == false}">
            <div class="alert alert-danger" role="alert">
                ID non trovato.
            </div>
        </c:if>
    </article>
</div>
</body>

<footer>
    <jsp:include page="scriptJS.jsp"/>
</footer>
</html>