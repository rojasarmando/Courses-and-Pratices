
package modelo;

import java.sql.SQLException;

public class Helado {
    
    Conexion db;

    public Helado(){
       
        String url = "jdbc:mysql://localhost:3306/heladeria",
                usuario = "root",
                pass = "12345678";
                
        db = new Conexion(url, usuario, pass);
    }
    
    public java.sql.ResultSet getHelados( ){
    
     java.sql.ResultSet rs = null;
     
       if(db.conectar()){
           try {
               
               String sql="SELECT * FROM helados"; 
               
                return (java.sql.ResultSet) db.query( sql );
                
   
           } catch (SQLException ex) {}
          db.cerrar();
       }
       return rs;

    }
    
   public boolean insertar(String nombre){
       
       boolean exito = false;
       if(db.conectar()){
           try {
               
               String sql="INSERT INTO helados (descripcion) VALUES ( '"+nombre+"')"; 
               
               db.query(sql);
               exito = true;
               
           } catch (SQLException ex) {exito = false;}
          db.cerrar();
       }
       return exito;
    }
    
 
   
}
