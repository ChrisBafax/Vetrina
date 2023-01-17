<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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