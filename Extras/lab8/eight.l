/*Write a lex program to count the number of keywords, operators, identifiers, comments
and then delete the comments.*/
%{
#include <stdio.h>
#include <stdlib.h>
int commentCount = 0,keywords=0,operator=0,identifier=0;
FILE *out;
%}
%s commentText
%%
"/*" {BEGIN commentText;}
<commentText>"*/" {BEGIN 0; ++commentCount;}
<commentText>\n {}
<commentText>. {}
"//".* {++commentCount;}
if|else|for|while|do|switch|int|char|float {++keywords;fprintf(out,"%s",yytext);}
"+"|"‐"|"*"|"/"|"%" { ++operator;fprintf(out,"%s",yytext);}
[a-zA-Z][a-zA-Z0-9_]* { ++identifier;fprintf(out,"%s",yytext);}
.|\n {fprintf (out, "%s", yytext);}

%%
int yywrap(){
return 1;
}
int main(){
yyin = fopen("testInput.c", "r");
out = fopen("testOutput.c", "w");
yylex();
printf ("NUMBER OF COMMENTS = %d\n", commentCount);
printf ("Number of keywords = %d\n",keywords);
printf ("Number of identifier = %d\n",identifier);
printf ("Number of operators = %d\n\n",operator);
fclose (out);
system ("pause");
return 0;
}