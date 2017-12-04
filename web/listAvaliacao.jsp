<%@page import="bin.Avaliacao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.AvaliacaoDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id, data_ava) {
        if (confirm('Deseja realmente excluir o avaliação ' + data_ava + '?')) {
            location.href = 'AvalicaoController?funcionalidade=excluir&id=' + id;
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
                            <h2 class="title" align="left">Lista de Avaliações</h2>
                            <hr>
                            <h4 class="title">Aluno: ${alu.nome} </h4>
                        </div>

                        <div class="content">
                            <a class="btn btn-primary btn-fill pull-right" href="javascript:history.go()">Atualizar</a>
                            <br>
                            <br>
                            <br>


                            <a class="btn btn-info btn-fill pull-right" href=cadAvaliacao.jsp>Novo Cadastro</a>
                            <br>
                            <br>
                            <br>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover table-striped" id="listaPerfil" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>

                                                    <th> ID </th>


                                                    <th> Data da Avaliação </th>

                                                    <th> Validade da Avaliação </th>
                                                    <th></th>
                                                </tr>
                                            </thead>

                                            <jsp:useBean id="dao" class="model.AvaliacaoDAO"></jsp:useBean>
                                                <tbody>
                                                <c:forEach var="a" items="${alu.minhasAvaliacoes}">
                                                    <tr>

                                                        <td>${a.id}</td>

                                                        <td><fmt:formatDate value="${a.data_ava}" pattern="dd/MM/yyyy"></fmt:formatDate></td>

                                                            <td><fmt:formatDate value="${a.validade_ava}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
                                                            <td>
                                                                <a class="btn btn-primary btn-fill" href="AvaliacaoController?acao=alterar&id=${a.id}">
                                                                <i class="pe-7s-pen"></i>
                                                            </a>
                                                            <a class="btn btn-warning btn-fill" href="AvaliacaoController?acao=exibir&id=${a.id}">
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





                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

        </div>
        <div class="container-fluid">
            <a class="btn btn-warning btn-fill" href=listAluno.jsp>Voltar</a>
        </div>

    </div>



</div>
</div>

</body>




<%@include file="rodape.jsp" %>