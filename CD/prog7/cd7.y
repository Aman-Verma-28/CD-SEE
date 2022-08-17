%{
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
%}
%token K
%token I
%token Y
%token R
%%
S: K I H B
;
H: '(' L ')'
| '(' ')'
;
L: K I ';' L
| K I
;
B: '{' E R I'}'
; 
E : Y ';' E
| Y ';'
;
%%
int yyerror(char* s){
printf("invalid input\n");
exit(0);
}
int main()
{
printf("enter the function definition\n");
yyparse();
printf("valid input\n");
}

