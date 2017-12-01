

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

    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <%@include file="menuCelular.jsp" %>


                    <h3 class="title">Aluno:</h3>
                    <h4 class="title">CPF:</h4>


                </div>
                <%@include file="menuGlobal.jsp" %>

            </div>
            <div class="container-fluid">
                <div class="navbar-header">
                    <h3 class="title">Treino</h3>
                </div>


                <a class="btn btn-info btn-fill pull-right" href=cadTreino.jsp>Novo Exercício</a>
            </div>
        </nav>



        <div class="col-md-12">
            <div class="card card-plain">

                <div class="content table-responsive table-full-width">
                    <table class="table table-hover table-striped" id="listaPerfil" cellspacing="0" width="100%">
                        <thead>
                        <th>ID</th>
                        <th>Data de Inicio</th>
                        <th>Data do Termino</th>
                        <th></th>

                        </thead>
                        <tbody>
                            <jsp:useBean id="dao" class="model.TreinoDAO"></jsp:useBean>
                            <c:forEach var="treino" items="${dao.lista}">
                                <tr>

                                    <td>${treino.id}</td>
                                    <td><fmt:formatDate value="${treino.data_inicio}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
                                    <td><fmt:formatDate value="${treino.data_fim}" pattern="dd/MM/yyyy"></fmt:formatDate></td>

                                        <td>
                                            <a class="btn btn-primary btn-fill" href="TreinoController?acao=alterar&id=${treino.id}">
                                            <i class="pe-7s-pen"></i>
                                        </a>
                                        <a class="btn btn-danger btn-fill" href="listVerTreino.jsp">
                                            <i class="pe-7s-gym"></i>
                                        </a>
                                        
                                            <a class="btn btn-primary btn-fill" href="TreinoController?acao=exibir&id=${treino.id}">
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
        <div class="container-fluid">
            <a class="btn btn-warning btn-fill" href=listAluno.jsp>Voltar</a>
        </div>
    </div>


</body>




<%@include file="rodape.jsp" %>