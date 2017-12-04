package controller;

import bin.Aluno;
import bin.Treino;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AlunoDAO;
import model.TreinoDAO;

public class TreinoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = null;
        String acao = request.getParameter("acao");
        PrintWriter resposta = response.getWriter();
        resposta.write("<script>");

        if (acao != null) {

            switch (acao) {
                case "listar-aluno":

                    String id_aluno = request.getParameter("id_aluno");
                    if (id_aluno != null && !id_aluno.isEmpty() && !id_aluno.equals("0")) {
                        AlunoDAO aDAO = new AlunoDAO();
                        Aluno alu = aDAO.recuperarPorIdTreino(Integer.parseInt(id_aluno));
                        request.setAttribute("alu", alu);
                        request.getRequestDispatcher("/listGerenciamentoTreinoAluno.jsp").forward(request, response);

                    }
                    break;
                case "alterar":
                    id = request.getParameter("id");
                    if (id != null && !id.isEmpty() && !id.equals("0")) {
                        TreinoDAO tdao = new TreinoDAO();
                        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

                        int idTreino = Integer.parseInt(id);
                        Treino t = tdao.recuperarPorId(idTreino);
                        if (t == null) {
                            resposta.print("alert('Treino não encontrado!');");
                            resposta.print("history.back();");
                        } else {
                            request.setAttribute("t", t);
                            request.getRequestDispatcher("/cadTreino.jsp").forward(request, response);
                        }
                    } else {

                        resposta.write("alert('Ação Inválida!');");
                        resposta.write("history.back();");

                    }
                    break;

                case "exibir":
                    id = request.getParameter("id");
                    if (id != null && !id.isEmpty() && !id.equals("0")) {
                        int idTreino = Integer.parseInt(id);
                        TreinoDAO tdao = new TreinoDAO();
                        Treino t = tdao.recuperarPorIdExercicio(idTreino);
                        request.setAttribute("t", t);
                        request.getRequestDispatcher("/exibirTreino.jsp").forward(request, response);

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
            String descricao = request.getParameter("descricao");
            String data_inicio = request.getParameter("data_inicio");
            String data_fim = request.getParameter("data_fim");

            Treino t = new Treino();
            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

            t.setDescricao(descricao);
            t.setData_inicio(df.parse(request.getParameter("data_inicio")));
            t.setData_fim(df.parse(request.getParameter("data_fim")));

            String alunoId = request.getParameter("aluno");

            if (alunoId != null && !alunoId.isEmpty()) {
                Aluno aluno = new Aluno();
                aluno.setId(Integer.parseInt(request.getParameter("aluno")));

                t.setAluno(aluno);
            } else {
                resposta.write("<script>alert('Selecione um Aluno!');history.back();</script>");
                return;
            }
            TreinoDAO tdao = new TreinoDAO();
            boolean sucesso = false;
            String mensagem = "";
            if (id != null && !id.isEmpty() && !id.equals("0")) {
                int idTreino = Integer.parseInt(id);

                t.setId(idTreino);
                sucesso = tdao.alterar(t);
                mensagem = " Treino foi alterado com sucesso!";
            } else {
                sucesso = tdao.inserir(t);
                mensagem = " Treino foi cadastrado com sucesso!";
            }

            if (sucesso == true) {
                resposta.print("<h1>" + mensagem + "</h1>");
                resposta.print("<a href='listTreino.jsp'>voltar</a>");
                // Conseguiu salvar
            } else {
                // Não salvou
                resposta.print("<h1 style='color:black'> Erro ao salvar treino! </h1>");
                resposta.print("<a href='javascript:history.back()'>voltar</a>");
            }
            resposta.close();
        } catch (ParseException ex) {
            Logger.getLogger(FuncionarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
