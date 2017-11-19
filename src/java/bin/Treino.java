package bin;

import java.util.Date;

public class Treino {

    private int id_treino;
    private int id_aparelho;
    private String descricao;
    private Date data_inicio;
    private Date data_fim;
    private Aluno aluno;

    public int getId_treino() {
        return id_treino;
    }

    public void setId_treino(int id_treino) {
        this.id_treino = id_treino;
    }

    public int getId_aparelho() {
        return id_aparelho;
    }

    public void setId_aparelho(int id_aparelho) {
        this.id_aparelho = id_aparelho;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Date getData_inicio() {
        return data_inicio;
    }

    public void setData_inicio(Date data_inicio) {
        this.data_inicio = data_inicio;
    }

    public Date getData_fim() {
        return data_fim;
    }

    public void setData_fim(Date data_fim) {
        this.data_fim = data_fim;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }
}
