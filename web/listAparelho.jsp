<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id, numero) {
        if (confirm('Deseja realmente excluir o aparelho ' + numero + '?')) {
            location.href = 'AparelhoController?acao=excluir&id=' + id;
        }
    }
</script>
</head>
<body>

    <div class="wrapper">
        <div class="sidebar" data-color="azure" data-image="assets/img/sidebar-6.jpg">

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
                        <h2 class="title">Aparelho</h2>
                    </div>
                    <div class="navbar-default">

                        <a class="btn btn-info btn-fill pull-right" href=cadAparelho.jsp>Novo Cadastro</a>
                    </div>

                </div>
            </nav>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">





                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table">
                                            <tr>

                                                <th>Id</th>
                                                <th>Número</th>
                                                <th>Nome</th>
                                                <th>Descrição</th>
                                                <th></th>
                                            </tr>
                                            <jsp:useBean id="dao" class="model.AparelhoDAO"></jsp:useBean>
                                            <c:forEach var="aparelho" items="${dao.lista}">
                                                <tr>

                                                    <td>${aparelho.id}</td>
                                                    <td>${aparelho.numero}</td>
                                                    <td>${aparelho.nome}</td>
                                                    <td>${aparelho.descricao}</td>
                                                    <td>
                                                        <a class="btn btn-primary btn-fill" href="AparelhoController?acao=alterar&id=${aparelho.id}">
                                                            <i class="pe-7s-pen"></i>
                                                        </a>
                                                        <button class="btn btn-danger btn-fill" onclick="confirmarExclusao(${aparelho.id}, '${aparelho.numero}')">
                                                            <i class="pe-7s-trash "></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
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