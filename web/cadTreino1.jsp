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

    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">

                    <%@include file="menuCelular.jsp" %>

                    <h3 class="title">Cadastrar Treino</h3>
                </div>
                <%@include file="menuGlobal.jsp" %>



            </div>
        </nav>



        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">



                        <div class="clearfix"></div>



                        <form action="TreinoController" method="POST">
                            <input type="hidden" name="id" value="${trei.id}" />

                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <div class=" text-center">
                                            <h3>Descri��o</h3>
                                        </div>
                                    </div>
                                    <textarea class="form-control text-capitalize" id="descricao" name="descricao" placeholder="Descri��o do Treino"  required value="${trei.descricao}" ></textarea>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label> Data de In�cio </label>
                                        <input type="text" class="form-control" id="data_inicio" name="data_inicio" placeholder="00/00/0000" required value="<fmt:formatDate value="${trei.data_inicio}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label> Data de Fim </label>
                                            <input type="text" class="form-control" id="data_fim" name="data_fim"  placeholder="00/00/0000" required value="<fmt:formatDate value="${trei.data_fim}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label for="aluno" class="control-label"> Aluno </label>
                                    <jsp:useBean id="daoAluno" class="model.AlunoDAO"></jsp:useBean>
                                        <select id="aluno" name="aluno" class="form-control" required>

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

                            </div>
                            <button class="btn btn-success btn-fill">Gravar</button>
                            <a href="listTreino.jsp" class="btn btn-warning btn-fill ">Voltar</a>
                        </form>




                    </div>
                </div>
            </div>
        </div>
    </div>
</div>








</body>




<%@include file="rodape.jsp" %>