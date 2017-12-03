<%@page import="bin.Cargo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CargoDAO"%>
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
                            <h2 class="title" align="left">Cargos</h2>
                            <hr>
                        </div>

                        <div class="content">

                            <a class="btn btn-info btn-fill pull-right" href=cadCargo.jsp>Novo Cadastro</a>
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
                                                    <th>Tipo</th>
                                                    <th></th>
                                                </tr>
                                            </thead>

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