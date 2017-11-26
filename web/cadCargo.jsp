
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
                    <h2 class="title"> Cadastrar Cargo </h2>
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
                                <h4 class="title"> Dados do Cargo</h4>
                            </div>
                            <div class="content">
                                <form action="CargoController" method="POST">
                                    <input type="hidden" name="id" value="${c.id}" />


                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label> Tipo </label>
                                                <input type="text" class="form-control" id="tipo" name="tipo" placeholder="Tipo do cargo" required value="${c.tipo}">
                                            </div>
                                        </div>
                                    </div>


                                    <button class="btn btn-success btn-fill">Gravar</button>
                                    <a href="listCargo.jsp" class="btn btn-warning btn-fill ">Voltar</a>
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