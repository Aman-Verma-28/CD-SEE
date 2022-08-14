%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
char AddTOTable(char,char,char);
void Threecode();
void quadraple();
void TargetCode();
int ind=0;
char temp='A';
struct incode{
char opd1;
char opd2;
char opr;
};
%}
%union{
char sym;
}


  
%token <sym> LETTER NUMBER
%type <sym> expr
%left '+' '-'
%left '*' '/'

%%

STATEMENT : LETTER '=' expr ';' {AddTOTable((char)$1,(char)$3,'=');}
|expr ';'
;
expr : expr '+' expr {$$=AddTOTable((char)$1,(char)$3,'+');}
| expr '-' expr {$$=AddTOTable((char)$1,(char)$3,'-');}
| expr '*' expr {$$=AddTOTable((char)$1,(char)$3,'*');}
| expr '/' expr {$$=AddTOTable((char)$1,(char)$3,'/');}
| '(' expr ')' {$$= (char)$2;}
| NUMBER {$$= (char)$1;}
|LETTER {$$= (char)$1;}
; 

%%


int id=0;
struct incode code[20];
char AddTOTable(char opd1, char opd2, char opr)
{
code[ind].opd1=opd1;
code[ind].opd2=opd2;
code[ind].opr=opr;
ind++;
temp++;
return temp;
}

void Threecode()
{
int cnt=0;
temp++;
printf("THREADDR code\n");
while(cnt<ind)
{



printf("%c=\t",temp);
printf("%c\t",code[cnt].opd1);
printf("%c\t",code[cnt].opr);
printf("%c\t",code[cnt].opd2);
printf("\n");

cnt++;
temp++;
}
}


void TargetCode(){
temp++;
int cnt=0;
printf("\n\n\t TARGET CODE\n\n");
while(cnt<ind){
printf("LOAD %c\n", code[cnt].opd1);
printf("LOAD %c\n", code[cnt].opd2);
switch(code[cnt].opr){
case '+':
printf("ADD %c %c %c\n", temp,code[cnt].opd1,
code[cnt].opd2);
break;
case '*':
printf("MULT %c %c %c\n", temp, code[cnt].opd1,
code[cnt].opd2);
break;
case '-':
printf("SUB %c %c %c\n", temp,code[cnt].opd1,
code[cnt].opd2);
break;
case '/':
printf("DIV %c %c %c\n", temp,code[cnt].opd1,
code[cnt].opd2);
break;
case '=': printf("MOV %c %c\n", code[cnt].opd2,
code[cnt].opd1);
break;
}
temp++;
cnt++;
}
}

void quadraple()
{
int cnt=0;
temp++;
printf("quad code\n");
while(cnt<ind)
{
printf("%d\t",id);
printf("%c\t",code[cnt].opr);
printf("%c\t",code[cnt].opd1);

printf("%c\t",code[cnt].opd2);
printf("%c\t",temp);

printf("\n");
id++;
cnt++;
temp++;
}
}

int yyerror(char *s)
{
printf("invalid\n");
exit(0);
}

int main()
{
printf("enter the string\n");
yyparse();

temp='A';
Threecode();
quadraple();
TargetCode();
}
int yywrap(){
return 1;
}
