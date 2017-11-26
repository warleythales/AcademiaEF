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

    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <%@include file="menuCelular.jsp" %>
                    <h2 class="title">Exibir Aluno</h2>
                </div>
                <%@include file="menuGlobal.jsp" %>
            </div>
        </nav>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title"> Dados do Aluno </h4>
                            </div>
                            <div class="content">
                            
                                    <input type="hidden" name="id" value="${alu.id}" />

                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label> CPF </label>
                                                <input type="text" class="form-control" id="cpf" name="cpf" disabled="disabled" maxlength="14" placeholder="000.000.000-00"  required value="${alu.cpf}">
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>  NOME </label>
                                                <input type="text" class="form-control" id="nome" disabled="disabled" name="nome" placeholder="nome" required value="${alu.nome}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="text" class="form-control" id="email" disabled="disabled" name="email" placeholder="email" required value="${alu.email}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="data_nasc" class="control-label"> Data de Nascimento </label>
                                                <input type="text" class="form-control" id="data_nasc" disabled="disabled" name="data_nasc" placeholder="00/00/0000" required value="<fmt:formatDate value="${alu.data_nasc}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                                </div>
                                            </div>

                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label>Sexo</label>
                                                    <input type="text" class="form-control" id="sexo" disabled="disabled" name="sexo" placeholder="sexo" required value="${alu.sexo}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label>Endereço</label>
                                                <input type="text" class="form-control" id="endereco" disabled="disabled" name="endereco" placeholder="endereço" required value="${alu.endereco}">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Telefone</label>
                                                <input type="text" class="form-control" id="telefone" disabled="disabled" name="telefone" placeholder="telefone" required value="${alu.telefone}">
                                            </div>
                                        </div>

                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Status</label>
                                                <input type="text" class="form-control" id="status" disabled="disabled" name="status" placeholder="status" required value="${alu.status}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="valor_mensalidade" class="control-label"> Valor da Mensalidade do Aluno </label>
                                                <input type="text" class="form-control" id="valor_mensalidade" disabled="disabled" name="valor_mensalidade" placeholder="valor da mensalidade" required value="${alu.valor_mensalidade}"/>
                                            </div>
                                        </div>

                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="plano" class="control-label"> Plano </label>
                                                <input type="text" class="form-control" id="plano" disabled="disabled" name="plano" placeholder="plano" required value="${alu.plano}"/>
                                            </div>
                                        </div>
                                    </div>




                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="senha" class="control-label"> Senha </label>
                                                <input type="password" class="form-control" id="senha" disabled="disabled" name="senha"  placeholder="senha" required value="${alu.senha}"/>
                                            </div>
                                        </div>





                                        <div class="form-group col-sm-5">
                                            <label for="academia" class="control-label"> Academia </label>
                                            <jsp:useBean id="AcademiaDAO"  class="model.AcademiaDAO"></jsp:useBean>
                                                <select id="academia" disabled="disabled"  name="academia" class="form-control" required>
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