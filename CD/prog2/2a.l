%{
	#include<stdio.h>
	int pos=0;
	int neg=0;
	int posf=0;
	int negf=0;
%}
DIGIT [0-9]
%%
([+])?([0-9])+ pos++;
([-])([1-9])([0-9])* neg++;
([+])?([0-9])+[/]([+])?([1-9])+ posf++;
([-])([1-9])([0-9])*[/]([-])([1-9])([0-9])* posf++;
([+])?([0-9])+[/]([-])([1-9])([0-9])* negf++;
([-])([1-9])([0-9])*[/]([+])?([1-9])+ negf++;
\+?{DIGIT}*\.{DIGIT}+ posf++;
-{DIGIT}*\.{DIGIT}+	 negf++;
%%
int main()
{
	yylex();
	printf("\nNo. of positive numbers: %d", pos);
	printf("\nNo. of Negative numbers: %d", neg);
	printf("\nNo. of Positive numbers in fractions: %d", posf);
	printf("\nNo. of Negative numbers in fractions: %d\n", negf);
	return 0;
}