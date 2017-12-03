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
                            <h2 class="title" align="left">Aparelhos</h2>
                            <hr>
                        </div>

                        <div class="content">


                            <a class="btn btn-info btn-fill pull-right" href=cadAparelho.jsp>Novo Cadastro</a>
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
                                                    <th>Número</th>
                                                    <th>Nome</th>
                                                    <th>Descrição</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <jsp:useBean id="dao" class="model.AparelhoDAO"></jsp:useBean>
                                                <tbody>
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
                                                            <a class="btn btn-warning btn-fill" href="AparelhoController?acao=exibir&id=${aparelho.id}">
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