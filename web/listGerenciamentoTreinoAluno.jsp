

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


                <a class="btn btn-info btn-fill pull-right" href=cadTreino.jsp>Novo Treino</a>
            </div>
        </nav>



        <div class="col-md-12">
            <div class="card card-plain">

                <div class="content table-responsive table-full-width">
                    <table class="table table-hover">
                        <thead>
                        <th>ID</th>
                        <th>Data de Inicio</th>
                        <th>Data do Termino</th>
                        <th></th>

                        </thead>
                        <tbody>
                            <jsp:useBean id="dao" class="model.AlunoDAO"></jsp:useBean>
                            <c:forEach var="alu" items="${dao.lista}">
                                <tr>
                                    <td>${alu.id}</td>
                                    <td>${treino.dataXXXXXXXXX}</td>
                                    <td>${treino.XXXXXXX}</td>
                                    <td>
                                        <a class="btn btn-primary btn-fill" href="listVerTreino.jsp">
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
</div>

</body>




<%@include file="rodape.jsp" %>