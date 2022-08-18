%{
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
int res=0;
%}
%token NUM IF ELSE EXP SPACE

%%
S: F {printf("the resukt is %d\n",res);}
;
F: IF H B EL {res++;}
;
EL: ELSE B
|
;
H:'('E')'
;
E: EXP Z EXP
|EXP Z NUM
|EXP U
|SPACE
;
Z: '='|'<'|'>'|'>''='|'<''='
;
U: '+''+'|'-''-'
;
B: '{' B '}'
| F
| E ';' B
| E ';' SPACE F
|
;
%%
int yyerror()
{
printf("invalid\n");
exit(0);
}

int main()
{
printf("enter the input\n");
yyparse();
printf("valid\n");

}

int yywrap()
{
return 1;

}

