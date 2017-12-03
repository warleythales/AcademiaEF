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

                <div class="card">
                    <div class="header">
                        <h2 class="title" align="left">${academia.nome}</h2>
                        <hr>
                        <h4 class="title">Dados da Academia</h4>
                    </div>

                    <div class="content">
                        <form action="AcademiaController" method="POST">


                            <input type="hidden" name="id" value="${a.id}" />

                            <div class="row">
                                <div class="col-md-8">
                                    <label> CNPJ (Sem Pontuação) </label>
                                    <input type="text" class="form-control" id="cnpj" disabled="disabled" name="cnpj" maxlength="14" placeholder="CNPJ"  required value="${academia.cnpj}">
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label> Nome </label>
                                    <input type="text" class="form-control" id="nome" disabled="disabled" name="nome" placeholder="Nome" required value="${academia.nome}">
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label> Endereço </label>
                                        <input type="text" class="form-control" id="endereco" disabled="disabled" name="endereco" placeholder="Endereço" required value="${academia.endereco}">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label> Telefone </label>
                                        <input type="text" class="form-control" id="telefone" disabled="disabled" name="telefone" maxlength="11" placeholder="Telefone" required value="${academia.telefone}">
                                    </div>
                                </div>
                            </div>



                            <a href="listAcademia.jsp" class="btn btn-warning btn-fill ">Voltar</a>
                         <a class="btn btn-primary btn-fill" href="AcademiaController?acao=alterar&id=${academia.id}">
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