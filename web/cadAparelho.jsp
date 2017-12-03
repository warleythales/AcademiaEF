
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
                            <h2 class="title" align="left">Cadastro de Aparelhos</h2>
                            <hr>
                            <h4 class="title"> Dados do Aparelho </h4>
                        </div>
                        <div class="content">
                            <form action="AparelhoController" method="POST">
                                <input type="hidden" name="id" value="${a.id}" />

                                <div class="row">
                                    <div class="col-md-1">
                                        <div class="form-group">
                                            <label> Número </label>
                                            <input type="text" class="form-control" id="numero" name="numero" maxlength="3" placeholder="Número"  required value="${a.numero}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label> Nome </label>
                                            <input type="text" class="form-control" id="nome" name="nome" maxlength="45" placeholder="Nome" required value="${a.nome}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-10">
                                        <div class="form-group">
                                            <label> Breve Descrição </label>
                                            <input rows="5" type="text" class="form-control" id="descricao" name="descricao" maxlength="255" placeholder="Descrição" required value="${a.descricao}">
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
