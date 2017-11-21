<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id, biotipo) {
        if (confirm('Deseja realmente excluir o avaliação ' + biotipo + '?')) {
            location.href = 'AvalicaoControle?acao=excluir&id=' + id;
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

                        <h2 class="title">Avaliação</h2>
                    </div>
                    <div class="navbar-default">

                        <a class="btn btn-info btn-fill pull-right" href=cadAvaliacao.jsp>Novo Cadastro</a>
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
                                            <thead>
                                                <tr>

                                                    <th> Id </th>
                                                    <th> Aluno </th>
                                                    <th> Biotipo </th>
                                                    <th> Data da Avaliação </th>
                                                    <th> Idade </th>
                                                    <th> Peso </th>
                                                    <th> Ombro </th>
                                                    <th> Braço Relaxado </th>
                                                    <th> Braço Contraído </th>
                                                    <th> Antebraço </th>
                                                    <th> Torax </th>
                                                    <th> Panturrilha </th>
                                                    <th> Cintura </th>
                                                    <th> Abdomen </th>
                                                    <th> Quadril </th>
                                                    <th> Coxa </th>
                                                    <th> Validade da Avaliação </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>                                        
                                                <jsp:useBean id="dao" class="model.AvaliacaoDAO"></jsp:useBean>
                                                <c:forEach var="a" items="${dao.lista}">
                                                    <tr>

                                                        <td>${a.id}</td>
                                                        <td>${a.aluno.nome}</td>
                                                        <td>${a.biotipo}</td>
                                                        <td>${a.data_ava}</td>
                                                        <td>${a.idade}</td>
                                                        <td>${a.peso}</td>
                                                        <td>${a.ombro}</td>
                                                        <td>${a.braco_relaxado}</td>
                                                        <td>${a.braco_contraido}</td>
                                                        <td>${a.antebraco}</td>
                                                        <td>${a.torax}</td>
                                                        <td>${a.panturrilha}</td>
                                                        <td>${a.cintura}</td>
                                                        <td>${a.abdomen}</td>
                                                        <td>${a.quadril}</td>
                                                        <td>${a.coxa}</td>
                                                        <td>${a.validade_ava}</td>
                                                        <td>
                                                            <a class="btn btn-primary btn-fill" href="AcademiaController?acao=alterar&id=${a.id}">
                                                                <i class="pe-7s-pen"></i>
                                                            </a>
                                                            <button class="btn btn-danger btn-fill" onclick="confirmarExclusao(${a.id}, '${a.data_ava}')">
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