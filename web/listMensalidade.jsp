<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id, valor_pago) {
        if (confirm('Deseja realmente excluir a mensalidade ' + valor_pago + '?')) {
            location.href = 'MensalidadeController?acao=excluir&id=' + id;
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
                    <h3 class="title">Mensalidade</h3>
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
                                <a class="btn btn-info btn-fill pull-right" href=cadMensalidade.jsp>Novo Cadastro</a>
                                <br>
                                <br>
                                <br>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="content table-responsive table-full-width">
                                            <table class="table">
                                                <tr>

                                                    <th>Id</th>
                                                    <th>Valor Pago </th>
                                                    <th>Data de Pagamento </th>
                                                    <th>Data de Vencimento </th>
                                                    <th>Status</th>
                                                    <th>Aluno </th>
                                                    <th>Funcionário</th>
                                                    <th></th>
                                                </tr>
                                                <jsp:useBean id="mdao" class="model.MensalidadeDAO"></jsp:useBean>
                                                <c:forEach var="m" items="${mdao.lista}">
                                                    <tr>

                                                        <td>${m.id}</td>
                                                        <td>${m.valor_pago}</td>
                                                        <td><fmt:formatDate value="${m.data_pag}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
                                                        <td><fmt:formatDate value="${m.data_venc}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
                                                        <td>${m.status}</td>
                                                        <td>${m.aluno.nome}</td>
                                                        <td>${m.funcionario.matricula}</td>
                                                        <td>
                                                            <a class="btn btn-primary btn-fill" href="MensalidadeController?acao=alterar&id=${m.id}">
                                                                <i class="pe-7s-pen"></i>
                                                            </a>
                                                            <button class="btn btn-danger btn-fill" onclick="confirmarExclusao(${m.id}, '${m.id}')">
                                                                <i class="pe-7s-trash "></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
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
    </div>
</div>

</body>
<%@include file="rodape.jsp" %>
