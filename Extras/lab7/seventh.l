/*Write a lex program to count the number of comments in a C program, and then delete the
comments.*/
%{
    #include <stdio.h>
    #include <stdlib.h>
    int commentCount = 0;
    FILE *out;
%}
%s commentText
%%
"/*" {BEGIN commentText;}
<commentText>"*/" {BEGIN 0; ++commentCount;}
<commentText>\n {}
<commentText>. {}
"//".* {++commentCount;}
.|\n {fprintf (out, "%s", yytext);}
%%
int yywrap(){
    return 1;
}
int main(){
    yyin = fopen("C_TestFileIn.c", "r");
    out = fopen("C_TestFileOut.c", "w");
    yylex();
    printf ("NUMBER OF COMMENTS = %d\n\n", commentCount);
    fclose (out);
    system ("pause");
    return 0;
}