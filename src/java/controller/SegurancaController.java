package controller;

import bin.Funcionario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.FuncionarioDAO;

public class SegurancaController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("logout") != null) {
            HttpSession sessao = request.getSession();
            sessao.removeAttribute("funcionario");
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cpf = request.getParameter("cpf");
        String senha = request.getParameter("senha");
        PrintWriter out = response.getWriter();
        FuncionarioDAO dao = new FuncionarioDAO();
        Funcionario funcionario = dao.pegaUm(cpf);
        if (funcionario == null) {
            out.print("<script>alert('Usuário ou Senha inválido.');location.href='login.jsp';</script>");
        } else {
            if (funcionario.isAtivo()) {
                if (funcionario.getSenha().equals(senha)) {
                    HttpSession sessao = request.getSession();
                    sessao.setAttribute("funcionario", funcionario);
                    response.sendRedirect("index.jsp");
                } else {
                    out.print("<script>alert('Usuário ou Senha inválido kk.');location.href='login.jsp';</script>");
                }

            } else {
                out.print("<script>alert('Usuário bloqueado contate o administrador.');location.href='login.jsp';</script>");
            }

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
