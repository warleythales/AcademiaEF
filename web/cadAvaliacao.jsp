<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                        <h2 class="title">Cadastro Avaliação</h2>
                    </div>
                </div>
            </nav>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title"> Dados da Avaliação </h4>
                                </div>
                                <div class="content">
                                    <form action="AvaliacaoController" method="POST">
                                        <input type="hidden" name="id" value="${a.id}" />

                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label> Biotipo </label>
                                                    <input type="text" class="form-control" id="biotipo" name="biotipo"  placeholder="biotipo"  required value="${a.biotipo}">
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label> Data da Avaliação </label>
                                                    <input type="text" class="form-control" id="data_ava" name="data_ava" placeholder="00/00/0000" required value="<fmt:formatDate value="${a.data_ava}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-10">
                                                <div class="form-group">
                                                    <label>Idade</label>
                                                    <input type="text" class="form-control" id="idade" name="idade" placeholder="idade" required value="${a.idade}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label for="peso" class="control-label"> Peso </label>
                                                    <input type="text" class="form-control" id="peso" name="peso" placeholder="peso" required value="${a.peso}"/>
                                                </div>
                                            </div>

                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label>Ombro</label>
                                                    <input type="text" class="form-control" id="ombro" name="ombro" placeholder="ombro" required value="${a.ombro}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-10">
                                                <div class="form-group">
                                                    <label> Braço Relaxado </label>
                                                    <input type="text" class="form-control" id="braco_relaxado" name="braco_relaxado" placeholder="braco relaxado" required value="${a.braco_relaxado}">
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label>Braço Contraído</label>
                                                    <input type="text" class="form-control" id="braco_contraido" name="braco_contraido" placeholder="braco contraído" required value="${a.braco_contraido}">
                                                </div>
                                            </div>

                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label>Antebraço</label>
                                                    <input type="text" class="form-control" id="antebraco" name="antebraco" placeholder="antebraço" required value="${a.antebraco}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label for="torax" class="control-label"> Tórax </label>
                                                    <input type="text" class="form-control" id="torax" name="torax" placeholder="torax" required value="${a.torax}"/>
                                                </div>
                                            </div>

                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label for="panturrilha" class="control-label"> Panturrilha </label>
                                                    <input type="text" class="form-control" id="panturrilha" name="panturrilha" placeholder="panturrilha" required value="${a.panturrilha}"/>
                                                </div>
                                            </div>
                                        </div>




                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label for="cintura" class="control-label"> Cintura </label>
                                                    <input type="text" class="form-control" id="cintura" name="cintura"  placeholder="cintura" required value="${a.cintura}"/>
                                                </div>
                                            </div>



                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label>Abdomen</label>
                                                    <input type="text" class="form-control" id="abdomen" name="abdomen" placeholder="abdomen" required value="${a.abdomen}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label for="quadril" class="control-label"> Quadril </label>
                                                    <input type="text" class="form-control" id="quadril" name="quadril" placeholder="quadril" required value="${a.quadril}"/>
                                                </div>
                                            </div>

                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label for="coxa" class="control-label"> Coxa </label>
                                                    <input type="text" class="form-control" id="coxa" name="coxa" placeholder="coxa" required value="${a.coxa}"/>
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