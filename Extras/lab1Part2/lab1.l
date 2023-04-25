/*IDENTIFY A WORD, NUMBER, RELOP*/
%{
#include <stdio.h>
%}

%%
	
">"|"<"|"<="|">="|"=="|"!=" {printf("Relational Operator");}

[A-Za-z]* {printf("Word");}

[0-9]+ {printf("Number");}

%%

main()
{
    printf("Enter term:");
	yylex();
}

int yywrap(){
    return 1;
}