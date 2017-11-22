<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id, cpf) {
        if (confirm('Deseja realmente excluir o aluno ' + cpf + '?')) {
            location.href = 'AlunoController?acao=excluir&id=' + id;
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
                        <h2 class="title">Aluno</h2>
                    </div>
                    <div class="navbar-default">

                        <a class="btn btn-info btn-fill pull-right" href=cadAluno.jsp>Novo Cadastro</a>
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
                                        <table class="table">
                                            
                                                <tr>

                                                    <th> ID </th>
                                                    <th> CPF </th>
                                                    <th> Nome </th>
                                                    <th> Status </th>
                                                    <th></th>



                                                </tr>
                                            
                                            <tbody>                                        
                                                <jsp:useBean id="dao" class="model.AlunoDAO"></jsp:useBean>
                                                <c:forEach var="alu" items="${dao.lista}">
                                                    <tr>
                                                        <td>${alu.id}</td>
                                                        <td>${alu.cpf}</td>
                                                        <td>${alu.nome}</td>
                                                        <td>${alu.status}</td>
                                                        <td>
                                                            <a class="btn btn-primary btn-fill" href="AlunoController?acao=alterar&id=${alu.id}">
                                                                <i class="pe-7s-pen"></i>
                                                            </a>
                                                            <button class="btn btn-danger btn-fill" onclick="confirmarExclusao(${alu.id}, '${alu.nome}')">
                                                                <i class="pe-7s-trash"></i>
                                                            </button>
                                                            <a class="btn btn-warning btn-fill" href="listMensalidade.jsp">
                                                                <i class="pe-7s-piggy"></i>
                                                            </a> 

                                                            <a class="btn btn-info btn-fill" href="gerenciamentoTreinoAluno.jsp">
                                                                <i class="pe-7s-gym"></i>
                                                            </a>    
                                                            <a class="btn btn-success btn-fill" href="listAvaliacao.jsp">
                                                                <i class="pe-7s-note2"></i>
                                                            </a>    

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