<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Title -->
        <title>Christian Bafaro: Crea Skill</title>

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
            <h5 class="display-5">Crea una nuova Skill:</h5>

            <form action="${pageContext.request.contextPath}/skill/create" method="post">
                <div class="mb-3">
                    <label for="nome" class="form-label">Nome:</label>
                    <input type="text" name="nome" class="form-control" id="nome" aria-describedby="nome">
                </div>
                <div class="mb-3">
                    <label for="descrizione" class="form-label">Descrizione:</label>
                    <input type="text" name="descrizione" class="form-control" id="descrizione">
                </div>
                <div class="mb-3">
                    <label for="idCat" class="form-label">ID della categoria:</label>
                    <select type="text" name="idCat" class="form-control" id="idCat">
                        <c:forEach items="${Categorie}" var="Categorie">
                            <option><c:out value="${Categorie.getNome()}"/></option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Add</button>

                <c:if test="${operation == true}">
                    <div class="alert alert-success" role="alert">
                        Skill creata con successo.
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