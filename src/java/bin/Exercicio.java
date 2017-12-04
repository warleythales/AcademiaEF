package bin;

public class Exercicio {

    private int id;
    private Double peso;
    private int repetcoes;
    private int serie;
    private Treino treino;
    private Aparelho aparelho;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Double getPeso() {
        return peso;
    }

    public void setPeso(Double peso) {
        this.peso = peso;
    }

    public int getRepetcoes() {
        return repetcoes;
    }

    public void setRepetcoes(int repetcoes) {
        this.repetcoes = repetcoes;
    }

    public int getSerie() {
        return serie;
    }

    public void setSerie(int serie) {
        this.serie = serie;
    }

    public Treino getTreino() {
        return treino;
    }

    public void setTreino(Treino treino) {
        this.treino = treino;
    }

    public Aparelho getAparelho() {
        return aparelho;
    }

    public void setAparelho(Aparelho aparelho) {
        this.aparelho = aparelho;
    }

}
