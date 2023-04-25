/*Identify if relational operator*/
%{
#include<stdio.h> 
int count = 0;
%}

/*** Rule Section***/
%%
"<"|"<="|">"|">="|"=="|"!=" {printf("It is a Relational operator");}
.* {printf("Wrong");}
%%

int main(){
printf("\nEnter RE : ");
yylex();
return 0;
}

int yywrap(){
     return 1;
}
