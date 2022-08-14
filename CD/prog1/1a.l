%{
  #include<stdio.h>
  int nwords=0,nchars=0,lines=0,nwhite=0;
%}
%%
[a-zA-Z0-9]+ {nwords++;nchars=nchars+yyleng;}
[ ] {nwhite++;}
\n lines++;
. nchars++;
%%
int yywrap()
{
  return 1;
}

int main(int c,char*argv[])
{
 printf("enter the string:\n");
 yylex();
 printf("words chars whitespaces lines\n%d %d %d %d",nwords,nchars,nwhite,lines);
 return 0;
}

