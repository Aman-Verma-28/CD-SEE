%{
#include<stdio.h>
int key=0,idf=0,op=0;
%}

id [a-zA-Z_]
%%

"while"|"if"|"for"|"else"|"int"|"float" {key++;}

"<="|"=="|"="|"++"|"-"|"*"|"+"|"<"|">" {op++;}

[0-9]+{id}* ;

{id}[a-zA-Z_0-9]* {idf++;}
. ;

%%

int yywrap()
{
 return 1;
}
int main(int c, char* argv[])
{
  printf("Enter string: \n");  
  yylex();
  printf("%d %d %d",key,op,idf);

}
