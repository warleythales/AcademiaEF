<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>


<script>
    function confirmarExclusao(id, cpf) {
        if (confirm('Deseja realmente excluir o Aluno ' + cpf + '?')) {
            location.href = 'AlunoController?acao=excluir&id=' + id;
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

                        <div class="header">
                            <h2 class="title" align="left">Alunos</h2>
                            <hr>
                        </div>


                        <div class="content">

                            <a class="btn btn-info btn-fill pull-right" href=cadAluno.jsp>Novo Cadastro</a>
                            <br>
                            <br>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-hover table-striped" id="listaPerfil" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>

                                                <th> Id </th>
                                                <th> CPF </th>
                                                <th> Nome </th>
                                                <th> Status </th>
                                                <th></th>



                                            </tr>
                                        </thead>

                                        <tbody>
                                            <jsp:useBean id="dao" class="model.AlunoDAO"></jsp:useBean>
                                            <c:forEach var="alu" items="${dao.lista}">
                                                <tr>
                                                    <td>${alu.id}</td>
                                                    <td>${alu.cpf}</td>
                                                    <td>${alu.nome}</td>
                                                    <td>${alu.status}</td>
                                                    <c:choose>
                                                        <c:when test = "${funcionario.cargo.id == 1 }">
                                                            <td>
                                                                <a class="btn btn-primary btn-fill" href="AlunoController?acao=alterar&id=${alu.id}">
                                                                    <i class="pe-7s-pen"></i>
                                                                </a>
                                                                <a class="btn btn-success btn-fill" href="MensalidadeController?acao=listar-aluno&id_aluno=${alu.id}">
                                                                    <i class="pe-7s-piggy"></i>
                                                                </a>

                                                                <a class="btn btn-info btn-fill" href="listGerenciamentoTreinoAluno.jsp">
                                                                    <i class="pe-7s-gym"></i>
                                                                </a>
                                                                <a class="btn btn-default btn-fill" href="listAvaliacao.jsp">
                                                                    <i class="pe-7s-note2"></i>
                                                                </a>
                                                                <a class="btn btn-warning btn-fill" href="AlunoController?acao=exibir&id=${alu.id}">
                                                                    <i class="pe-7s-search"></i>
                                                                </a>

                                                            </td>
                                                        </c:when>
                                                        <c:when test = "${funcionario.cargo.id == 2 }">
                                                            <td>
                                                                <a class="btn btn-primary btn-fill" href="AlunoController?acao=alterar&id=${alu.id}">
                                                                    <i class="pe-7s-pen"></i>
                                                                </a>
                                                                <a class="btn btn-warning btn-fill" href="MensalidadeController?acao=listar-aluno&id_aluno=${alu.id}">
                                                                    <i class="pe-7s-piggy"></i>
                                                                </a>

                                                                <a class="btn btn-warning btn-fill" href="AlunoController?acao=exibir&id=${alu.id}">
                                                                    <i class="pe-7s-search"></i>
                                                                </a>

                                                            </td>
                                                        </c:when>
                                                        <c:when test = "${funcionario.cargo.id == 3 }">
                                                            <td>

                                                                <a class="btn btn-warning btn-fill" title="Mensalidades" href="MensalidadeController?acao=listar-aluno&id_aluno=${alu.id}">
                                                                    <i class="pe-7s-piggy"></i>
                                                                </a>

                                                                <a class="btn btn-info btn-fill" title="Treinos" href="listGerenciamentoTreinoAluno.jsp">
                                                                    <i class="pe-7s-gym"></i>
                                                                </a>
                                                                <a class="btn btn-default btn-fill" title="Avaliações" href="listAvaliacao.jsp">
                                                                    <i class="pe-7s-note2"></i>
                                                                </a>
                                                                <a class="btn btn-warning btn-fill" href="AlunoController?acao=exibir&id=${alu.id}">
                                                                    <i class="pe-7s-search"></i>
                                                                </a>

                                                            </td>
                                                        </c:when>
                                                    </c:choose>



                                                </tr>
                                            </c:forEach>
                                        </tbody>


                                    </table>
                                </div>
                            </div>



                            <div class="clearfix"></div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

</body>




<%@include file="rodape.jsp" %>

