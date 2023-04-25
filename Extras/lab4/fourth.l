/*Take C program as an input and display list of identifiers and operators*/
%{
#include<stdio.h> 
#include<string.h>
int identifier=0 , operator=0;
%}

%%
[+-/=%*] {++operator;printf("operator =  %s\n",yytext);}
[a-zA-Z][a-zA-Z0-9]* {++identifier;printf("identifier = %s\n",yytext);}
.        
%%

int main(){
    extern FILE *yyin;
    yyin=fopen("demo.c", "r");
    yylex();   
    
    printf("Operator count is : %d\n" , operator);
    printf("Identifier count is : %d\n" , identifier);
    return 0;
}

int yywrap(){
    return 1;
}
