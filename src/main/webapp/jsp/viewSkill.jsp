<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        <h5 class="display-5">Skill</h5>
        <h6 class="display-6">Ecco una lista delle mie skills:</h6>
        <table class="table table-striped table-responsive">
            <thead>
            <tr>
                <th scope="col">Categoria</th>
                <th scope="col">Nome</th>
                <th scope="col">Descrizione</th>
                <th scope="col"></th>
                <sec:authorize access="hasRole('ADMIN')">
                    <th scope="col"></th>
                </sec:authorize>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${Skills}" var="Skills">
                <tr>
                    <td><c:out value="${Skills.getCategoria().getNome()}"/></td>
                    <td><c:out value="${Skills.getNome()}"/></td>
                    <td><c:out value="${Skills.getDescrizione()}"/></td>
                    <td>
                        <form action="${pageContext.request.contextPath}/skill/update/page" method="post" class="d-flex">
                            <input class="form-control me-2" type="hidden" name="id"
                                   value="<c:out value="${Skills.getId()}"/>">
                            <button type="submit" class="border-0 " style="color: black; background-color: transparent">
                                <i class="bi bi-pencil-square"></i>
                            </button>
                        </form>
                    </td>
                    <sec:authorize access="hasRole('ADMIN')">
                        <td>
                            <form action="${pageContext.request.contextPath}/skill/delete" method="post" class="d-flex">
                                <input class="form-control me-2" type="hidden" name="id"
                                       value="<c:out value="${Skills.getId()}"/>">
                                <button type="submit" class="border-0 " style="color: black; background-color: transparent">
                                    <i class="bi bi-trash3"></i>
                                </button>
                            </form>
                        </td>
                    </sec:authorize>
                    <td>
                        <c:if test="${id == Skills.getId()}">
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