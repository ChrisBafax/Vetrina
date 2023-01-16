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
        <h5 class="display-5">Skill</h5>
        <h6 class="display-6">Ecco una lista delle mie skills:</h6>
        <table class="table table-striped table-responsive">
            <thead>
            <tr>
                <th scope="col">Categoria</th>
                <th scope="col">Nome</th>
                <th scope="col">Descrizione</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${Skills}" var="Skills">
                <tr>
                    <td><c:out value="${Skills.getCategoria().getNome()}"/></td>
                    <td><c:out value="${Skills.getNome()}"/></td>
                    <td><c:out value="${Skills.getDescrizione()}"/></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </article>
</div>
</body>

<footer>
    <jsp:include page="scriptJS.jsp"/>
</footer>
</html>