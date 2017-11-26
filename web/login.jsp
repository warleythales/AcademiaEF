<%@include file="cabecalho.jsp" %>
<%
    HttpSession sessao = request.getSession();

    if (sessao.getAttribute("funcionario") != null) {
        response.sendRedirect("index.jsp");
    }
%>
</head>

<body>



    <div class="header-wrapper">
        <div class="glyphicon banner2" >

        </div>
        <nav class="navbar navbar-transparent navbar-fixed-top" role="navigation" >
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button id="menu-toggle" type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a>
                        <div class="logo-container">
                            <div class="logo">

                                <form action="SegurancaController" method="POST" >
                                    <div class="form-group">
                                        <label for="cpf" class="control-label">Usuário</label>
                                        <input type="text" id="cpf" name="cpf" class="form-control" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="senha" class="control-label">Senha</label>
                                        <input type="password" id="senha" name="senha" class="form-control" required>
                                    </div>

                                    <button class="btn btn-primary btn-fill">Entrar</button>
                                </form>
                            </div>

                        </div>
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse">
                    <ul  class="nav navbar-nav navbar-right">

                    </ul>


                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <div class="logo-container">


        </div>



    </div>





</body>
<%@include file="rodape.jsp" %>