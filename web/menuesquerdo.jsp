<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="bin.Funcionario"%>
<%@page import="model.FuncionarioDAO"%>

<%
    Funcionario funcionario = new Funcionario();
    HttpSession sessao = request.getSession();

    if (sessao.getAttribute("funcionario") == null) {
        response.sendRedirect("login.jsp");
    } else{
       funcionario = (Funcionario) sessao.getAttribute("funcionario"); 
    }
%>
<c:choose>
    <c:when test = "${funcionario.cargo.id == 1 }">
       <ul class="nav">
    <li>
        <a href="listAcademia.jsp">
            <i class="pe-7s-culture"></i>
            <p>Academia</p>
        </a>
    </li>
    <li>
        <a href="listFuncionario.jsp">
            <i class="pe-7s-user"></i>
            <p>Funcionário</p>
        </a>
    </li>
    <li>
        <a href="listCargo.jsp">
            <i class="pe-7s-id"></i>
            <p>Cargo</p>
        </a>
    </li>
    <li>
        <a href="listAluno.jsp">
            <i class="pe-7s-users"></i>
            <p>Aluno</p>
        </a>
    </li>

    <li>
        <a href="listAparelho.jsp">
            <i class="pe-7s-gym"></i>
            <p>Aparelho</p>
        </a>
    </li>
    </ul>
    </c:when>
    <c:when test = "${funcionario.cargo.id == 2 }">
       <ul class="nav">
    
    <li>
        <a href="listAluno.jsp">
            <i class="pe-7s-users"></i>
            <p>Aluno</p>
        </a>
    </li>

    <li>
        <a href="listAparelho.jsp">
            <i class="pe-7s-gym"></i>
            <p>Aparelho</p>
        </a>
    </li>
    </ul>
    </c:when>
    <c:when test = "${funcionario.cargo.id == 3 }">
       <ul class="nav">
    
    <li>
        <a href="listAluno.jsp">
            <i class="pe-7s-users"></i>
            <p>Aluno</p>
        </a>
    </li>

    <li>
        <a href="listAparelho.jsp">
            <i class="pe-7s-gym"></i>
            <p>Aparelho</p>
        </a>
    </li>
    </ul>
    </c:when>
    
    
    
</c:choose>
       
       
    
    