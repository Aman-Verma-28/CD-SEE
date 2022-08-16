%{
#include "y.tab.h"
#include<stdio.h>
%}
%%
"int"|"char"|"float" return I;
"return" return R;
[(] return '(';
[)] return ')';
[{] return '{';
[}] return '}';
[;] return ';';
[a-zA-Z0-9_]+ return N;
[a-zA-Z0-9=+-/*><;]+ return E;
%%
