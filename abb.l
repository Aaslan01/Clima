%{
  #include<stdio.h>
  #include<string.h>
  char line[100];
%}
let [a-zA-Z]
digit [0-9]
del [ \t]
%%

"int"|"float"|"double"|"char"	{fprintf(yyout," DATATYPE: %s \n", yytext);}
"if"|"while"|"for"|"break"|"switch"|"case"	{fprintf(yyout,"KW: %s \n", yytext);}
"<"|"<="|">"|">="|"="|"=="|"*"|"+"|"/"|"-"|"++"|"--"|"!"|"&"|"%"	{fprintf(yyout,"OP: %s \n", yytext);}
"["|"{"|"("|")"|"}"|"]"|";"|","|"\”"|"\“"		{fprintf(yyout,"PUN: %s \n", yytext);}
{del}+ 	 {fprintf(yyout,"Delimeter \n");}
{let}({let}|{digit})* 	{fprintf(yyout,"Token ID: %s \n", yytext);}
{digit}+ 	{fprintf(yyout,"Token intLit: %s \n", yytext);}
. {fprintf(yyout,"Error \n"); 
   return 0;}
%%

int yywrap(void){return 1;}

int main()
{
    extern FILE *yyin, *yyout; 
    yyin = fopen("code.txt", "r"); 
    yyout = fopen("Output.txt", "w"); 
    yylex(); 
    return 0;
}