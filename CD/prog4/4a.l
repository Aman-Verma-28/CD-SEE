%{
#include<stdio.h>
int k=0,v=0,d=0,o=0;
%}

%%
"while"|"if"|"else"|"int"|"float"|"short"|"long"|"switch"|"return"|"void" k++;
"<="|"=="|"="|"++"|"-"|"*"|"+"|"%" o++;
[a-zA-Z_][a-zA-Z0-9_]* v++;
[0-9] d++;
. ;
%%

int main()
{
	printf("Enter the string: ");                         
	yylex();
	/*
	yyin=fopen("7th.c","r");                            
	yyout=fopen("new.c","w");  
	*/
	printf("Number of keywords= %d\n operators= %d\n variables= %d\n digits= %d\n", k,o,v,d);

return 0;

}
