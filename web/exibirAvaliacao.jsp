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
                    <h2 class="title"> Avaliação Física - <td>${a.aluno.nome}</td> </h2>
                </div>
            </div>
        </nav>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title"> Dados de Consulta </h4>
                            </div>
                            <div class="content">
                                <form action="AvaliacaoController" method="POST">
                                    <input type="hidden" name="id" value="${a.id}" />

                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label> Biotipo </label>
                                                <input type="text" class="form-control" id="biotipo" disabled="disabled"  name="biotipo"  placeholder="biotipo"  required value="${a.biotipo}">
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label> Data da Avaliação </label>
                                                <input type="text" class="form-control" id="data_ava" disabled="disabled"  name="data_ava" placeholder="data da avaliação" required value="<fmt:formatDate value="${a.data_ava}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-10">
                                                <div class="form-group">
                                                    <label>Idade</label>
                                                    <input type="text" class="form-control" id="idade" disabled="disabled" name="idade" placeholder="idade" required value="${a.idade}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="peso" class="control-label"> Peso </label>
                                                <input type="text" class="form-control" id="peso" disabled="disabled" name="peso" placeholder="peso" required value="${a.peso}"/>
                                            </div>
                                        </div>

                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Ombro</label>
                                                <input type="text" class="form-control" id="ombro" disabled="disabled" name="ombro" placeholder="ombro" required value="${a.ombro}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label> Braço Relaxado </label>
                                                <input type="text" class="form-control" id="braco_relaxado" disabled="disabled" name="braco_relaxado" placeholder="braco relaxado" required value="${a.braco_relaxado}">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Braço Contraído</label>
                                                <input type="text" class="form-control" id="braco_contraido" disabled="disabled" name="braco_contraido" placeholder="braco contraído" required value="${a.braco_contraido}">
                                            </div>
                                        </div>

                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Antebraço</label>
                                                <input type="text" class="form-control" id="antebraco" disabled="disabled"  name="antebraco" placeholder="antebraço" required value="${a.antebraco}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="torax" class="control-label"> Tórax </label>
                                                <input type="text" class="form-control" id="torax" disabled="disabled" name="torax" placeholder="torax" required value="${a.torax}"/>
                                            </div>
                                        </div>

                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="panturrilha" class="control-label"> Panturrilha </label>
                                                <input type="text" class="form-control" id="panturrilha" disabled="disabled"  name="panturrilha" placeholder="panturrilha" required value="${a.panturrilha}"/>
                                            </div>
                                        </div>
                                    </div>




                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="cintura" class="control-label"> Cintura </label>
                                                <input type="text" class="form-control" id="cintura" disabled="disabled" name="cintura"  placeholder="cintura" required value="${a.cintura}"/>
                                            </div>
                                        </div>



                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Abdomen</label>
                                                <input type="text" class="form-control" id="abdomen" disabled="disabled" name="abdomen" placeholder="abdomen" required value="${a.abdomen}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="quadril" class="control-label"> Quadril </label>
                                                <input type="text" class="form-control" id="quadril" disabled="disabled" name="quadril" placeholder="quadril" required value="${a.quadril}"/>
                                            </div>
                                        </div>

                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="coxa" class="control-label"> Coxa </label>
                                                <input type="text" class="form-control" id="coxa" disabled="disabled" name="coxa" placeholder="coxa" required value="${a.coxa}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="validade_ava" class="control-label"> Validade da Avaliação Física </label>
                                                <input type="text" class="form-control" id="validade_ava" disabled="disabled" name="validade_ava" placeholder="validade da avaliação" required value="<fmt:formatDate value="${a.validade_ava}" pattern="dd/MM/yyyy"></fmt:formatDate>"/>
                                                </div>
                                            </div>



                                            <div class="form-group col-sm-5">
                                                <label for="aluno" class="control-label"> Aluno </label>
                                            <jsp:useBean id="daoAluno" class="model.AlunoDAO"></jsp:useBean>
                                                <select id="aluno" disabled="disabled" name="aluno" class="form-control" required>
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

                                    </div>


                                    <a href="listAvaliacao.jsp" class="btn btn-warning btn-fill ">Voltar</a>
                                    
                                    <a class="btn btn-primary btn-fill" href="AvaliacaoController?funcionalidade=alterar&id=${a.id}">
                                                                    <i class="pe-7s-pen"></i>
                                                                </a>
                                    
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