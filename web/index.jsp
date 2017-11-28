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

                    <h2 class="title">Sistema de Controle de Dados AcademiaEF</h2>
                    <h4 class="title">Seja Bem-vindo <%= funcionario.getNome()%></h4> 
                </div>
                <%@include file="menuGlobal.jsp" %>



            </div>
        </nav>
</body>




<%@include file="rodape.jsp" %>