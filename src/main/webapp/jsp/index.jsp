<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Title -->
    <title>Christian Bafaro</title>

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
        <h5 class="display-5">Christian Bafaro</h5>

        <img src="../../resources/static/images/IronMan.jpg" class="rounded mx-auto d-block"
             alt="Immagine personale" sizes="70%">

        <p>Mi chiamo Christian, ho 24 anni, e la mia vita non è come quella di qualsiasi adolescente di adesso.<br>
            Ho deciso di studiare e lavorare, nonostante non sia una passeggiata, continuo a testa alta,
            perché sono del pensiero, che il nostro futuro è come un traguardo da raggiungere,
            devi lavorarci su se vuoi vincere la battaglia.<br>
            Dire che sono una persona determinata è dire poco, chi mi conosce lo sa bene,
            i miei obiettivi vengono prima di tutto e una volta che mi concentro sul raggiungerli,
            nessuno può fermarmi.<br>
            Ma non posso parlare di me, senza dirvi che oltre ad essere determinato, sono solare,
            non c’è una volta in cui mi vedrete senza sorriso. <br>
            Sono divertente, così dicono, quindi il mio sorriso è contagioso, faccio sorridere anche gli altri con poco.<br>
            Sono preciso, anche puntuale se vogliamo dirla tutta, odio essere in ritardo.<br>
            Ma direi che elencare i propri pregi sappiamo farlo tutti,
            non vi dirò quali sono i miei difetti, preferisco li scopriate da soli.</p>
    </article>

    <article>
        <h6 class="display-6">Vediamo ora le categorie delle Skill in mio possesso:</h6>
        <table class="table table-striped table-responsive">
            <thead>
                <tr>
                    <th scope="col">Nome</th>
                    <th scope="col">Descrizione</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${Categorie}" var="Categorie">
                    <tr>
                        <td><c:out value="${Categorie.getNome()}"/></td>
                        <td><c:out value="${Categorie.getDescrizione()}"/></td>
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