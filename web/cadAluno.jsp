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
                            <h2 class="title" align="left">Cadastro de Alunos</h2>
                            <hr>
                            <h4 class="title"> Dados do Aluno </h4>
                        </div>
                        <div class="content">
                            <form action="AlunoController" method="POST">
                                <input type="hidden" name="id" value="${alu.id}" />

                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label> CPF (Sem Pontuação) </label>
                                            <input type="text" class="form-control" name="cpf" onkeyup="cpfCheck(this)" maxlength="11" placeholder="00000000000"  required value="${alu.cpf}">
                                            <span id="cpfResponse"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label> Nome </label>
                                            <input type="text" class="form-control" id="nome" name="nome" maxlength="100" placeholder="Nome" required value="${alu.nome}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-10">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" class="form-control" id="email" name="email" maxlength="100" placeholder="Email" required value="${alu.email}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="data_nasc" class="control-label"> Data de Nascimento </label>
                                            <input type="text" class="form-control" id="data_nasc" name="data_nasc" maxlength="10" placeholder="00/00/0000" required value="<fmt:formatDate value="${alu.data_nasc}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                            </div>
                                        </div>

                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Sexo</label>
                                                <select class="form-control" id="sexo" name="sexo" required value="${alu.sexo}" size=1>
                                                <option value="">Selecione</option>
                                                <option>Masculino</option>
                                                <option>Feminino</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-10">
                                        <div class="form-group">
                                            <label>Endereço</label>
                                            <input type="text" class="form-control" id="endereco" name="endereco" maxlength="255" placeholder="Endereço" required value="${alu.endereco}">
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label>Telefone</label>
                                            <input type="text" class="form-control" id="telefone" name="telefone" maxlength="11" placeholder="00000000000" required value="${alu.telefone}">
                                        </div>
                                    </div>

                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label>Status</label>
                                            <select type="text" class="form-control" id="status" name="status" placeholder="status" required value="${alu.status}">
                                                <option value="1">Ativo</option>
                                                <option value="0">Inativo</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="valor_mensalidade" class="control-label"> Valor da Mensalidade do Aluno </label>
                                            <input type="text" class="form-control" id="valor_mensalidade" name="valor_mensalidade" placeholder="000.0" required value="${alu.valor_mensalidade}"/>
                                        </div>
                                    </div>

                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="plano" class="control-label"> Plano </label>
                                            <select type="text" class="form-control" id="plano" name="plano" placeholder="plano" required value="${alu.plano}">
                                                <option value="">Selecione</option>
                                                <option>Basico</option>
                                                <option>Intermediário</option>
                                                <option>Master</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>




                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="senha" class="control-label"> Senha </label>
                                            <input type="password" class="form-control" id="senha" name="senha"  maxlength="10" placeholder="Senha" required value="${alu.senha}"/>
                                        </div>
                                    </div>





                                    <div class="form-group col-sm-5">
                                        <label for="academia" class="control-label"> Academia </label>
                                        <jsp:useBean id="AcademiaDAO" class="model.AcademiaDAO"></jsp:useBean>
                                            <select id="academia" name="academia" class="form-control" required>
                                                <option></option>
                                            <c:forEach var="academia" items="${AcademiaDAO.lista}">
                                                <c:if test="${alu.academia.id == academia.id}">
                                                    <option value="${academia.id}" selected>${academia.nome}</option>
                                                </c:if>
                                                <c:if test="${alu.academia.id != academia.id}">
                                                    <option value="${academia.id}">${academia.nome}</option>
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