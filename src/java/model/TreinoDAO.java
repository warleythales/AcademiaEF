package model;

import bin.Aluno;
import bin.Treino;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class TreinoDAO {

    public boolean inserir(Treino t) {
        try {
            String sql = "INSERT INTO treino (descricao, data_inicio, data_fim, id_aluno) "
                    + "VALUES (?,?,?,?)";
            Connection con = Conexao.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getDescricao());
            ps.setDate(2, new Date(t.getData_inicio().getTime()));
            ps.setDate(3, new Date(t.getData_fim().getTime()));
            ps.setInt(4, t.getAluno().getId());

            ps.execute();
            ps.close();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println("TreinoDAO::inserir");
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean alterar(Treino t) {
        try {
            String sql = "UPDATE treino SET descricao=?, data_inicio=?, data_fim=?, id_aluno=? WHERE id=?";
            Connection con = Conexao.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getDescricao());
            ps.setDate(2, new Date(t.getData_inicio().getTime()));
            ps.setDate(3, new Date(t.getData_fim().getTime()));
            ps.setInt(4, t.getAluno().getId());
            ps.setInt(5, t.getId());
            ps.execute();
            ps.close();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println("TreinoDAO::alterar");
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean excluir(int id) {
        try {
            String sql = "DELETE FROM treino WHERE id=?";
            Connection con = Conexao.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            ps.close();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println("TreinoDAO::excluir");
            System.out.println(e.getMessage());
            return false;
        }
    }

    public Treino recuperarPorId(int id) {
        try {
            String sql = "SELECT id, descricao, data_inicio, data_fim, id_aluno FROM treino WHERE id=?";

            Connection con = Conexao.conectar();
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            Treino trei = null;
            if (rs.next()) {
                trei = new Treino();
                trei.setId(rs.getInt("id"));
                trei.setDescricao(rs.getString("descricao"));
                trei.setData_inicio(rs.getDate("data_inicio"));
                trei.setData_fim(rs.getDate("data_fim"));

                AlunoDAO aluDAO = new AlunoDAO();
                Aluno aluno = aluDAO.recuperarPorId(rs.getInt("id_aluno"));
                trei.setAluno(aluno);
            }
            pstm.close();
            con.close();
            return trei;
        } catch (Exception e) {
            System.out.println("TreinoDAO::recuperarPorId");
            System.out.println(e.getMessage());
            return null;
        }

    }

    public ArrayList<Treino> getLista() {
        ArrayList<Treino> lista = new ArrayList<Treino>();
        try {
            String sql = "SELECT id, descricao, data_inicio, data_fim, id_aluno FROM treino";
            Connection con = Conexao.conectar();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            AlunoDAO aDAO = new AlunoDAO();
            while (rs.next()) {
                Treino t = new Treino();
                t.setId(rs.getInt("id"));
                t.setDescricao(rs.getString("descricao"));
                t.setData_inicio(rs.getDate("data_inicio"));
                t.setData_fim(rs.getDate("data_fim"));

                Aluno aluno = aDAO.recuperarPorId(rs.getInt("id_aluno"));
                t.setAluno(aluno);

                lista.add(t);

            }

            System.out.println("TreinoDAO::getLista");
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println("TreinoDAO::getLista");
            System.out.println(e.getMessage());
        }
        return lista;
    }

    public ArrayList<Treino> getListaAluno(int id) {
        ArrayList<Treino> lista = new ArrayList<Treino>();
        try {
            String sql = "SELECT id, descricao, data_inicio, data_fim, id_aluno FROM treino WHERE id_aluno=?";
            Connection con = Conexao.conectar();
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            AlunoDAO daoAluno = new AlunoDAO();
            Aluno aluno = null;

            while (rs.next()) {
                if (aluno == null) {
                    aluno = daoAluno.recuperarPorId(rs.getInt("id_aluno"));
                }
                Treino t = new Treino();
                t.setId(rs.getInt("id"));
                t.setDescricao(rs.getString("descricao"));
                t.setData_inicio(rs.getDate("data_inicio"));
                t.setData_fim(rs.getDate("data_fim"));

                t.setAluno(aluno);

                lista.add(t);

            }

            System.out.println("TreinoDAO::getListaAluno");
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println("TreinoDAO::getListaAluno");
            System.out.println(e.getMessage());
        }
        return lista;
    }

    public Treino recuperarPorIdExercicio(int id) {
        try {
            Treino t = recuperarPorId(id);
            ExercicioDAO exDAO = new ExercicioDAO();
            t.setMeusExercicios(exDAO.getListaTreino(id));
            return t;
        } catch (Exception e) {
            System.out.println("TreinoDAO::recuperarPorIdExercicio");
            System.out.println(e.getMessage());
            return null;
        }

    }
}
