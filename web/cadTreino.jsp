

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

                        <div class="title-container text-center">
                            <h3 class="title">Aluno:</h3> <br>

                            <h3 class="title">Novo Exercício:</h3>
                        </div>

                        <form action="ExercicioControle" method="POST">






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
                                        <label>Série</label>
                                        <input type="text" class="form-control" id="serie" name="serie" placeholder="Série" required value="${a.serie}">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Repetição</label>
                                        <input type="text" class="form-control" id="repeticao" name="repeticao" placeholder="Repetição" required value="${a.repeticao}">
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>

                </div>

            </div>
            <div class="navbar-header pull-right">
                <div class="container-fluid">
                    <button class="btn btn-success btn-fill">Gravar</button>

                </div>
            </div>
            <br>
            <br>
            <br>
            <div class="row">

                <div class="col-md-12">

                    <div class="card">

                        <div class="content">

                            <div class="title-container text-center">
                                <h3>Exercício</h3>
                            </div>



                            <div class="row">

                                <div class="col-md-12">
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover table-striped">

                                            <tr>


                                                <th>Aparelho</th>
                                                <th>Peso</th>
                                                <th>Série</th>
                                                <th>Repetição</th>
                                                <th></th>
                                            </tr>

                                            <tbody>
                                                <jsp:useBean id="dao" class="model.AcademiaDAO"></jsp:useBean>
                                                <c:forEach var="academia" items="${dao.lista}">
                                                    <tr>



                                                        <td>${treino.aparelho}</td>
                                                        <td>${treino.peso}</td>
                                                        <td>${treino.serie}</td>
                                                        <td>${treino.repeticao}</td>
                                                        <td>

                                                            <button class="btn btn-danger btn-fill pull-right" onclick="confirmarExclusao(${academia.id}, '${academia.cnpj}')">
                                                                <i class="pe-7s-trash"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>



                        </div>
                        <div class="clearfix"></div>

                    </div>




                    <a class="btn btn-warning btn-fill pull-left" href=listGerenciamentoTreinoAluno.jsp>Voltar</a>

                    <div class="navbar-header pull-right">
                        <div class="container-fluid">
                            <a class="btn btn-primary pull-right " href=cadTreinoDescricao.jsp>Finalizar</a>
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