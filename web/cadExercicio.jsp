

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id, cpf) {
        if (confirm('Deseja realmente excluir o aluno ' + cpf + '?')) {
            location.href = 'AcademiaController?acao=excluir&id=' + id;
        }
    }
</script>
</head>
<body>

    <div class="wrapper">
        <%@include file="designermenuesquerdo.jsp" %>
        <div class="sidebar-wrapper">
            <%@include file="nomeAcademia.jsp" %>

            <%@include file="menuesquerdo.jsp" %>

        </div>
    </div>

    <%@include file="menuSuperiorCompleto.jsp" %>


    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">

                        <div class="container-fluid">
                            <div class="header">
                                <td> <h2 class="title">  Treino: ${a.trei.descricao}</td> </h2>
                                <hr>
                                <h4 class="title"> Novo Exercicio: </h4>
                            </div>


                            <form action="ExercicioController" method="POST">

                                <input type="hidden" name="id" value="${a.id}" />

                                <div class="form-group col-sm-3">
                                    <label for="treino" class="control-label"> Treino </label>
                                    <jsp:useBean id="TreinoDAO" class="model.TreinoDAO"></jsp:useBean>
                                        <select id="treino" name="treino" class="form-control" required>
                                            <option></option>
                                        <c:forEach var="treino" items="${TreinoDAO.lista}">
                                            <c:if test="${f.treino.id == treino.id}">
                                                <option value="${treino.id}" selected>${treino.descricao}</option>
                                            </c:if>
                                            <c:if test="${f.treino.id != treino.id}">
                                                <option value="${treino.id}">${treino.descricao}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>


                                <input type="hidden" name="id" value="${a.id}" />
                                <div class="form-group col-sm-3">
                                    <label for="aparelho" class="control-label"> Aparelho </label>
                                    <jsp:useBean id="AparelhoDAO" class="model.AparelhoDAO"></jsp:useBean>
                                        <select id="aparelho" name="aparelho" class="form-control" required>
                                            <option></option>
                                        <c:forEach var="aparelho" items="${AparelhoDAO.lista}">
                                            <c:if test="${f.aparelho.id == aparelho.id}">
                                                <option value="${aparelho.id}" selected>${aparelho.nome}</option>
                                            </c:if>
                                            <c:if test="${f.aparelho.id != aparelho.id}">
                                                <option value="${aparelho.id}">${aparelho.nome}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>


                                <div class="for col-sm-3">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Peso</label>
                                            <input type="text" class="form-control" id="peso" name="peso" placeholder="Peso" required value="${a.peso}">
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Repetição</label>
                                            <input type="text" class="form-control" id="repetcoes" name="repetcoes" placeholder="Repetição" required value="${a.repetcoes}">
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Série</label>
                                            <input type="text" class="form-control" id="serie" name="serie" placeholder="Série" required value="${a.serie}">
                                        </div>
                                    </div>
                                </div>
                                <div class="for col-sm-7">
                                    <button class="btn btn-success btn-fill">Finalizar</button>

                                </div>
                            </form>


                        </div>
                    </div>
                    <a class="btn btn-warning btn-fill pull-left" href="javascript:history.back()">Voltar</a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>




</div>
</div>

</body>




<%@include file="rodape.jsp" %>