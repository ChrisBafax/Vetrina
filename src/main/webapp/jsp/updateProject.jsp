<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Title -->
    <title>Christian Bafaro: Aggiorna Progetto</title>

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
    <h5 class="display-5">Aggiorna le informazioni del Progetto</h5>

    <form action="${pageContext.request.contextPath}/project/update" method="post">
        <div class="mb-3">
            <label for="id" class="form-label">Aggiora il Progetto con ID:</label>
            <input type="text" name="id" class="form-control" id="id" aria-describedby="id" value="<c:out value="${id}"/>" disabled readonly>
        </div>
        <div class="mb-3">
            <label for="nome" class="form-label">Nuovo Nome:</label>
            <input type="text" name="nome" class="form-control" id="nome" aria-describedby="nome">
        </div>
        <div class="mb-3">
            <label for="descrizione" class="form-label">Nuova Descrizione:</label>
            <input type="text" name="descrizione" class="form-control" id="descrizione" aria-describedby="descrizione">
        </div>
        <div class="mb-3">
            <label for="link" class="form-label">Nuovo Link per la Repository:</label>
            <input type="text" name="link" class="form-control" id="link" aria-describedby="link">
        </div>
        <input class="form-control me-2" type="hidden" name="id"
               value="<c:out value="${id}"/>">
        <button type="submit" class="btn btn-primary">Update</button>

    </form>
</div>
</body>

<footer>
    <jsp:include page="scriptJS.jsp"/>
</footer>
</html>