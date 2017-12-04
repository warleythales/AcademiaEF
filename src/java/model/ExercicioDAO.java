package model;

import bin.Aparelho;
import bin.Exercicio;
import bin.Treino;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ExercicioDAO {

    public boolean inserir(Exercicio ex) {
        try {
            String sql = "INSERT INTO exercicios (peso, repeticoes, serie, id_treino, id_aparelho) "
                    + "VALUES (?,?,?,?,?)";
            Connection con = Conexao.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, ex.getPeso());
            ps.setInt(2, ex.getRepetcoes());
            ps.setInt(3, ex.getSerie());
            ps.setInt(4, ex.getTreino().getId());
            ps.setInt(5, ex.getAparelho().getId());

            ps.execute();
            ps.close();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println("ExercicioDAO::inserir");
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean alterar(Exercicio ex) {
        try {
            String sql = "UPDATE exercicios SET peso=?, repeticoes=?, serie=?, id_treino=?, id_aparelho=? WHERE id=?";
            Connection con = Conexao.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, ex.getPeso());
            ps.setInt(2, ex.getRepetcoes());
            ps.setInt(3, ex.getSerie());
            ps.setInt(4, ex.getTreino().getId());
            ps.setInt(5, ex.getAparelho().getId());
            ps.setInt(6, ex.getId());
            ps.execute();
            ps.close();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println("ExercicioDAO::alterar");
            System.out.println(e.getMessage());
            return false;
        }
    }

    public Exercicio recuperarPorId(int id) {
        try {
            String sql = "SELECT id, peso, repeticoes, serie, id_treino, id_aparelho FROM exercicios WHERE id=?";

            Connection con = Conexao.conectar();
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            Exercicio ex = null;
            if (rs.next()) {
                ex = new Exercicio();
                ex.setPeso(rs.getDouble("peso"));
                ex.setRepetcoes(rs.getInt("repeticoes"));
                ex.setRepetcoes(rs.getInt("serie"));

                TreinoDAO tDAO = new TreinoDAO();
                Treino t = tDAO.recuperarPorId(rs.getInt("id_treino"));
                ex.setTreino(t);

                AparelhoDAO apDAO = new AparelhoDAO();
                Aparelho ap = apDAO.buscarPorId(rs.getInt("id_aparelho"));
                ex.setAparelho(ap);
            }
            pstm.close();
            con.close();
            return ex;
        } catch (Exception e) {
            System.out.println("ExercicioDAO::recuperarPorId");
            System.out.println(e.getMessage());
            return null;
        }

    }

    public Exercicio recuperarPorIdTreino(int id) {
        try {
            String sql = "SELECT peso, repeticoes, serie, id_treino, id_aparelho FROM exercicios WHERE id_treino=?";

            Connection con = Conexao.conectar();
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            Exercicio ex = null;
            if (rs.next()) {
                ex = new Exercicio();
                ex.setPeso(rs.getDouble("peso"));
                ex.setRepetcoes(rs.getInt("repeticoes"));
                ex.setRepetcoes(rs.getInt("serie"));

                TreinoDAO tDAO = new TreinoDAO();
                Treino t = tDAO.recuperarPorId(rs.getInt("id_treino"));
                ex.setTreino(t);

                AparelhoDAO apDAO = new AparelhoDAO();
                Aparelho ap = apDAO.buscarPorId(rs.getInt("id_aparelho"));
                ex.setAparelho(ap);
            }
            pstm.close();
            con.close();
            return ex;
        } catch (Exception e) {
            System.out.println("ExercicioDAO::recuperarPorId");
            System.out.println(e.getMessage());
            return null;
        }

    }

    public ArrayList<Exercicio> getListaTreino(int id) {
        ArrayList<Exercicio> lista = new ArrayList<Exercicio>();
        try {
            String sql = "SELECT peso, repeticoes, serie, id_treino, id_aparelho FROM exercicios WHERE id_treino=?";
            Connection con = Conexao.conectar();
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            TreinoDAO daoTreino = new TreinoDAO();
            Treino treino = null;

            AparelhoDAO apdao = new AparelhoDAO();

            while (rs.next()) {
                if (treino == null) {
                    treino = daoTreino.recuperarPorId(rs.getInt("id_treino"));
                }
                Exercicio ex = new Exercicio();
                ex.setPeso(rs.getDouble("peso"));
                ex.setRepetcoes(rs.getInt("repeticoes"));
                ex.setSerie(rs.getInt("serie"));

                ex.setTreino(treino);

                Aparelho ap = apdao.buscarPorId(rs.getInt("id_aparelho"));
                ex.setAparelho(ap);

                lista.add(ex);

            }

            System.out.println("ExercicioDAO::getListaAluno");
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println("ExercicioDAO::getListaAluno");
            System.out.println(e.getMessage());
        }
        return lista;
    }
}
