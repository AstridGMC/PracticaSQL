/*--------------1 Codigo Usr ---------------*/

package practica1sql.Backend.cupAndFlex;
import java_cup.runtime.* ;

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

Numero = [0-9]
Letra = [A-Z a-z]
Signo = [_@*#-+]

%%


<YYINITIAL> {
    "PROYECTO"                               {return symbol(sym.PROYECTO);}
    "CARPETA"                               {return symbol(sym.CARPETA);}
    "ARCHIVO"                               {return symbol(sym.ARCHIVO);}
    "SELECCIONAR"                           {return symbol(sym.SELECCIONAR);}
    "EN"                                    {return symbol(sym.EN);}
    "FILTRAR"                               {return symbol(sym.FILTRAR);}
    "INSERTAR"                              {return symbol(sym.INSERTAR);}
    "VALORES"                               {return symbol(sym.VALORES);}
    "ACTUALIZAR"                            {return symbol(sym.ACTUALIZAR);}
    "ELIMINAR"                              {return symbol(sym.ELIMINAR);}
    "."                                     {return symbol(sym.PUNTO);}
    ","                                     {return symbol(sym.COMA);}
    "<="                                    {return symbol(sym.MENORIGUAL);}
    ">="                                    {return symbol(sym.MAYORIGUAL);}
    "="                                     {return symbol(sym.IGUAL);}
    "["                                     {return symbol(sym.CORCHETEABRE);}
    "'"                                     {return symbol(sym.COMILLAS):}
    "]"                                     {return symbol(sym.CORCHETECIERRA);}
    "/"                                     {return symbol(sym.DIAGONAL);}
    ">"                                     {return symbol(sym.MAYORQ);}
    "<"                                     {return symbol(sym.MENORQ);}
    ";"                                     {return symbol(sym.FIN);}
    ({Letra}|{Signo}|{Numero})+    {return symbol(sym.TEXTO,new String(yytext()), yyline, yycolumn);}
    (({Letra}|{Signo}|{Numero})+"/")(({Letra}|{Signo}|{Numero})+|"/")*  {return symbol(sym.PATH,new String(yytext()), yyline, yycolumn);}
    (< CARPETA nombre =) {return symbol(sym.INICIOCAR,new String(yytext()), yyline, yycolumn);}
    (< PROYECTO nombre =) {return symbol(sym.INICIOPROY,new String(yytext()), yyline, yycolumn);} 
    
.                                       {return symbol(Sistem.out.println("error"));}        
}










