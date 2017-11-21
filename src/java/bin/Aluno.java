package bin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import model.AlunoDAO;
import model.Conexao;
import model.FuncionarioDAO;

public class Aluno {

    private int id;
    private String cpf;
    private String nome;
    private String email;
    private Date data_nasc;
    private String sexo;
    private String endereco;
    private String telefone;
    private String status;
    private double valor_mensalidade;
    private String plano;
    private String senha;
    private Academia academia;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getData_nasc() {
        return data_nasc;
    }

    public void setData_nasc(Date data_nasc) {
        this.data_nasc = data_nasc;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getValor_mensalidade() {
        return valor_mensalidade;
    }

    public void setValor_mensalidade(double valor_mensalidade) {
        this.valor_mensalidade = valor_mensalidade;
    }

    public String getPlano() {
        return plano;
    }

    public void setPlano(String plano) {
        this.plano = plano;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Academia getAcademia() {
        return academia;
    }

    public void setAcademia(Academia academia) {
        this.academia = academia;
    }

    public ArrayList<Avaliacao> getListarAvaliacao() {
        ArrayList<Avaliacao> listaA = new ArrayList<Avaliacao>();
        try {
            String sql = "SELECT id, biotipo, data_ava, idade, peso, ombro, braco_relaxado, braco_contraido, "
                    + "antebraco, torax, panturrilha, cintura, abdomen, quadril, coxa, "
                    + "validade_ava, id_aluno FROM avaliacao_fisica ";
            Connection con = Conexao.conectar();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            AlunoDAO daoAluno = new AlunoDAO();

            while (rs.next()) {
                Avaliacao a = new Avaliacao();
                a.setId(rs.getInt("id"));
                a.setBiotipo(rs.getString("biotipo"));
                a.setData_ava(rs.getDate("data_ava"));
                a.setIdade(rs.getInt("idade"));
                a.setPeso(rs.getDouble("peso"));
                a.setOmbro(rs.getDouble("ombro"));
                a.setBraco_relaxado(rs.getDouble("braco_relaxado"));
                a.setBraco_contraido(rs.getDouble("braco_contraido"));
                a.setAntebraco(rs.getDouble("antebraco"));
                a.setTorax(rs.getDouble("torax"));
                a.setPanturrilha(rs.getDouble("panturrilha"));
                a.setQuadril(rs.getDouble("quadril"));
                a.setCoxa(rs.getDouble("coxa"));
                a.setValidade_ava(rs.getDate("validade_ava"));

                Aluno aluno = daoAluno.carregarPorId(rs.getInt("id_aluno"));
                a.setAluno(aluno);

                listaA.add(a);

            }
            System.out.println("Listar executado");
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println("AvaliacaoDAO::listar");
            System.out.println(e.getMessage());
        }
        return listaA;
    }

    public ArrayList<Mensalidade> getListarMensalidade() {
        ArrayList<Mensalidade> listaM = new ArrayList<Mensalidade>();
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

                Aluno aluno = daoAluno.carregarPorId(rs.getInt("id_aluno"));
                m.setAluno(aluno);

                Funcionario f = fdao.recuperarPorId(rs.getInt("id_funcionario"));
                m.setFuncionario(f);

                listaM.add(m);

            }

            System.out.println("MensalidadeDAO::getLista");
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println("MensalidadeDAO::getLista");
            System.out.println(e.getMessage());
        }
        return listaM;
    }

}
