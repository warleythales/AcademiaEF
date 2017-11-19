<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
</head>

<body>

    <div class="wrapper">
        <div class="sidebar" data-color="azure" data-image="assets/img/sidebar-6.jpg">

            <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->

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
                    <h2 class="title">Cadastrar Mensalidade</h2>
                </div>
            </div>
            </nav>
            <div class="content">
                <div class="container-fluid">
                <div class="row">
                <div class="col-md-12">
                <div class="card">
                <div class="header">
                    <h4 class="title"> Dados da Mensalidade </h4>
                </div>
                <div class="content">
                    <form action="MensalidadeController" method="POST">
                    <input type="hidden" name="id" value="${m.id}" />

                <div class="row">
                <div class="col-md-6">
                <div class="form-group">
                    <label> Valor Pago </label>
                    <input type="text" class="form-control" id="valor_pago" name="valor_pago"  placeholder="000,00"  required value="${m.valor_pago}">
                </div>
                </div>
                <div class="col-md-6">
                <div class="form-group">
                   <label for="data_pag" class="control-label"> Data de Pagamento </label>
                    <input type="text" class="form-control" id="data_pag" name="data_pag" placeholder="00/00/0000" required value="${m.data_pag}">
                </div>
                </div>
                </div>

                <div class="row">
                <div class="col-md-6">
                <div class="form-group">
                    <label for="data_venc" class="control-label"> Data de Vencimento </label>
                    <input type="text" class="form-control" id="data_venc" name="data_venc" placeholder="00/00/0000" required value="${m.data_venc}">
                </div>
                </div>
               
         
                <div class="col-md-6">
                <div class="form-group">
                    <label>Status</label>
                    <input type="text" class="form-control" id="status" name="status" placeholder="status" required value="${m.status}">
                </div>
                </div>
                </div>
                
          
               
                
                
                
              
                  <div class="row">
                 <div class="form-group col-sm-6">
                  <label for="aluno" class="control-label"> Aluno </label>
                <jsp:useBean id="daoAluno" class="model.AlunoDAO"></jsp:useBean>
                <select id="aluno" name="aluno" class="form-control" required>
                <option></option>
                <c:forEach var="aluno" items="${daoAluno.lista}">
                    <c:if test="${a.aluno.id == aluno.id}">
                <option value="${aluno.id}" selected>${aluno.nome}</option>
                    </c:if>
                    <c:if test="${a.aluno.id != aluno.id}">
                <option value="${aluno.id}">${aluno.nome}</option>                                
                    </c:if>
                </c:forEach>
                </select>
            </div>
            
                 <div class="form-group col-sm-6">
                  <label for="funcionario" class="control-label"> Funcionário </label>
                <jsp:useBean id="fdao" class="model.FuncionarioDAO"></jsp:useBean>
                <select id="funcionario" name="funcionario" class="form-control" required>
                <option></option>
                <c:forEach var="funcionario" items="${fdao.lista}">
                    <c:if test="${f.funcionario.id == funcionario.id}">
                <option value="${funcionario.id}" selected>${funcionario.nome}</option>
                    </c:if>
                    <c:if test="${f.funcionario.id != funcionario.id}">
                <option value="${funcionario.id}">${funcionario.nome}</option>                                
                    </c:if>
                </c:forEach>
                </select>
            </div>
             </div> 
                
                
                
                
                
                
                
                
                
                
                <button class="btn btn-success btn-fill">Gravar</button>  
                <a href="listAluno.jsp" class="btn btn-warning btn-fill ">Voltar</a>
                </form>
                
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