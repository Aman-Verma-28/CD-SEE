%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
"int"|"double"|"float" return K;
"return" return R;
[_a-zA-Z][_a-zA-Z0-9]* return I;
[{] return '{';
[}] return '}';
[(] return '(';
[)] return ')';
[;] return ';';
[_a-zA-Z0-9=+-/*><]+ return Y;
%%
