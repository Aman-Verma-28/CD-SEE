%{
#include<stdio.h>
int single=0, multi=0;
%}
start \/\*
end \*\/

%%

\/\/.* {single++; fprintf(yyout, "");}
{start}(.*[\n]*)*{end} {multi++; fprintf(yyout, "");}

%%
int yywrap(){
return 1;
}
int main(int argc, char* argv[]){
yyin = fopen(argv[1], "r");
yylex();
printf("single comment: %d\nmulti comment: %d\n", single, multi);
}