/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manejoDatos;

public class Usuarios {
    private String user;
    private String pass;

    public Usuarios(String nombre, String pass) {
        this.user = nombre;
        this.pass = pass;
        
    }
    
    public Usuarios() {   
    }

    public String getNombre() {
        return user;
    }

    public void setNombre(String nombre) {
        this.user = nombre;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    
    
}

