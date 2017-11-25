package bin;

public class Exercicio {

    private int id_treino;
    private int id_aparelho;
    private Double peso;
    private int repeticoes;
    private int serie;
    private Treino treino;
    private Aparelho aparelho;

    public Double getPeso() {
        return peso;
    }

    public void setPeso(Double peso) {
        this.peso = peso;
    }

    public int getRepeticoes() {
        return repeticoes;
    }

    public void setRepeticoes(int repeticoes) {
        this.repeticoes = repeticoes;
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

    public int getId_treino() {
        return id_treino;
    }

    public int getId_aparelho() {
        return id_aparelho;
    }
}
