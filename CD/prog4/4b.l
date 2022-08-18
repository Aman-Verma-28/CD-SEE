%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
"if" {return IF;}
"else" {return ELSE;}
[0-9]+ {return NUM;}
[a-zA-Z]+ {return EXP;}
[ ] {return SPACE;}
[+] {return '+';}
[-] {return '-';}
[<] {return '<';}
[>] {return '>';}
[=] {return '=';}
[;] {return ';';}
[(] {return '(';}
[)] {return ')';}
[{] {return '{';}
[}] {return '}';}

%%
