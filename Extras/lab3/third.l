/*Identify a keyword,operator, symbol*/
%{
#include<stdio.h> 
%}


%%
if|else|while|for {printf("This character is a keyword");}
[+-/*]            {printf("This character is an operator");}
[(){};]           {printf("This character is an symbol");}
.                 {printf("None of the above");}
%%


int main(){
    printf("\nEnter the character : ");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
