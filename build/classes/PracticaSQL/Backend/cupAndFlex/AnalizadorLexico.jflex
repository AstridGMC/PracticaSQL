/*--------------1 Codigo Usr ---------------*/


package PracticaSQL.Backend.cupAndFlex;
import java_cup.runtime.* ;
import java_cup.runtime.Symbol;
import PracticaSQL.Backend.CUP.sym;
/*--------------2 Declaraxiones ------------*/

%%



%public 
%class AnalizadorLexico 
%cupdebug
%column
%line 
%cup 
%char
%full
%unicode
%public


D=[0-9]+
DD=[0-9]+("."[  |0-9]+)?
Letra = [a-z]
LetraT = [A-Z a-z]
Signo = [_@*#+-]
Comilla = [\"]


%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline+1, yycolumn+1);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline+1, yycolumn+1, value);
    }

    private Symbol symbol(int type, Object value, int fila, int columna) {
        return new Symbol(type, yyline+1, yycolumn+1, value);
    }

%}

%%


<YYINITIAL> {
    "ARCHIVO"                               {return symbol(sym.ARCHIVO);}
    "SELECCIONAR"                           {System.out.println("SECT"); return symbol(sym.SELECCIONAR);}
    "EN"                                    {System.out.println("EN"); return symbol(sym.EN);}
    "FILTRAR"                               {return symbol(sym.FILTRAR);}
    "INSERTAR"                              {return symbol(sym.INSERTAR);}
    "VALORES"                               {System.out.println("valores");return symbol(sym.VALORES);}
    "ACTUALIZAR"                            {return symbol(sym.ACTUALIZAR);}
    "ELIMINAR"                              {return symbol(sym.ELIMINAR);}
    "nombre"                                {return symbol(sym.NOMBRE);}
    "ubicacion"                             {return symbol(sym.UBICACION);}
    "."                                     {return symbol(sym.PUNTO);}
    ","                                     {return symbol(sym.COMA);}
    "<="                                    {return symbol(sym.MENORIGUAL);}
    ">="                                    {return symbol(sym.MAYORIGUAL);}
    "="                                     {return symbol(sym.IGUAL);}
    "["                                     {return symbol(sym.CORCHETEABRE);}
    "("                                     {System.out.println("pab.."); return symbol(sym.PARENTESISABRE);}
    [\"]                                    {System.out.println("COMILLAS.."); return symbol(sym.COMILLAS);}
    ")"                                     {System.out.println("pcie.."); return symbol(sym.PARENTESISCIERRA);}
    "]"                                     {return symbol(sym.CORCHETECIERRA);}
    "/"                                     {return symbol(sym.DIAGONAL);}
    ">"                                     {return symbol(sym.MAYORQ);}
    "<"                                     {return symbol(sym.MENORQ);}
    ";"                                     {return symbol(sym.FIN);}
    [/t|/r|/n|/f]+                          {return symbol(sym.ESPACIO);}
    {D} {return new Symbol(sym.ENTERO,yyline,yychar, yytext());} 
    {DD} {return new Symbol(sym.DECIMAL,yyline,yychar, yytext());}
({Comilla}({LetraT}|{Signo}|{D})+{Comilla}) {System.out.println("string"); return symbol(sym.STRING,new String(yytext()), yyline, yycolumn);}
    ({Letra}|{Signo}|{D})+    { System.out.println("texto");  return symbol(sym.TEXTO,new String(yytext()), yyline, yycolumn);}
    ("/"({LetraT}|{Signo}|{D})+"/")+(({Letra}|{Signo}|{D})+".csv")*  {System.out.println("string"); return symbol(sym.PATH,new String(yytext()), yyline, yycolumn);}
    
    "</PROYECTO>"  {return symbol(sym.FINPROYECTO,yytext(), yyline, yycolumn);}
    "</CARPETA>"   {return symbol(sym.FINCARPETA,yytext(), yyline, yycolumn);}
    "<CARPETA nombre =" {return symbol(sym.INICIOCAR, yytext(), yyline, yycolumn);}
    "<PROYECTO nombre=" { System.out.println("texto"); return symbol(sym.INICIOPROY,yytext(), yyline, yycolumn);} 
    "<ARCHIVO nombre=" { System.out.println("ARCHINICIO"); return symbol(sym.INICIOARCH, yytext(), yyline, yycolumn);} 
    
    
    .              { System.out.println("Este es un error lexico: "+yytext()+
                    ", en la linea: "+yyline+", en la columna: "+yychar);
                }     
}










