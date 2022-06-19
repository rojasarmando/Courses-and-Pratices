package modelo;

import java.sql.SQLException;

public class Persona {
   
    Conexion db;
    String cedula, nombre, apellido;
    int helado;
    char sexo, musica, politica, religion, arte;
    
    public Persona(){
    
         String url = "jdbc:mysql://localhost:3306/heladeria",
                usuario = "root",
                pass = "12345678";
                
        db = new Conexion(url, usuario, pass);
    }
    
    public void setCedula(String c ){
        cedula = c;  
    }
     public void setNombre(String c ){
        nombre = c;  
    }
    public void setApellido(String c ){
        apellido = c;  
    }
    public void setSexo(char c ){
        sexo = c;  
    }
    public void setMusica(char c ){
        musica = c;  
    }
    public void setPolitica(char c ){
        politica = c;  
    }
    public void setReligion(char c ){
        religion = c;  
    }
    public void setArte(char c ){
        arte = c;  
    }
    public void setHelado(int c ){
        helado = c;  
    }
  
    
    public String getNombre(){
        return nombre;
    }
    public String getCedula(){
        return cedula;
    }
    public String getApellido(){
        return apellido;
    }
    public char getSexo(){
        return sexo;
    }
     public char getMusica(){
        return arte;
    }
    public char getArte(){
        return sexo;
    }
    public char getReligion(){
        return religion;
    }
    public char getPolitica(){
        return politica;
    }
    public int getHelado(){
        return helado;
    }
       
  public boolean insertar(){
       
       boolean exito = false;
       if(db.conectar()){
           try {
              
               
               String sql="INSERT INTO persona VALUES ( "+cedula+", "
                       + "'"+nombre+"' , '"+apellido+"' , '"
                       +sexo+"', '"+musica+"', '"+religion+"', '"
                       +politica+"' , '"+arte+"' , "+helado+" )"; 
             
               
               db.query(sql);
               exito = true;
               
           } catch (SQLException ex) {exito = false;}
          db.cerrar();
       }
       return exito;
    }
   
    public boolean buscar( String ci ){
       
       boolean exito = false;
       if(db.conectar()){
           try {
               
               String sql="SELECT * FROM persona WHERE cedula ="+ ci.trim(); 
               
               java.sql.ResultSet rs = (java.sql.ResultSet) db.query(sql);
          
               
                   if(rs.next()){
                     nombre = rs.getString("nombre");
                     apellido = rs.getString("apellido");
                     cedula = rs.getString("cedula");
                     
                     musica = rs.getString("musica").charAt(0);
                     arte = rs.getString("arte").charAt(0);
                     politica = rs.getString("politica").charAt(0);
                     religion = rs.getString("religion").charAt(0); 
                     sexo = rs.getString("sexo").charAt(0);
                     helado = rs.getInt("id");
                    
                     exito = true;
                   
                   }

           } catch (SQLException ex) {}
          db.cerrar();
       }
       return exito;
    }
    
 
    public  boolean modificar(){
       
       boolean exito = false;
       if(db.conectar()){
           try {
               
               String sql="UPDATE persona SET nombre='"+nombre+
                       "', apellido='"+apellido+"' , sexo='"+sexo+"' , musica='"+musica+
                       "', religion='"+religion+"', politica='"+politica+
                       "', arte='"+arte+"', id="+helado+
                       "  WHERE cedula="+cedula; 
               
               db.query(sql);
               exito = true;
               
           } catch (SQLException ex) {exito = false;}
          db.cerrar();
       }
       return exito;
    }
      
    public boolean elimanar(){
       
       boolean exito = false;
       if(db.conectar()){
           try {
               
               String sql="DELETE FROM persona WHERE cedula="+cedula; 
               
               db.query(sql);
               exito = true;
               
           } catch (SQLException ex) {exito = false;}
          db.cerrar();
       }
       return exito;
    }

}
