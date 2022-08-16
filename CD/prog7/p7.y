%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
%}
%token I
%token N
%token R
%token E
%%
S:F
;
F:W H B
;
H:'(' X ')'
;
X:W
|W';'X
;
W:I N
;
B: '{' E R N '}'
;
%%
int yyerror(char *s)
{
printf("%s");
printf("invalid error\n");
exit(0);
}
int main(){
printf("enter the code\n");
yyparse();
printf("valid input\n");
}
int yywrap(){
return 1;
} 