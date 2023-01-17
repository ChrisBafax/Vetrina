<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Title -->
    <title>Christian Bafaro: Aggiorna Skill</title>

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
    <h5 class="display-5">Aggiorna le informazioni della Skill</h5>

    <form action="${pageContext.request.contextPath}/skill/update" method="post">
        <div class="mb-3">
            <label for="id" class="form-label">Aggiorna la Skill con ID:</label>
            <input type="text" name="id" class="form-control" id="id"
                   aria-describedby="id"
                   value="<c:out value="${id}"/>" disabled readonly>
        </div>
        <div class="mb-3">
            <label for="nome" class="form-label">Nuovo Nome:</label>
            <input type="text" name="nome" class="form-control" id="nome"
                   aria-describedby="nome" value="<c:out value="${Skill.getNome()}"/>">
        </div>
        <div class="mb-3">
            <label for="descrizione" class="form-label">Nuova Descrizione:</label>
            <input type="text" name="descrizione" class="form-control" id="descrizione"
                   aria-describedby="descrizione"
                   value="<c:out value="${Skill.getDescrizione()}"/>">
        </div>
        <div class="mb-3">
            <label for="idCat" class="form-label">Categoria:</label>
            <select type="text" name="idCat" class="form-control" id="idCat">
                <c:forEach items="${Categorie}" var="Categorie">
                    <c:if test="${Categoria==Categorie}">
                        <option value="${Categoria}" selected><c:out value="${Categorie.getNome()}"/></option>
                    </c:if>
                    <c:if test="${Categoria!=Categorie}">
                        <option><c:out value="${Categorie.getNome()}"/></option>
                    </c:if>
                </c:forEach>
            </select>
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