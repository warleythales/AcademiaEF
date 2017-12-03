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
                            <td> <h2 class="title">  Aluno: ${m.aluno.nome}</td> </h2>
                            <hr>
                            <h4 class="title"> Dados da Mensalidade </h4>
                        </div>
                        <div class="content">
                            <form action="MensalidadeController" method="POST">
                                <input type="hidden" name="id" value="${m.id}" />

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label> Valor Pago </label>
                                            <input type="text" class="form-control" id="valor_pago" disabled="disabled" name="valor_pago"  placeholder="000,00"  required value="<fmt:formatNumber value="${m.valor_pago}"type="currency"></fmt:formatNumber>">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="data_pag" class="control-label"> Data de Pagamento </label>
                                                <input type="text" class="form-control" id="data_pag" disabled="disabled" name="data_pag" placeholder="00/00/0000" required value="<fmt:formatDate value="${m.data_pag}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="data_venc" class="control-label"> Data de Vencimento </label>
                                                <input type="text" class="form-control" id="data_venc" disabled="disabled" name="data_venc" placeholder="00/00/0000" required value="<fmt:formatDate value="${m.data_venc}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                            </div>
                                        </div>


                                        <div class="col-md-6">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Status</label>
                                                    <select class="form-control" id="status"  disabled="disabled" name="status" placeholder="status" required value="${m.status}">
                                                    <option value="Pendente"> Pendente </option>
                                                    <option value="Pago"> Paga </option>
                                                    <option value="Vencida"> Vencida </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>







                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label for="aluno" class="control-label"> Aluno </label>
                                        <jsp:useBean id="daoAluno" class="model.AlunoDAO"></jsp:useBean>
                                            <select id="aluno" disabled="disabled" name="aluno" class="form-control" required>

                                            <c:forEach var="aluno" items="${daoAluno.lista}">
                                                <c:if test="${m.aluno.id == aluno.id}">
                                                    <option value="${aluno.id}" selected>${aluno.nome}</option>
                                                </c:if>
                                                <c:if test="${m.aluno.id != aluno.id}">
                                                    <option value="${aluno.id}">${aluno.nome}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label for="funcionario" class="control-label"> Funcionário </label>
                                        <jsp:useBean id="fdao" class="model.FuncionarioDAO"></jsp:useBean>
                                            <select id="funcionario" disabled="disabled" name="funcionario" class="form-control" required>

                                            <c:forEach var="funcionario" items="${fdao.lista}">
                                                <c:if test="${m.funcionario.id == funcionario.id}">
                                                    <option value="${funcionario.id}" selected>${funcionario.nome}</option>
                                                </c:if>
                                                <c:if test="${m.funcionario.id != funcionario.id}">
                                                    <option value="${funcionario.id}">${funcionario.nome}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>










                                <a href="MensalidadeController?acao=listar-aluno&id_aluno=${m.aluno.id}" class="btn btn-warning btn-fill ">Voltar</a>

                                <a class="btn btn-primary btn-fill" href="MensalidadeController?acao=alterar&id=${m.id}">
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