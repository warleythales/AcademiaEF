package controller;

import model.MensalidadeDAO;
import bin.Mensalidade;
import bin.Aluno;
import bin.Funcionario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AlunoDAO;

@WebServlet(name = "MensalidadeController", urlPatterns = {"/MensalidadeController"})
public class MensalidadeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = null;
        String acao = request.getParameter("acao");
        PrintWriter resposta = response.getWriter();
        resposta.write("<script>");

        if (acao != null) {

            switch (acao) {
                case "excluir":
                    id = request.getParameter("id");
                    if (id != null && !id.isEmpty() && !id.equals("0")) {
                        MensalidadeDAO mdao = new MensalidadeDAO();
                        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

                        int idMensalidade = Integer.parseInt(id);
                        if (mdao.excluir(idMensalidade)) {
                            resposta.print("alert('Mensalidade foi excluída com sucesso!');");
                            resposta.print("location.href='listMensalidade.jsp';");

                        }
                    } else {

                        resposta.write("alert('Ação Inválida!');");
                        resposta.write("history.back();");

                    }
                    break;
                case "listar-aluno":

                    String id_aluno = request.getParameter("id_aluno");
                    if (id_aluno != null && !id_aluno.isEmpty() && !id_aluno.equals("0")) {
                        AlunoDAO aDAO = new AlunoDAO();
                        Aluno alu = aDAO.recuperarPorIdMenslidade(Integer.parseInt(id_aluno));
                        request.setAttribute("alu", alu);
                        request.getRequestDispatcher("/listMensalidade.jsp").forward(request, response);

                    }
                    break;
                case "alterar":
                    id = request.getParameter("id");
                    if (id != null && !id.isEmpty() && !id.equals("0")) {
                        MensalidadeDAO mdao = new MensalidadeDAO();
                        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

                        int idMensalidade = Integer.parseInt(id);
                        Mensalidade m = mdao.recuperarPorId(idMensalidade);
                        if (m == null) {
                            resposta.print("alert('Mensalidade não encontrada!');");
                            resposta.print("history.back();");
                        } else {
                            request.setAttribute("m", m);
                            request.getRequestDispatcher("/cadMensalidade.jsp").forward(request, response);
                        }
                    } else {

                        resposta.write("alert('Ação Inválida!');");
                        resposta.write("history.back();");

                    }
                    break;

                case "exibir":
                    id = request.getParameter("id");
                    if (id != null && !id.isEmpty() && !id.equals("0")) {
                        int idMensalidade = Integer.parseInt(id);
                        MensalidadeDAO mdao = new MensalidadeDAO();
                        Mensalidade mensalidade = mdao.recuperarPorId(idMensalidade);
                        if (mensalidade == null) {

                            resposta.print("alert('Mensalidade não encontrada!');");
                            resposta.print("history.back();");
                        } else {
                            request.setAttribute("m", mensalidade);
                            request.getRequestDispatcher("/exibirMensalidade.jsp").forward(request, response);
                        }
                    } else {

                        resposta.write("alert('Ação Inválida!');");
                        resposta.write("history.back();");

                    }
                    break;
            }
        }

        resposta.write("</script>");
        resposta.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter resposta = response.getWriter();

            String id = request.getParameter("id");
            String valor_pago = request.getParameter("valor_pago");
            String data_pag = request.getParameter("data_pag");
            String data_venc = request.getParameter("data_venc");
            String status = request.getParameter("status");

            Mensalidade m = new Mensalidade();
            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            m.setValor_pago(Double.parseDouble(valor_pago));
            m.setData_pag(df.parse(request.getParameter("data_pag")));
            m.setData_venc(df.parse(request.getParameter("data_venc")));
            m.setStatus(status);
            m.setId(0);

            String alunoId = request.getParameter("aluno");

            if (alunoId != null && !alunoId.isEmpty()) {
                Aluno aluno = new Aluno();
                aluno.setId(Integer.parseInt(request.getParameter("aluno")));

                m.setAluno(aluno);
            } else {
                resposta.write("<script>alert('Selecione o aluno!');history.back();</script>");
                return;
            }

            String funcionarioId = request.getParameter("funcionario");

            if (funcionarioId != null && !funcionarioId.isEmpty()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setId(Integer.parseInt(request.getParameter("funcionario")));

                m.setFuncionario(funcionario);
            } else {
                resposta.write("<script>alert('Selecione um funcionário!');history.back();</script>");
                return;
            }

            MensalidadeDAO mdao = new MensalidadeDAO();
            boolean sucesso = false;
            String mensagem = "";
            if (id != null && !id.isEmpty() && !id.equals("0")) {
                int idMensalidade = Integer.parseInt(id);

                m.setId(idMensalidade);
                sucesso = mdao.alterar(m);
                mensagem = " Mensalidade foi alterada com sucesso!";
            } else {
                sucesso = mdao.inserir(m);
                mensagem = " Mensalidade foi cadastrada com sucesso!";
            }

            if (sucesso == true) {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('" + mensagem + "');location.href='./listAluno.jsp'</script>");
                // Conseguiu salvar
            } else {
                // Não salvou
                PrintWriter out = response.getWriter();
                out.println("<script>alert('Erro ao cadastrar Mensalidade');location.href='javascript:history.back()'</script>");
            }
            resposta.close();
        } catch (ParseException ex) {
            PrintWriter out = response.getWriter();
            out.println("<script>alert('Erro ao cadastrar Mensalidade');location.href='./listAluno.jsp'</script>");
            Logger.getLogger(FuncionarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
