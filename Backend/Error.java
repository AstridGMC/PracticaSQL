
package practica1sql.Backend;


public class Error {
    private String Lexema;
    private int columna;
    private int fila;
    private String tipo;

    public Error(String Lexema,int fila,int columna, String mensaje) {
        this.Lexema = Lexema;
        this.columna = columna;
        this.fila = fila;
        this.tipo = mensaje;
    }

    public String getLexema() {
        return Lexema;
    }

    public void setLexema(String Lexema) {
        this.Lexema = Lexema;
    }

    public int getColumna() {
        return columna;
    }

    public void setColumna(int columna) {
        this.columna = columna;
    }

    public int getFila() {
        return fila;
    }

    public void setFila(int fila) {
        this.fila = fila;
    }

    public String getTipo() {
        return tipo;
    }

    public void sertTipo(String mensaje) {
        this.tipo = mensaje;
    }
    
    
    
}
