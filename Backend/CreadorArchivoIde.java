package practica1sql.Backend;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class CreadorArchivoIde {
    Document doc;
     Element root = new Element("PROYECTO"); 

    public CreadorArchivoIde() {
    }
     
     
     
    public boolean creador(String dir, String nombre) {
        try {
            doc = new Document(); //Creamos el documento que guardara toda la información.
           
            doc.setRootElement(root); //Añadimos nuestro elemento root al documento
            root.setAttribute(new Attribute ("NOMBRE", nombre));
             for (int i = 1; i <= 2; i++){
                Element persona = new Element("persona");
                persona.setAttribute(new Attribute("tipo", "Perona " + i));
                persona.addContent(new Element("name").setText("Daniel " + i));
                persona.addContent(new Element("ap").setText("Marin " + i));
                root.addContent(persona);
            }  
            
            XMLOutputter xmlOut = new XMLOutputter(Format.getPrettyFormat());
            FileWriter fw = new FileWriter(new File(dir, nombre+".ide"));
            xmlOut.output(doc, fw);
            fw.close();
            return true;
        } catch (IOException ex) {
            System.err.println("Error crearXML\n" + ex.getMessage());
            return false;
        }
    }
}
