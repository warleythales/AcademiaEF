package model;

import bin.Aluno;
import bin.Mensalidade;
import bin.Funcionario;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.PreparedStatement;

public class MensalidadeDAO {

    public boolean inserir(Mensalidade m) {
        try {
            String sql = "INSERT INTO mensalidades (valor_pago, data_pag, data_venc, status, id_aluno, id_funcionario) "
                    + "VALUES (?,?,?,?,?,?)";
            Connection con = Conexao.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, m.getValor_pago());
            ps.setDate(2, new Date(m.getData_pag().getTime()));
            ps.setDate(3, new Date(m.getData_venc().getTime()));
            ps.setString(4, m.getStatus());
            ps.setInt(5, m.getAluno().getId());
            ps.setInt(6, m.getFuncionario().getId());

            ps.execute();
            ps.close();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println("MensalidadeDAO::inserir");
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean alterar(Mensalidade m) {
        try {
            String sql = "UPDATE mensalidades SET valor_pago=?, data_pag=?, data_venc=?, status=?, id_aluno=?, id_funcionario=? WHERE id=?";
            Connection con = Conexao.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, m.getValor_pago());
            ps.setDate(2, new Date(m.getData_pag().getTime()));
            ps.setDate(3, new Date(m.getData_venc().getTime()));
            ps.setString(4, m.getStatus());
            ps.setInt(5, m.getAluno().getId());
            ps.setInt(6, m.getFuncionario().getId());
            ps.setInt(7, m.getId());
            ps.execute();
            ps.close();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println("MensalidadeDAO::alterar");
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean excluir(int id) {
        try {
            String sql = "DELETE FROM mensalidades WHERE id=?";
            Connection con = Conexao.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            ps.close();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println("MensalidadeDAO::excluir");
            System.out.println(e.getMessage());
            return false;
        }
    }

    public Mensalidade recuperarPorId(int id) {
        try {

            String sql = "SELECT id, valor_pago, data_pag, data_venc, status, id_aluno, id_funcionario "
                    + "FROM mensalidades WHERE id=?";

            Connection con = Conexao.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            Mensalidade m = null;
            if (rs.next()) {
                m = new Mensalidade();
                m.setId(rs.getInt("id"));
                m.setValor_pago(rs.getDouble("valor_pago"));
                m.setData_pag(rs.getDate("data_pag"));
                m.setData_venc(rs.getDate("data_venc"));
                m.setStatus(rs.getString("status"));

                AlunoDAO daoAluno = new AlunoDAO();
                Aluno aluno = daoAluno.recuperarPorId(rs.getInt("id_aluno"));
                m.setAluno(aluno);

                FuncionarioDAO fdao = new FuncionarioDAO();
                Funcionario f = fdao.recuperarPorId(rs.getInt("id_funcionario"));
                m.setFuncionario(f);

            }
            ps.close();
            con.close();
            return m;
        } catch (Exception e) {
            System.out.println("AlunoDAO::recuperarPorId");
            System.out.println("FuncionarioDAO::recuperarPorId");
            System.out.println(e.getMessage());
            return null;
        }
    }

    public ArrayList<Mensalidade> getLista() {
        ArrayList<Mensalidade> lista = new ArrayList<Mensalidade>();
        try {
            String sql = "SELECT id, valor_pago, data_pag, data_venc, status,"
                    + " id_aluno, id_funcionario FROM mensalidades";
            Connection con = Conexao.conectar();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            AlunoDAO daoAluno = new AlunoDAO();
            FuncionarioDAO fdao = new FuncionarioDAO();
            while (rs.next()) {
                Mensalidade m = new Mensalidade();
                m.setId(rs.getInt("id"));
                m.setValor_pago(rs.getDouble("valor_pago"));
                m.setData_pag(rs.getDate("data_pag"));
                m.setData_venc(rs.getDate("data_venc"));
                m.setStatus(rs.getString("status"));

                Aluno aluno = daoAluno.recuperarPorId(rs.getInt("id_aluno"));
                m.setAluno(aluno);

                Funcionario f = fdao.recuperarPorId(rs.getInt("id_funcionario"));
                m.setFuncionario(f);

                lista.add(m);

            }

            System.out.println("MensalidadeDAO::getLista");
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println("MensalidadeDAO::getLista");
            System.out.println(e.getMessage());
        }
        return lista;
    }

    public ArrayList<Mensalidade> getListaAluno(int id) {
        ArrayList<Mensalidade> lista = new ArrayList<Mensalidade>();
        try {
            String sql = "SELECT id, valor_pago, data_pag, data_venc, status,"
                    + " id_aluno, id_funcionario FROM mensalidades WHERE id_aluno=?";
            Connection con = Conexao.conectar();
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery(sql);

            AlunoDAO daoAluno = new AlunoDAO();
            Aluno aluno = daoAluno.recuperarPorId(rs.getInt("id_aluno"));

            FuncionarioDAO fdao = new FuncionarioDAO();
            while (rs.next()) {
                Mensalidade m = new Mensalidade();
                m.setId(rs.getInt("id"));
                m.setValor_pago(rs.getDouble("valor_pago"));
                m.setData_pag(rs.getDate("data_pag"));
                m.setData_venc(rs.getDate("data_venc"));
                m.setStatus(rs.getString("status"));

                m.setAluno(aluno);

                Funcionario f = fdao.recuperarPorId(rs.getInt("id_funcionario"));
                m.setFuncionario(f);

                lista.add(m);

            }

            System.out.println("MensalidadeDAO::getLista");
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println("MensalidadeDAO::getLista");
            System.out.println(e.getMessage());
        }
        return lista;
    }

}
