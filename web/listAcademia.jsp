<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id, cnpj) {
        if (confirm('Deseja realmente excluir o academia ' + cnpj + '?')) {
            location.href = 'AcademiaController?acao=excluir&id=' + id;
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

                        <h3 class="title">Academia</h3>
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

                                    <a class="btn btn-info btn-fill pull-right" href=cadAcademia.jsp>Novo Cadastro</a>
                                    <br>
                                    <br>
                                    <br>



                                    <div class="row">

                                        <div class="col-md-12">
                                            <div class="content table-responsive table-full-width">

                                                <table class="table table-hover table-striped">

                                                    <tr>
                                                        <th>ID</th>
                                                        <th>CNPJ</th>
                                                        <th>Nome</th>
                                                        <th>Endereço</th>
                                                        <th>Telefone</th>
                                                        <th></th>
                                                    </tr>

                                                    <tbody>                                        
                                                        <jsp:useBean id="dao" class="model.AcademiaDAO"></jsp:useBean>
                                                        <c:forEach var="academia" items="${dao.lista}">
                                                            <tr>

                                                                <td>${academia.id}</td>
                                                                <td>${academia.cnpj}</td>
                                                                <td>${academia.nome}</td>
                                                                <td>${academia.endereco}</td>
                                                                <td>${academia.telefone}</td>
                                                                <td>
                                                                    <a class="btn btn-primary btn-fill" href="AcademiaController?acao=alterar&id=${academia.id}">
                                                                        <i class="pe-7s-pen"></i>
                                                                    </a>
                                                                    <button class="btn btn-danger btn-fill" onclick="confirmarExclusao(${academia.id}, '${academia.cnpj}')">
                                                                        <i class="pe-7s-trash"></i>
                                                                    </button>
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
                </div>
            </div>
        </div>

</body>




<%@include file="rodape.jsp" %>