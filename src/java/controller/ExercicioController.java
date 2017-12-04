package controller;

import bin.Aluno;
import bin.Aparelho;
import bin.Exercicio;
import bin.Treino;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AlunoDAO;
import model.ExercicioDAO;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.ParseException;

public class ExercicioController extends HttpServlet {

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
                        Aluno alu = aDAO.recuperarPorIdMenslidade(Integer.parseInt(id_aluno));
                        request.setAttribute("alu", alu);
                        request.getRequestDispatcher("/listMensalidade.jsp").forward(request, response);

                    }
                    break;
                case "alterar":
                    id = request.getParameter("id");
                    if (id != null && !id.isEmpty() && !id.equals("0")) {
                        ExercicioDAO exdao = new ExercicioDAO();

                        int idExercicio = Integer.parseInt(id);
                        Exercicio ex = exdao.recuperarPorId(idExercicio);
                        if (ex == null) {
                            resposta.print("alert('Exercicio não encontrado!');");
                            resposta.print("history.back();");
                        } else {
                            request.setAttribute("ex", ex);
                            request.getRequestDispatcher("/cadExercicio.jsp").forward(request, response);
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
        PrintWriter resposta = response.getWriter();
        String id = request.getParameter("id");
        String peso = request.getParameter("peso");
        String repeticoes = request.getParameter("repeticoes");
        String serie = request.getParameter("serie");
        Exercicio ex = new Exercicio();
        ex.setPeso(Double.parseDouble(peso));
        ex.setRepetcoes(Integer.parseInt(repeticoes));
        ex.setSerie(Integer.parseInt(serie));
        ex.setId(0);
        String treinoId = request.getParameter("treino");
        if (treinoId != null && !treinoId.isEmpty()) {
            Treino treino = new Treino();
            treino.setId(Integer.parseInt(request.getParameter("treino")));

            ex.setTreino(treino);
        } else {
            resposta.write("<script>alert('Selecione o treino!');history.back();</script>");
            return;
        }
        String aparelhoId = request.getParameter("aparelho");
        if (aparelhoId != null && !aparelhoId.isEmpty()) {
            Aparelho aparelho = new Aparelho();
            aparelho.setId(Integer.parseInt(request.getParameter("aparelho")));

            ex.setAparelho(aparelho);
        } else {
            resposta.write("<script>alert('Selecione um aparelho!');history.back();</script>");
            return;
        }
        ExercicioDAO exdao = new ExercicioDAO();
        boolean sucesso = false;
        String mensagem = "";
        if (id != null && !id.isEmpty() && !id.equals("0")) {
            int idExercicio = Integer.parseInt(id);

            ex.setId(idExercicio);
            sucesso = exdao.alterar(ex);
            mensagem = " Exercicio foi alterada com sucesso!";
        } else {
            sucesso = exdao.inserir(ex);
            mensagem = " Exercicio foi cadastrada com sucesso!";
        }
        if (sucesso == true) {
            PrintWriter out = response.getWriter();
            out.println("<script>alert('" + mensagem + "');location.href='javascript:history.back()'</script>");
            // Conseguiu salvar
        } else {
            // Não salvou
            PrintWriter out = response.getWriter();
            out.println("<script>alert('Erro ao cadastrar Mensalidade');location.href='javascript:history.back()'</script>");
        }
        resposta.close();
    }

}
