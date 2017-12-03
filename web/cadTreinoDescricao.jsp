

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="cabecalho.jsp" %>
<script>
    function confirmarExclusao(id, cpf) {
        if (confirm('Deseja realmente excluir o aluno ' + cpf + '?')) {
            location.href = 'AcademiaController?acao=excluir&id=' + id;
        }
    }
</script>
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






                    <h3 class="title">Aluno:</h3> <br>

                    <h3 class="title">Descrição do Treino:</h3>


                    <div class="row">
                        <form action="CargoController" method="POST">
                            <input type="hidden" name="id" value="${c.id}" />

                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <div class=" text-center">
                                            <h3>Breve Descrição:</h3>
                                        </div>
                                    </div>
                                    <input rows="5" type="text" class="form-control" id="descricao" name="descricao" maxlength="255" placeholder="Descrição" required value="${t.descricao}">

                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label> Data de Início: </label>
                                        <input type="text" class="form-control" id="data_xxxxxxx" name="data_nasc" placeholder="00/00/0000" required value="<fmt:formatDate value="${f.data_xxxxxxxx}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label> Data de Fim: </label>
                                            <input type="text" class="form-control" id="data_xxxxxxx" name="sexo"  placeholder="00/00/0000" required value="<fmt:formatDate value="${f.data_xxxxxxxxx}" pattern="dd/MM/yyyy"></fmt:formatDate>">
                                        </div>
                                    </div>
                                </div>


                                <button class="btn btn-success btn-fill">Gravar</button>
                                <a href="cadTreino.jsp" class="btn btn-warning btn-fill ">Voltar</a>
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