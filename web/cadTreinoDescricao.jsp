

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


                        <h3 class="title">Aluno:</h3>
                        <h4 class="title">CPF:</h4>


                    </div>
                    <%@include file="menuGlobal.jsp" %>

                </div>
                <div class="container-fluid">
                    <div class="navbar-header">
                        <h3 class="title">Descrição do Treino</h3>
                    </div>



                </div>
            </nav>



            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">



                            <div class="clearfix"></div>



                            <form action="CargoController" method="POST">
                                <input type="hidden" name="id" value="${c.id}" />

                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <div class=" text-center">
                                                <h3>Descrição</h3>
                                            </div>
                                        </div>
                                            <textarea class="form-control text-capitalize" ></textarea>
                                        
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label> Data de Início </label>
                                            <input type="text" class="form-control" id="data_xxxxxxx" name="data_nasc" placeholder="00/00/0000" required value="<fmt:formatDate value="${f.data_xxxxxxxx}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label> Data de Fim </label>
                                                <input type="text" class="form-control" id="data_xxxxxxx" name="sexo"  placeholder="00/00/0000" required value="<fmt:formatDate value="${f.data_xxxxxxxxx}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                            </div>
                                        </div>
                                    </div>


                                    <button class="btn btn-success btn-fill">Gravar</button>  
                                    <a href="cadTreino.jsp" class="btn btn-warning btn-fill ">Voltar</a>
                                </form>




                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>








    </body>




<%@include file="rodape.jsp" %>