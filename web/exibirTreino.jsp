<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
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
                            <td> <h2 class="title">  Aluno: ${t.aluno.nome}</td> </h2>
                            <hr>
                            <h4 class="title"> Dados do Treino: </h4>
                        </div>



                        <div class="content">

                            <a class="btn btn-primary btn-fill pull-right" href="javascript:history.go()">Atualizar</a>

                            <form action="TreinoController" method="POST">
                                <input type="hidden" name="id" value="${t.id}" />

                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <div class=" text-center">
                                                <h3>Descrição: </h3>
                                            </div>
                                        </div>
                                        <input rows="5" type="text" class="form-control" id="descricao" disabled="disabled" name="descricao" maxlength="255" placeholder="Descrição" value="${t.descricao}">

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label> Data de Início </label>
                                            <input type="text" class="form-control" id="data_inicio" disabled="disabled" name="data_inicio" placeholder="00/00/0000" value="<fmt:formatDate value="${t.data_inicio}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label> Data de Fim </label>
                                                <input type="text" class="form-control" id="data_fim" disabled="disabled" name="data_fim"  placeholder="00/00/0000" value="<fmt:formatDate value="${t.data_fim}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="aluno" class="control-label"> Aluno </label>
                                        <jsp:useBean id="daoAluno" class="model.AlunoDAO"></jsp:useBean>
                                            <select id="aluno" disabled="disabled" name="aluno" class="form-control" required>

                                            <c:forEach var="aluno" items="${daoAluno.lista}">
                                                <c:if test="${t.aluno.id == aluno.id}">
                                                    <option value="${aluno.id}" selected>${aluno.nome}</option>
                                                </c:if>
                                                <c:if test="${t.aluno.id != aluno.id}">
                                                    <option value="${aluno.id}">${aluno.nome}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>

                                </div>
                                <a class="btn btn-info btn-fill pull-right" href="cadExercicio.jsp">Novo Exercicio</a>

                                <div class="title-container text-center">
                                    <h3>Exercício</h3>
                                </div>



                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="content table-responsive table-full-width">
                                            <table class="table table-hover table-striped">

                                                <tr>


                                                    <th>Aparelho</th>
                                                    <th>Peso</th>
                                                    <th>Série</th>
                                                    <th>Repetição</th>
                                                    <th></th>
                                                </tr>

                                                <tbody>
                                                    <c:forEach var="ex" items="${t.meusExercicios}">
                                                        <tr>



                                                            <td>${ex.aparelho.nome}</td>
                                                            <td>${ex.peso}</td>
                                                            <td>${ex.serie}</td>
                                                            <td>${ex.repetcoes}</td>

                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <a href="javascript:history.back()" class="btn btn-warning btn-fill ">Voltar</a>
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