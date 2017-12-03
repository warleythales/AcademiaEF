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
                            <h2 class="title" align="left">Academias</h2>
                            <hr>
                        </div>

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
                                                <th>NOME</th>
                                              
                                                <th></th>
                                            </tr>

                                            <tbody>
                                                <jsp:useBean id="dao" class="model.AcademiaDAO"></jsp:useBean>
                                                <c:forEach var="academia" items="${dao.lista}">
                                                    <tr>

                                                        <td>${academia.id}</td>
                                                        <td>${academia.nome}</td>
                                                       
                                                        <td>
                                                            <a class="btn btn-primary btn-fill" href="AcademiaController?acao=alterar&id=${academia.id}">
                                                                <i class="pe-7s-pen"></i>
                                                            </a>
                                                            <a class="btn btn-warning btn-fill" href="AcademiaController?acao=exibir&id=${academia.id}">
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
    </div>
</div>
</div>

</body>




<%@include file="rodape.jsp" %>