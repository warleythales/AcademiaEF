<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id, matricula) {
        if (confirm('Deseja realmente excluir o funcion�rio ' + matricula + '?')) {
            location.href = 'FuncionarioController?acao=excluir&id=' + id;
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

                        <h2 class="title">Funcion�rio</h2>
                    </div>
                    <div class="navbar-default">

                        <a class="btn btn-info btn-fill pull-right" href=cadFuncionario.jsp>Novo Cadastro</a>
                    </div>

                </div>
            </nav>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-15">
                            <div class="card">





                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-hover table-striped">
                                            <thead>
                                                <tr>

                                                    <th> Id </th>
                                                    <th> Matr�cula </th>
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
                                                                <i class="pe-7s-pen"></i></a>

                                                            <button class="btn btn-danger btn-fill" onclick="confirmarExclusao(${func.id}, '${func.nome}')">
                                                                <i class="pe-7s-trash"></i> </button>

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