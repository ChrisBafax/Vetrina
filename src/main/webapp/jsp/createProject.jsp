<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Title -->
    <title>Christian Bafaro: Crea Progetto</title>

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
        <h5 class="display-5">Crea un nuovo Progetto:</h5>

        <form action="${pageContext.request.contextPath}/categoria/create" method="post">
            <div class="mb-3">
                <label for="nome" class="form-label">Nome:</label>
                <input type="text" name="nome" class="form-control" id="nome" aria-describedby="nome">
            </div>
            <div class="mb-3">
                <label for="descrizione" class="form-label">Descrizione:</label>
                <input type="text" name="descrizione" class="form-control" id="descrizione">
            </div>
            <div class="mb-3">
                <label for="link" class="form-label">Link:</label>
                <input type="text" name="link" class="form-control" id="link">
            </div>
            <button type="submit" class="btn btn-primary">Add</button>

            <c:if test="${operation == true}">
                <div class="alert alert-success" role="alert">
                    Project creata con successo.
                </div>
            </c:if>
        </form>
    </article>
</div>
</body>

<footer>
    <jsp:include page="scriptJS.jsp"/>
</footer>
</html>