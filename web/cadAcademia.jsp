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
                        <h2 class="title" align="left">Cadastro de Academias</h2>
                        <hr>
                        <h4 class="title">Dados da Academia</h4>
                    </div>

                    <div class="content">
                        <form action="AcademiaController" method="POST">


                            <input type="hidden" name="id" value="${a.id}" />

                            <div class="row">
                                <div class="col-md-8">
                                    <label> CNPJ (Sem Pontuação) </label>
                                    <input type="text" class="form-control" id="cnpj" name="cnpj" maxlength="14" placeholder="CNPJ"  required value="${a.cnpj}">
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label> Nome </label>
                                    <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome" required value="${a.nome}">
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label> Endereço </label>
                                        <input type="text" class="form-control" id="endereco" name="endereco" placeholder="Endereço" required value="${a.endereco}">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label> Telefone </label>
                                        <input type="text" class="form-control" id="telefone" name="telefone" maxlength="11" placeholder="Telefone" required value="${a.telefone}">
                                    </div>
                                </div>
                            </div>



                            <button class="btn btn-success btn-fill">Gravar</button>
                            <a href="listAcademia.jsp" class="btn btn-warning btn-fill ">Voltar</a>

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