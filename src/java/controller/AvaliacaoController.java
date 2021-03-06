package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bin.Avaliacao;
import model.AvaliacaoDAO;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import bin.Aluno;
import model.AlunoDAO;

@WebServlet(name = "AvaliacaoController", urlPatterns = {"/AvaliacaoController"})
public class AvaliacaoController extends HttpServlet {

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
                        Aluno alu = aDAO.recuperarPorIdAvaliacao(Integer.parseInt(id_aluno));
                        request.setAttribute("alu", alu);
                        request.getRequestDispatcher("/listAvaliacao.jsp").forward(request, response);

                    }
                    break;
                case "alterar":
                    id = request.getParameter("id");
                    if (id != null && !id.isEmpty() && !id.equals("0")) {
                        AvaliacaoDAO avadao = new AvaliacaoDAO();
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

                        int idAvalicao = Integer.parseInt(id);
                        Avaliacao ava = avadao.recuperarPorId(idAvalicao);
                        if (ava == null) {
                            resposta.print("alert('Avaliaçao não encontrada!');");
                            resposta.print("history.back();");
                        } else {
                            request.setAttribute("ava", ava);
                            request.getRequestDispatcher("/cadAvaliacao.jsp").forward(request, response);
                        }
                    } else {

                        resposta.write("alert('Ação Inválida!');");
                        resposta.write("history.back();");

                    }
                    break;

                case "exibir":
                    id = request.getParameter("id");
                    if (id != null && !id.isEmpty() && !id.equals("0")) {
                        int idAvalicao = Integer.parseInt(id);
                        AvaliacaoDAO avadao = new AvaliacaoDAO();
                        Avaliacao ava = avadao.recuperarPorId(idAvalicao);
                        if (ava == null) {

                            resposta.print("alert('Avaliaçao não encontrada!');");
                            resposta.print("history.back();");
                        } else {
                            request.setAttribute("ava", ava);
                            request.getRequestDispatcher("/exibirAvaliacao.jsp").forward(request, response);
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
            String biotipo = request.getParameter("biotipo");
            String data_ava = request.getParameter("data_ava");
            String idade = request.getParameter("idade");
            String peso = request.getParameter("peso");
            String ombro = request.getParameter("ombro");
            String braco_relaxado = request.getParameter("braco_relaxado");
            String braco_contraido = request.getParameter("braco_contraido");
            String antebraco = request.getParameter("antebraco");
            String torax = request.getParameter("torax");
            String panturrilha = request.getParameter("panturrilha");
            String cintura = request.getParameter("cintura");
            String abdomen = request.getParameter("abdomen");
            String quadril = request.getParameter("quadril");
            String coxa = request.getParameter("coxa");
            String validade_ava = request.getParameter("validade_ava");

            Avaliacao a = new Avaliacao();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

            a.setBiotipo(biotipo);
            a.setData_ava(sdf.parse(request.getParameter("data_ava")));
            a.setIdade(Integer.parseInt(idade));
            a.setPeso(Double.parseDouble(torax));
            a.setOmbro(Double.parseDouble(ombro));
            a.setBraco_relaxado(Double.parseDouble(braco_relaxado));
            a.setBraco_contraido(Double.parseDouble(braco_relaxado));
            a.setAntebraco(Double.parseDouble(antebraco));
            a.setTorax(Double.parseDouble(torax));
            a.setPanturrilha(Double.parseDouble(panturrilha));
            a.setCintura(Double.parseDouble(cintura));
            a.setAbdomen(Double.parseDouble(abdomen));
            a.setQuadril(Double.parseDouble(quadril));
            a.setCoxa(Double.parseDouble(coxa));
            a.setValidade_ava(sdf.parse(request.getParameter("validade_ava")));

            String alunoId = request.getParameter("aluno");

            if (alunoId != null && !alunoId.isEmpty()) {
                Aluno aluno = new Aluno();
                aluno.setId(Integer.parseInt(request.getParameter("aluno")));

                a.setAluno(aluno);
            } else {
                resposta.write("<script>alert('Selecione o aluno!');history.back();</script>");
                return;
            }

            AvaliacaoDAO dao = new AvaliacaoDAO();
            boolean sucesso = false;
            String mensagem = "";
            if (id != null && !id.isEmpty() && !id.equals("0")) {
                int idAvaliacao = Integer.parseInt(id);
                a.setId(idAvaliacao);
                sucesso = dao.alterar(a);
                mensagem = "Avaliação Física alterada com sucesso!";
            } else {
                sucesso = dao.inserir(a);
                mensagem = "Avaliação Física cadastrada com sucesso!";
            }

            if (sucesso == true) {
                PrintWriter out = response.getWriter();
                out.println("<script>alert('" + mensagem + "');location.href='javascript:history.go(-2)'</script>");
            } else {
                resposta.print("<h1> Erro ao Gravar Avaliação Física </h1>");
                resposta.print("<a href='javascript:history.back()'> voltar </a>");
            }

            resposta.close();
        } catch (ParseException ex) {
            Logger.getLogger(AvaliacaoController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
