<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Title -->
    <title>navbar</title>
</head>

<body>

<nav class="navbar navbar-expand-lg fixed-top " style="background-color: #e3f2fd;">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">ChrisBafax</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">

                <!-- First option -->
                <li class="nav-item">
                    <a class="nav-link" aria-current="page"
                       href="${pageContext.request.contextPath}/home">
                        Home
                    </a>
                </li>

                <!-- Second option -->
                <li class="nav-item">
                    <a class="nav-link" aria-current="page"
                       href="${pageContext.request.contextPath}/project">
                        Progetti
                    </a>
                </li>

                <!-- Third option -->
                <li class="nav-item">
                    <a class="nav-link" aria-current="page"
                       href="${pageContext.request.contextPath}/skill">
                        Skills
                    </a>
                </li>

                <sec:authorize access="isAuthenticated()">
                <!-- Fourth option -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Menu
                    </a>
                    <ul class="dropdown-menu">
                        <!-- First option -->
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="${pageContext.request.contextPath}/categoria/create">
                                Crea una Categoria
                            </a>
                        </li>

                        <!-- Second option -->
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="${pageContext.request.contextPath}/categoria/view">
                                Vedi le Categorie
                            </a>
                        </li>

                        <!-- Third option -->
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="${pageContext.request.contextPath}/skill/create">
                                Crea una Skill
                            </a>
                        </li>

                        <!-- Fourth option -->
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="${pageContext.request.contextPath}/skill/view">
                                Vedi le Skill
                            </a>
                        </li>

                        <!-- Fifth option -->
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="${pageContext.request.contextPath}/project/create">
                                Crea Progetto
                            </a>
                        </li>

                        <!-- Sixth option -->
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="${pageContext.request.contextPath}/project/view">
                                Vedi i Progetti
                            </a>
                        </li>
                    </ul>
                </li>
                </sec:authorize>
            </ul>

            <ul class="navbar-nav ms-auto">
                <sec:authorize access="!isAuthenticated()">
                <!-- Login -->
                <li class="nav-item">
                    <a class="nav-link" aria-current="page"
                       href="${pageContext.request.contextPath}/login">
                        <i class="bi bi-person-circle"></i> Accedi
                    </a>
                </li>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                <!-- Logout -->
                <li class="nav-item navbar-right">
                    <a class="nav-link" aria-current="page"
                       href="${pageContext.request.contextPath}/logout">
                        <i class="bi bi-box-arrow-left"></i> Esci
                    </a>
                </li>
                </sec:authorize>
            </ul>

        </div>
    </div>
</nav>

</body>
</html>
