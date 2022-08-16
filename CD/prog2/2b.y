%{
#include<stdio.h>
#include<stdlib.h>
%}
%token NUM

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%
ArithExpr : E{ printf("Result is %d",$$); return 0;}

E: E'+'E {$$=$1+$3;}
  |E'-'E {$$=$1-$3;}
  |E'*'E {$$=$1*$3;}
  |E'/'E {$$=$1/$3;}
  |E'%'E {$$=$1%$3;}
  |'('E')'{$$=$2;}
  |NUM
 ;
%%
int main()
{
 printf("Enter the expression\n");
 yyparse();
 printf("Vaid");
}

int yyerror()
{
 printf("Invalid\n");
 exit(0);
}
	  
	  
