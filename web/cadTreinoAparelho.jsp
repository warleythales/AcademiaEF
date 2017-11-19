
<%@include file="cabecalho.jsp" %>
</head>

<body>

    <div class="wrapper">
        <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-6.jpg">

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
                        <h2 class="title">Cadastro Treino com Aparelho</h2>
                    </div>
                </div>
            </nav>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Dados do Treino com Aparelho</h4>
                                </div>
                                <div class="content">
                                    <form action="TreinoAparelhoControle" method="POST">
                                        <input type="hidden" name="id" value="${a.id}" />

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>CNPJ</label>
                                                    <input type="text" class="form-control" id="cnpj" name="cnpj" maxlength="14" placeholder="CNPJ"  required value="${a.cnpj}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Name</label>
                                                    <input type="text" class="form-control" id="nome" name="nome" placeholder="Name" required value="${a.nome}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Endereço</label>
                                                    <input type="text" class="form-control" id="endereco" name="endereco" placeholder="Endereço" required value="${a.endereco}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Telefone</label>
                                                    <input type="text" class="form-control" id="telefone" name="telefone" maxlength="11" placeholder="Telefone" required value="${a.telefone}">
                                                </div>
                                            </div>
                                        </div>

                                        <button class="btn btn-success btn-fill">Gravar</button>  
                                        <a href="listTreinoAparelho.jsp" class="btn btn-warning btn-fill ">Voltar</a>
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