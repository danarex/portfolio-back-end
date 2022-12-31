
package com.portfolio.dana.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;



@Entity
public class Persona {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public Persona(Long id, String nombre, String apellido, String img) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.img = img;
    }

    public Persona() {
    }

   
    
    @NotNull
    @Size(min=1, max=50, message="No cumple con la longitud")
    private String nombre;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
    @NotNull
    @Size(min=1, max=50, message="No cumple con la longitud")
    private String apellido;
   
    @Size(min=1, max=50, message="No cumple con la longitud")
    private String img;
}
