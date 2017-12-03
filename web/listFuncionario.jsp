<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id, matricula) {
        if (confirm('Deseja realmente excluir o funcionário ' + matricula + '?')) {
            location.href = 'FuncionarioController?acao=excluir&id=' + id;
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
                            <h2 class="title" align="left">Funcionários</h2>
                            <hr>
                        </div>

                        <div class="content">
                            <a class="btn btn-info btn-fill pull-right" href=cadFuncionario.jsp>Novo Cadastro</a>
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
                                                    <th> Matrícula </th>
                                                    <th> Nome </th>
                                                    <th> Turno </th>
                                                    <th> Cargo </th>
                                                    <th> Academia </th>
                                                    <th></th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <jsp:useBean id="fdao" class="model.FuncionarioDAO"/>
                                                <c:forEach var="func" items="${fdao.lista}">
                                                    <tr>


                                                        <td>${func.id}</td>
                                                        <td>${func.matricula}</td>
                                                        <td>${func.nome}</td>
                                                        <td>${func.turno}</td>
                                                        <td>${func.cargo.tipo}</td>
                                                        <td>${func.academia.nome}</td>
                                                        <td>
                                                            <a class="btn btn-primary btn-fill" href="FuncionarioController?acao=alterar&id=${func.id}">
                                                                <i class="pe-7s-pen"></i>
                                                            </a>
                                                            <a class="btn btn-warning btn-fill" href="FuncionarioController?acao=exibir&id=${func.id}">
                                                                <i class="pe-7s-search"></i>
                                                            </a>

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