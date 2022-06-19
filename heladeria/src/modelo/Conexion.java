/*
        Conexion a Base de Datos MySQL  
 */
package modelo;

import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Armando Rojas 
 */
public class Conexion {
    
    private String url, usuario, clave; 
    java.sql.Statement st;  
    
    /* 
        Constructor
        requiere del host y la bd
        el usuario de la bd 
        y la clave bd 
    */
    public Conexion(String url, String usuario, String clave){
        
       this.url = url;
       this.usuario = usuario;
       this.clave = clave; 
        
    }
    
    //crear la conexion 
    public boolean conectar() {
        
       boolean exito = true; 
       
       // cargamos el driver
       try { 
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            exito = false;
            JOptionPane.showMessageDialog(null,"Error al Cargar la Clase = "+ex.getMessage());
        }
       
       // establecemos la conexion y la declaracion (statement)
        try {
            st = java.sql.DriverManager.getConnection(url, usuario, clave).createStatement();
        } catch (SQLException ex) {
            exito = false;
            JOptionPane.showMessageDialog(null,"Error al Establecer la Conexion = "+ex.getMessage());
        }
      
  
      return exito;
    }
    
    // para ejecutar consultas sql
    Object query( String sql) throws SQLException{
        
        Object resultado = null;
        
        if( sql.charAt(0) == 'S')
            resultado = st.executeQuery(sql);
       else
        
            st.executeUpdate(sql);
        
        
        return resultado;
    }
    
    // cerrar la conexion 
    public void cerrar(){
    
        try {
            st.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null,"Error al Cerrar la Conexion = "+ex.getMessage());
        }
        
    }

}// fin de la clase

