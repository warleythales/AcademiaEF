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
                            <h2 class="title">   <td>${f.nome}</td></h2>
                            <hr>
                            <h4 class="title"> Dados da Funcionário </h4>
                        </div>
                        <div class="content">
                            <form action="FuncionarioController" method="POST">
                                <input type="hidden" name="id" value="${f.id}" />

                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label> Matrícula </label>
                                            <input type="text" class="form-control" id="matricula" name="matricula" disabled="disabled" maxlength="9" placeholder="matricula"  required value="${f.matricula}">
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label> CPF </label>
                                            <input type="text" class="form-control" id="cpf" name="cpf" disabled="disabled" maxlength="11" placeholder="000.000.000-00" required value="${f.cpf}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-10">
                                        <div class="form-group">
                                            <label> Nome </label>
                                            <input type="text" class="form-control" id="nome" name="nome" disabled="disabled" placeholder="nome" required value="${f.nome}">
                                        </div>
                                    </div>
                                </div>



                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label> Data de Nascimento </label>
                                            <input type="text" class="form-control" id="data_nasc" name="data_nasc" disabled="disabled" placeholder="00/00/0000" required value="<fmt:formatDate value="${f.data_nasc}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label> Sexo </label>
                                                <input type="text" class="form-control" id="sexo" name="sexo"  disabled="disabled" placeholder="sexo" required value="${f.sexo}">
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label> Status </label>
                                            <select type="text" class="form-control" id="status" name="status" disabled="disabled"  placeholder="Status" required value="${f.ativo}">
                                                <option value="true">Ativo</option>
                                                <option value="false">Inativo</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label> Turno </label>
                                            <select type="text" class="form-control" id="turno" name="turno" disabled="disabled" placeholder="turno" required value="${f.turno}">
                                                <option value="">Selecione</option>
                                                <option>Matutino</option>
                                                <option>Vespertino</option>
                                                <option>Noturno</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label> Endereço </label>
                                            <input type="text" class="form-control" id="endereco" name="endereco" disabled="disabled" placeholder="endereço" required value="${f.endereco}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label> Email </label>
                                            <input type="text" class="form-control" id="email" name="email" disabled="disabled" placeholder="email" required value="${f.email}">
                                        </div>
                                    </div>

                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label> Telefone </label>
                                            <input type="text" class="form-control" id="telefone" name="telefone" disabled="disabled" placeholder="0000-0000" required value="${f.telefone}">
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label> Senha </label>
                                            <input type="password" class="form-control" id="senha" name="senha" disabled="disabled" placeholder="senha" required value="${f.senha}">
                                        </div>
                                    </div>


                                    <div class="form-group col-sm-5">
                                        <label for="cargo" class="control-label">Cargo</label>

                                        <jsp:useBean id="cdao" class="model.CargoDAO"></jsp:useBean>
                                            <select id="cargo" name="cargo" disabled="disabled" class="form-control"  required>
                                                <option></option>
                                            <c:forEach var="cargo" items="${cdao.lista}">
                                                <c:if test="${f.cargo.id == cargo.id}">
                                                    <option  value="${cargo.id}" selected>${cargo.tipo}</option>
                                                </c:if>
                                                <c:if test="${f.cargo.id != cargo.id}">
                                                    <option  value="${cargo.id}">${cargo.tipo}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="content">
                                        <div class="row">
                                            <div class="form-group col-sm-10">
                                                <label for="academia" class="control-label"> Academia </label>
                                                <jsp:useBean id="AcademiaDAO" class="model.AcademiaDAO"></jsp:useBean>
                                                    <select id="academia" name="academia" disabled="disabled" class="form-control" required>
                                                        <option></option>
                                                    <c:forEach var="academia" items="${AcademiaDAO.lista}">
                                                        <c:if test="${f.academia.id == academia.id}">
                                                            <option value="${academia.id}" selected>${academia.nome}</option>
                                                        </c:if>
                                                        <c:if test="${f.academia.id != academia.id}">
                                                            <option value="${academia.id}">${academia.nome}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a href="listFuncionario.jsp" class="btn btn-warning btn-fill "> Voltar </a>
                                <a class="btn btn-primary btn-fill" href="FuncionarioController?acao=alterar&id=${f.id}">
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


</body>
<%@include file="rodape.jsp" %>