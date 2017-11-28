<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id) {
        if (confirm('Deseja realmente excluir o treino ' + id + '?')) {
            location.href = 'TreinoController?acao=excluir&id=' + id;
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

    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <%@include file="menuCelular.jsp" %>
                    <h3 class="title">Treino</h3>
                </div>
                <%@include file="menuGlobal.jsp" %>


            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="content">
                                <a class="btn btn-info btn-fill pull-right" href=cadTreino1.jsp>Novo Cadastro</a>
                                <br>
                                <br>
                                <br>


                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="content table-responsive table-full-width">
                                            <table class="table table-hover table-striped" id="listaPerfil" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>

                                                        <th>ID</th>
                                                        <th>Data Inicio</th>
                                                        <th>Data Fim</th>
                                                        <th>Aluno</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <jsp:useBean id="dao" class="model.TreinoDAO"></jsp:useBean>
                                                    <c:forEach var="treino" items="${dao.lista}">
                                                        <tr>

                                                            <td>${treino.id}</td>
                                                            <td><fmt:formatDate value="${treino.data_inicio}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
                                                            <td><fmt:formatDate value="${treino.data_fim}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
                                                            <td>${treino.aluno.nome}</td>
                                                            <td>
                                                                <a class="btn btn-primary btn-fill" href="TreinoController?acao=alterar&id=${treino.id}">
                                                                    <i class="pe-7s-pen"></i>
                                                                </a>
                                                                <button class="btn btn-danger btn-fill" onclick="confirmarExclusao(${treino.id})">
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



                                <div class="clearfix"></div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="container-fluid">
            <a class="btn btn-warning btn-fill" href=listAluno.jsp>Voltar</a>
        </div>
    </div>
</div>

</body>




<%@include file="rodape.jsp" %>