<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                            <h2 class="title" align="left">Cadastro de Avaliações</h2>
                            <hr>
                            <h4 class="title"> Dados da Avaliação </h4>
                        </div>
                        <div class="content">
                            <form action="AvaliacaoController" method="POST">
                                <input type="hidden" name="id" value="${a.id}" />

                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label> Biotipo </label>
                                            <select class="form-control" id="biotipo" name="biotipo"  placeholder="Biotipo"  required value="${a.biotipo}">
                                                <option value="">Selecione</option>
                                                <option>Mesomorfo</option>
                                                <option>Endomorfo</option>
                                                <option>Ectomorfo</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label> Data da Avaliação </label>
                                            <input type="text" class="form-control" id="data_ava" name="data_ava" maxlength="10" placeholder="00/00/0000" required value="<fmt:formatDate value="${a.data_ava}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-1">
                                            <div class="form-group">
                                                <label>Idade (Anos)</label>
                                                <input type="number" class="form-control" id="idade" name="idade" maxlength="11" placeholder="Idade" required value="${a.idade}">
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="form-group">
                                            <label for="peso" class="control-label"> Peso (KG)</label>
                                            <input type="text" class="form-control" id="peso" name="peso" maxlength="6" placeholder="00.0kg" required value="${a.peso}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="form-group">
                                            <label>Ombro (CM)</label>
                                            <input type="number" class="form-control" id="ombro" name="ombro" maxlength="6" placeholder="00cm" required value="${a.ombro}">
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label> Braço Relaxado (cm)</label>
                                            <input type="number" class="form-control" id="braco_relaxado" name="braco_relaxado" maxlength="6" placeholder="00cm" required value="${a.braco_relaxado}">
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>Braço Contraído (cm)</label>
                                            <input type="number" class="form-control" id="braco_contraido" name="braco_contraido" maxlength="6" placeholder="00cm" required value="${a.braco_contraido}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Braço Contraído (cm)</label>
                                            <input type="number" class="form-control" id="braco_contraido" name="braco_contraido" maxlength="6" placeholder="00cm" required value="${a.braco_contraido}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>Antebraço (CM)</label>
                                            <input type="number" class="form-control" id="antebraco" name="antebraco" maxlength="6" placeholder="00cm" required value="${a.antebraco}">
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="form-group">
                                            <label for="torax" class="control-label"> Tórax (cm)</label>
                                            <input type="number" class="form-control" id="torax" name="torax" placeholder="00cm" required value="${a.torax}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="panturrilha" class="control-label"> Panturrilha (cm)</label>
                                            <input type="number" class="form-control" id="panturrilha" name="panturrilha" placeholder="00cm" required value="${a.panturrilha}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="form-group">
                                            <label for="cintura" class="control-label"> Cintura (cm)</label>
                                            <input type="number" class="form-control" id="cintura" name="cintura"  placeholder="00cm" required value="${a.cintura}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="form-group">
                                            <label>Abdomen (cm)</label>
                                            <input type="number" class="form-control" id="abdomen" name="abdomen" placeholder="00cm" required value="${a.abdomen}">
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="form-group">
                                            <label for="quadril" class="control-label"> Quadril (cm)</label>
                                            <input type="number" class="form-control" id="quadril" name="quadril" placeholder="00cm" required value="${a.quadril}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="coxa" class="control-label"> Coxa (cm)</label>
                                            <input type="number" class="form-control" id="coxa" name="coxa" placeholder="00cm" required value="${a.coxa}"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="validade_ava" class="control-label"> Validade da Avaliação Física </label>
                                            <input type="text" class="form-control" id="validade_ava" name="validade_ava" placeholder="00/00/0000" required value="<fmt:formatDate value="${a.validade_ava}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                            </div>
                                        </div>



                                        <div class="form-group col-sm-5">
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





                                </div>





                                <button class="btn btn-success btn-fill">Gravar</button>
                                <a href="AvaliacaoController?acao=listar-aluno&id_aluno=${a.aluno.id}" class="btn btn-warning btn-fill ">Voltar</a>
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