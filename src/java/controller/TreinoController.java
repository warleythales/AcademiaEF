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
import model.TreinoDAO;

public class TreinoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        PrintWriter resposta = response.getWriter();
        resposta.write("<script>");

        if (acao != null) {

            String id = request.getParameter("id");
            if (id != null && !id.isEmpty() && !id.equals("0")) {
                TreinoDAO treiDAO = new TreinoDAO();
                SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

                int idTreino = Integer.parseInt(id);

                switch (acao) {
                    case "excluir":
                        if (treiDAO.excluir(idTreino)) {
                            resposta.print("alert('Treino excluído com sucesso!');");
                            resposta.print("location.href='listTreino.jsp';");

                        }
                        break;
                    case "alterar":
                        Treino trei = treiDAO.recuperarPorId(idTreino);
                        if (trei == null) {
                            resposta.print("alert('Treino não encontrado!');");
                            resposta.print("history.back();");
                        } else {
                            request.setAttribute("trei", trei);
                            request.getRequestDispatcher("/cadTreino1.jsp").forward(request, response);
                        }
                        break;
                     case "exibir":
                        Treino treino = treiDAO.recuperarPorId(idTreino);
                        if (treino == null) {
                            resposta.print("alert('Treino não encontrado!');");
                            resposta.print("history.back();");
                        } else {
                            request.setAttribute("treino", treino);
                            request.getRequestDispatcher("/exibirTreino.jsp").forward(request, response);
                        }
                        break;    
                }
            } else {
                resposta.write("alert('Id inválido!');");
                resposta.write("history.back();");
            }

        } else {

            resposta.write("alert('Ação Inválida!');");
            resposta.write("history.back();");

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
