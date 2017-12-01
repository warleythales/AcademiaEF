
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
                    <h2 class="title"> Cadastrar Aparelho </h2>
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
                                <h4 class="title"> Dados do Aparelho </h4>
                            </div>
                            <div class="content">
                                <form action="AparelhoController" method="POST">
                                    <input type="hidden" name="id" value="${a.id}" />

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label> N�mero </label>
                                                <input type="text" class="form-control" id="numero" name="numero" maxlength="3" placeholder="N�mero"  required value="${a.numero}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label> Nome </label>
                                                <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome" required value="${a.nome}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label> Descri��o </label>
                                                <input type="text" class="form-control" id="descricao" name="descricao" placeholder="Descri��o" required value="${a.descricao}">
                                            </div>
                                        </div>
                                    </div>



                                    <button class="btn btn-success btn-fill"> Gravar </button>
                                    <a href="listAparelho.jsp" class="btn btn-warning btn-fill ">Voltar</a>
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
