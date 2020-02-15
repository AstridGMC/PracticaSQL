package practica1sql.Backend;

import java.io.*;
import javax.swing.JFileChooser;

public class Archivo {

    private String nombre;
    private String path;
    private String texto;
    FileInputStream entrada;
    FileOutputStream salida;
    File archivo;

    public Archivo(String nombre, String path, String texto) {
        this.nombre = nombre;
        this.path = path;
        this.texto = texto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public FileInputStream getEntrada() {
        return entrada;
    }

    public void setEntrada(FileInputStream entrada) {
        this.entrada = entrada;
    }

    public FileOutputStream getSalida() {
        return salida;
    }

    public void setSalida(FileOutputStream salida) {
        this.salida = salida;
    }

    public File getArchivo() {
        return archivo;
    }

    public void setArchivo(File archivo) {
        this.archivo = archivo;
    }

    public Archivo() {
    }

    public boolean GenerarNuevoArchivo() {
        try {

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public String AbrirTXT(File archivo) {
        String contenido = "";
        try {
            entrada = new FileInputStream(archivo);
            int ascci;
            while ((ascci = entrada.read()) != -1) {
                char caracter = (char) ascci;
                contenido += caracter;
            }

        } catch (Exception e) {
        }
        return contenido;
    }

    public String GuardarTexto(File archivo, String contenido) {
        String respuesta = null;
        try {
            salida = new FileOutputStream(archivo);
            byte[] byteTxt = contenido.getBytes();
            salida.write(byteTxt);
            respuesta = "guardado";
        } catch (Exception e) {
        }
        return respuesta;
    }

    public String obtenerRuta(JFileChooser archivo) {
        int seleccion = archivo.showOpenDialog(null);
        if (seleccion == JFileChooser.APPROVE_OPTION) {
            return archivo.getSelectedFile().getAbsolutePath();

        } else {
            return null;
        }
    }
    
    public boolean crearCarpeta(){
        archivo = new File(path);
        return archivo.mkdir();
    }

}
