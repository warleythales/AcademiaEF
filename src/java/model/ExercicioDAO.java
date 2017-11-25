package model;

import bin.Exercicio;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ExercicioDAO {

    public boolean inserir(Exercicio ex) {
        try {
            String sql = "INSERT INTO exercicio (id_treino, id_aparelho, peso, repeticoes, serie)"
                    + "VALUES (?,?,?,?,?)";
            Connection con = Conexao.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, ex.getId_treino());
            ps.setInt(2, ex.getId_aparelho());
            ps.setDouble(3, ex.getPeso());
            ps.setInt(4, ex.getRepeticoes());
            ps.setInt(5, ex.getRepeticoes());

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
}
