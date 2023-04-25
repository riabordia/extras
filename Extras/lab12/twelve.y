%{
#include <stdio.h>
#include <stdlib.h>
%}
%token A B NL
%%
start: A string NL {printf ("<VALID STRING>\n"); exit (0);} ;
string: Astring Bstring ;
Astring : A Astring | ;
Bstring : B Bstring | ;
%%
int yyerror (char *msg) {
printf ("<INVALID STRING>\n");
exit (0);
}
int main () {
printf ("ENTER A STRING: ");
yyparse ();
}