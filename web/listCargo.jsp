<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id, tipo) {
        if (confirm('Deseja realmente excluir o cargo ' + tipo + '?')) {
            location.href = 'CargoController?acao=excluir&id=' + id;
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
                        <h2 class="title">Cargo</h2>
                    </div>
                    <div class="navbar-default">

                        <a class="btn btn-info btn-fill pull-right" href=cadCargo.jsp>Novo Cadastro</a>
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
                                        <table class="table table-hover table-striped">
                                           
                                                <tr>

                                                    <th>ID</th>
                                                    <th>Tipo</th>
                                                    <th></th>
                                                </tr>
                                            
                                            <tbody>                                        
                                                <jsp:useBean id="cDAO" class="model.CargoDAO"></jsp:useBean>
                                                <c:forEach var="cargo" items="${cDAO.lista}">
                                                    <tr>

                                                        <td>${cargo.id}</td>
                                                        <td>${cargo.tipo}</td>
                                                        <td>
                                                            <a class="btn btn-primary btn-fill" href="CargoController?acao=alterar&id=${cargo.id}">
                                                                <i class="pe-7s-pen"></i>
                                                            </a>
                                                            <button class="btn btn-danger btn-fill" onclick="confirmarExclusao(${cargo.id}, '${cargo.tipo}')">
                                                                <i class="pe-7s-trash"></i>
                                                            </button>
                                                        </td>
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