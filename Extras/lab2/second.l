/*CHECK IF A CHARACTER IS ALPHABET OR NOT*/
%{
#include<stdio.h> 
int count = 0;
%}

/*** Rule Section***/
%%
[a-zA-Z]+ {printf("This character is an alphabet");}
.* {printf("This character is not an alphabet");}
%%

int main(){
printf("\nEnter the character : ");
yylex();
return 0;
}

int yywrap(){
    return 1;
}
