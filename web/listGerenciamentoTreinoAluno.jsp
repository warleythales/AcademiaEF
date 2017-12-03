

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
                <div class="col-md-15">

                    <div class="card">

                        <div class="header">
                            <h2 class="title">Lista de Treinos</h2>
                            <hr>
                            <h4 class="title">Aluno: ${alu.nome} </h4>
                        </div>

                        <div class="content">
                            <a class="btn btn-info btn-fill pull-right" href=cadTreino.jsp>Novo Treino</a>
                            <br>
                            <br>
                            <br>


                            <div class="row">
                                <div class="col-md-12">
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover table-striped" id="listaPerfil" cellspacing="0" width="100%">
                                            <thead>
                                            <th>ID</th>
                                            <th>Data de Inicio</th>
                                            <th>Data do Termino</th>
                                            <th></th>

                                            </thead>
                                            <tbody>
                                                <c:forEach var="treino" items="${alu.meusTreinos}">
                                                    <tr>

                                                        <td>${treino.id}</td>
                                                        <td><fmt:formatDate value="${treino.data_inicio}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
                                                        <td><fmt:formatDate value="${treino.data_fim}" pattern="dd/MM/yyyy"></fmt:formatDate></td>

                                                            <td>
                                                                <a class="btn btn-primary btn-fill" href="TreinoController?acao=alterar&id=${treino.id}">
                                                                <i class="pe-7s-pen"></i>
                                                            </a>
                                                            <a class="btn btn-warning btn-fill" href="TreinoController?acao=exibir&id=${treino.id}">
                                                                <i class="pe-7s-search"></i>
                                                            </a>
                                                        </td>



                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <a href="listAluno.jsp" class="btn btn-warning btn-fill ">Voltar</a>
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