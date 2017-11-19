


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
                       
                        
                        <h2 class="title">Aluno:</h2> 
                        
                                           
                    </div>
                   
                       
                </div>
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <h3 class="title">Descrição do Treino</h3>
                         </div>
                            
                     
                        
                    </div>
                    <div class="container-fluid">
                        
                            
                        <div class="title-container text-center">
                            <h1>Exercício</h1>
                        </div>

                        
                    </div>    
            </nav>


           
            <div class="col-md-12">
                        <div class="card card-plain">
                            <div class="header">
                                
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                        <th>Aparelho</th>
                                    	<th>Nome</th>
                                    	<th>Peso</th>
                                        <th>Série</th>
                                    	<th>Repetição</th>
                                        <th></th>
                                    	
                                    </thead>
                                    <tbody>                                        
                                                <jsp:useBean id="dao" class="model.AlunoDAO"></jsp:useBean>
                                                <c:forEach var="alu" items="${dao.lista}">
                                                    <tr>
                                                        <td>${alu.id}</td>
                                                        <td>${treino.dataXXXXXXXXX}</td>
                                                        <td>${treino.XXXXXXX}</td>
                                                        <td>${treino.XXXXXXX}</td>
                                                        <td>${treino.XXXXXXX}</td>
                                                        
                                                        <td>
                                                            <a class="btn btn-primary btn-fill" href="xxxxxxxxxxxxxxx.jsp">
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
                                                 <div class="container-fluid">
                                                <a class="btn btn-warning btn-fill" href=gerenciamentoTreinoAluno.jsp>Voltar</a>
                                                 </div>
        </div>
    </div>

</body>




<%@include file="rodape.jsp" %>