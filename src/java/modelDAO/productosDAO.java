/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelDAO;

import model.Productos;
import config.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Judith
 */
public class productosDAO {
    Connection conectar;
    conexion con = new conexion();
    PreparedStatement ps = null;
    ResultSet rs;
    
    public List MostrarProductos() throws SQLException{
        ArrayList <Productos> listado = new ArrayList <>();
            String consulta = "SELECT * FROM productos ORDER BY nombre_producto ASC";
        try{
            conectar = conexion.getConnection();
            ps = conectar.prepareStatement(consulta);
            rs = ps.executeQuery();
            while(rs.next()){
                Productos pro = new Productos();
                pro.setIdProducto(rs.getInt("id_productos"));
                pro.setNombreProducto(rs.getString("nombre_producto"));
                pro.setImagen(rs.getString("imagen"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setMarca(rs.getString("marca"));
                pro.setPrecio(rs.getFloat("precio"));
                pro.setVencimiento(rs.getString("vencimiento"));
                listado.add(pro);
            }
        }
        catch(Exception e){
            System.out.println("Error: " + e);
            
        }
        return listado;
    }
    
}
