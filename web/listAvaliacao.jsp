<%@page import="bin.Avaliacao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.AvaliacaoDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id, data_ava) {
        if (confirm('Deseja realmente excluir o avaliação ' + data_ava + '?')) {
            location.href = 'AvalicaoController?funcionalidade=excluir&id=' + id;
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
                                            
                                                <tr>

                                                    <th> ID </th>
                                                    
                                                    
                                                    <th> Data da Avaliação </th>
                                                    
                                                    <th> Validade da Avaliação </th>
                                                    <th></th>
                                                </tr>
                                            
                                            <tbody>                                        
                                                <jsp:useBean id="dao" class="model.AvaliacaoDAO"></jsp:useBean>
                                                <c:forEach var="a" items="${dao.lista}">
                                                    <tr>

                                                        <td>${a.id}</td>
                                                        
                                                        <td>${a.data_ava}</td>
                                                        
                                                        <td>${a.validade_ava}</td>
                                                        <td>
                                                            <a class="btn btn-primary btn-fill" href="AvaliacaoController?funcionalidade=alterar&id=${a.id}">
                                                                <i class="pe-7s-pen"></i>
                                                            </a>
                                                            <button class="btn btn-danger btn-fill" onclick="confirmarExclusao(${a.id}, '${a.data_ava}')">
                                                                <i class="pe-7s-trash"></i>
                                                            </button>
                                                            <a class="btn btn-primary btn-fill" href="AvaliacaoController?funcionalidade=exibir&id=${a.id}">
                                                                <i class="pe-7s-search"></i>
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
               <div class="container-fluid">
                <a class="btn btn-warning btn-fill" href=listAluno.jsp>Voltar</a>
            </div>                                   
                                                
            </div>
                                                
                                                
                                                
        </div>
    </div>

</body>




<%@include file="rodape.jsp" %>