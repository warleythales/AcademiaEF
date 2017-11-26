


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id,) {
        if (confirm('Deseja realmente excluir Exercício ' + id + '?')) {
            location.href = 'XXXXXXXXXXXXXXXXController?acao=excluir&id=' + id;
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
                    <div class="container-fluid">
                        
                            
                        <div class="title-container text-center">
                            <h1>Exercício</h1>
                        </div>

                        
                    </div>    
            </nav>


           
            <div class="col-md-12">
                        <div class="card card-plain">
                            
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    
                                        <th>Aparelho</th>
                                    	<th>Nome</th>
                                    	<th>Peso</th>
                                        <th>Série</th>
                                    	<th>Repetição</th>
                                        <th></th>
                                    	
                                    
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
                                                 <div class="container-fluid">
                                                <a class="btn btn-warning btn-fill" href=listGerenciamentoTreinoAluno.jsp>Voltar</a>
                                                 </div>
        </div>
    </div>

</body>




<%@include file="rodape.jsp" %>