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
                    <h2 class="title">Cadastrar Academia</h2>
                </div>

                <%@include file="menuGlobal.jsp" %>
            </div>
        </nav>
        <div class="content">
            <div class="container-fluid">
                <div class="row">

                    <div class="card">
                        <div class="header">
                            <h4 class="title">Dados da Academia</h4>
                        </div>

                        <div class="content">
                            <form action="AcademiaController" method="POST">


                                <input type="hidden" name="id" value="${a.id}" />

                                <div class="row">
                                    <div class="col-md-8">
                                        <label> CNPJ </label>
                                        <input type="text" class="form-control" id="cnpj" name="cnpj" maxlength="14" placeholder="CNPJ"  required value="${a.cnpj}">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label> Nome </label>
                                        <input type="text" class="form-control" id="nome" name="nome" placeholder="nome" required value="${a.nome}">
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