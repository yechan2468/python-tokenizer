%{
    #include <math.h>
%}

IDENTIFIER              [a-zA-Z_][a-zA-Z0-9_]*

DIGIT                           [0-9]
BINARY_DIGIT                    [0-1]
OCTAL_DIGIT                     [0-7]
HEXADECIMAL_DIGIT               [0-9a-fA-F]
DIGIT_UNDERSCORED               [0-9]+_[0-9]+
BINARY_DIGIT_UNDERSCORED        [0-1]+_[0-1]+
OCTAL_DIGIT_UNDERSCORED         [0-7]+_[0-7]+
HEXADECIMAL_DIGIT_UNDERSCORED   [0-9a-fA-F]+_[0-9a-fA-F]+
BINARY_INT_PREFIX               0b|0B
OCTAL_INT_PREFIX                0o|0O
HEXADECIMAL_INT_PREFIX          0x|0X

INDENT_SPACE            ([ ]{4})+
INDENT_TAB              (\t)+
LINEBREAK               (\r|\n)+
SPACE                   [ ]+


%%

#.*{LINEBREAK}                  { ; }

\"\"\"(.|\r|\n)*\"\"\"          { printf("STRING_LITERAL\t%s\n", yytext); }
\"[^\".]+\"|\'[^\'.]+\'         { printf("STRING_LITERAL\t%s\n", yytext); }

and                     { printf("KEYWORD\t\t\t%s\n", yytext); }
as                      { printf("KEYWORD\t\t\t%s\n", yytext); }
assert                  { printf("KEYWORD\t\t\t%s\n", yytext); }
async                   { printf("KEYWORD\t\t\t%s\n", yytext); }
await                   { printf("KEYWORD\t\t\t%s\n", yytext); }
break                   { printf("KEYWORD\t\t\t%s\n", yytext); }
class                   { printf("KEYWORD\t\t\t%s\n", yytext); }
continue                { printf("KEYWORD\t\t\t%s\n", yytext); }
def                     { printf("KEYWORD\t\t\t%s\n", yytext); }
del                     { printf("KEYWORD\t\t\t%s\n", yytext); }
elif                    { printf("KEYWORD\t\t\t%s\n", yytext); }
else                    { printf("KEYWORD\t\t\t%s\n", yytext); }
except                  { printf("KEYWORD\t\t\t%s\n", yytext); }
False                   { printf("KEYWORD\t\t\t%s\n", yytext); }
finally                 { printf("KEYWORD\t\t\t%s\n", yytext); }
for                     { printf("KEYWORD\t\t\t%s\n", yytext); }
from                    { printf("KEYWORD\t\t\t%s\n", yytext); }
global                  { printf("KEYWORD\t\t\t%s\n", yytext); }
if                      { printf("KEYWORD\t\t\t%s\n", yytext); }
import                  { printf("KEYWORD\t\t\t%s\n", yytext); }
in                      { printf("KEYWORD\t\t\t%s\n", yytext); }
is                      { printf("KEYWORD\t\t\t%s\n", yytext); }
lambda                  { printf("KEYWORD\t\t\t%s\n", yytext); }
None                    { printf("KEYWORD\t\t\t%s\n", yytext); }
nonlocal                { printf("KEYWORD\t\t\t%s\n", yytext); }
not                     { printf("KEYWORD\t\t\t%s\n", yytext); }
or                      { printf("KEYWORD\t\t\t%s\n", yytext); }
pass                    { printf("KEYWORD\t\t\t%s\n", yytext); }
raise                   { printf("KEYWORD\t\t\t%s\n", yytext); }
return                  { printf("KEYWORD\t\t\t%s\n", yytext); }
True                    { printf("KEYWORD\t\t\t%s\n", yytext); }
try                     { printf("KEYWORD\t\t\t%s\n", yytext); }
while                   { printf("KEYWORD\t\t\t%s\n", yytext); }
with                    { printf("KEYWORD\t\t\t%s\n", yytext); }
yield                   { printf("KEYWORD\t\t\t%s\n", yytext); }

({DIGIT_UNDERSCORED}|{DIGIT}+)\.({DIGIT_UNDERSCORED}?|{DIGIT}*)|\.{DIGIT_UNDERSCORED}+    { printf("FLOAT_LITERAL\t\t%s\n", yytext); }
{DIGIT}+\.{DIGIT}*|\.{DIGIT}+                           { printf("FLOAT_LITERAL\t\t%s\n", yytext); }

{HEXADECIMAL_INT_PREFIX}{HEXADECIMAL_DIGIT_UNDERSCORED} { printf("HEXADECIMAL_INT_LITERAL\t%s\n", yytext); }
{OCTAL_INT_PREFIX}{OCTAL_DIGIT_UNDERSCORED}             { printf("OCTAL_INT_LITERAL\t%s\n", yytext); }
{BINARY_INT_PREFIX}{BINARY_DIGIT_UNDERSCORED}           { printf("BINARY_INT_LITERAL\t%s\n", yytext); }
{DIGIT_UNDERSCORED}                                     { printf("DECIMAL_INT_LITERAL\t%s\n", yytext); }
{HEXADECIMAL_INT_PREFIX}{HEXADECIMAL_DIGIT}+            { printf("HEXADECIMAL_INT_LITERAL\t%s\n", yytext); }
{OCTAL_INT_PREFIX}{OCTAL_DIGIT}+                        { printf("OCTAL_INT_LITERAL\t%s\n", yytext); }
{BINARY_INT_PREFIX}{BINARY_DIGIT}+                      { printf("BINARY_INT_LITERAL\t%s\n", yytext); }
{DIGIT}+                                                { printf("DECIMAL_INT_LITERAL\t%d\n", atoi(yytext)); }

\/\/\=                  { printf("OPERATOR\t\t%s\n", yytext); }
\*\*\=                  { printf("OPERATOR\t\t%s\n", yytext); }

\*\*                    { printf("OPERATOR\t\t%s\n", yytext); }
\/\/                    { printf("OPERATOR\t\t%s\n", yytext); }
\+\=                    { printf("OPERATOR\t\t%s\n", yytext); }
\-\=                    { printf("OPERATOR\t\t%s\n", yytext); }
\*\=                    { printf("OPERATOR\t\t%s\n", yytext); }
\/\=                    { printf("OPERATOR\t\t%s\n", yytext); }
\%\=                    { printf("OPERATOR\t\t%s\n", yytext); }
\&\=                    { printf("OPERATOR\t\t%s\n", yytext); }
\^\=                    { printf("OPERATOR\t\t%s\n", yytext); }
\>\>\=                  { printf("OPERATOR\t\t%s\n", yytext); }
\<\<\=                  { printf("OPERATOR\t\t%s\n", yytext); }
\:\=                    { printf("OPERATOR\t\t%s\n", yytext); }
\=\=                    { printf("OPERATOR\t\t%s\n", yytext); }
\!\=                    { printf("OPERATOR\t\t%s\n", yytext); }
\>\=                    { printf("OPERATOR\t\t%s\n", yytext); }
\<\=                    { printf("OPERATOR\t\t%s\n", yytext); }

\<\<                    { printf("OPERATOR\t\t%s\n", yytext); }
\>\>                    { printf("OPERATOR\t\t%s\n", yytext); }
\>                      { printf("OPERATOR\t\t%s\n", yytext); }
\<                      { printf("OPERATOR\t\t%s\n", yytext); }

\&                      { printf("OPERATOR\t\t%s\n", yytext); }
\^                      { printf("OPERATOR\t\t%s\n", yytext); }
\~                      { printf("OPERATOR\t\t%s\n", yytext); }

\=                      { printf("OPERATOR\t\t%s\n", yytext); }
\+                      { printf("OPERATOR\t\t%s\n", yytext); }
\-                      { printf("OPERATOR\t\t%s\n", yytext); }
\*                      { printf("OPERATOR\t\t%s\n", yytext); }
\/                      { printf("OPERATOR\t\t%s\n", yytext); }
\%                      { printf("OPERATOR\t\t%s\n", yytext); }

\(                      { printf("LEFT_PARENTHESIS\t%s\n", yytext); }
\)                      { printf("RIGHT_PARENTHESIS\t%s\n", yytext); }
\{                      { printf("LEFT_BRACE\t\t%s\n", yytext); }
\}                      { printf("RIGHT_BRACE\t\t%s\n", yytext); }
\[                      { printf("LEFT_BRACKET\t\t%s\n", yytext); }
\]                      { printf("RIGHT_BRACKET\t\t%s\n", yytext); }
\:                      { printf("COLON\t\t\t%s\n", yytext); }
\;                      { printf("SEMICOLON\t\t%s\n", yytext); }
\.                      { printf("DOT\t\t\t%s\n", yytext); }
\,                      { printf("COMMA\t\t\t%s\n", yytext); }
\@                      { printf("AT_SIGN\t\t\t%s\n", yytext); }

{IDENTIFIER}            { printf("IDENTIFIER\t\t%s\n", yytext); }

{INDENT_SPACE}          { printf("INDENT\t\t\tdepth=%d\n", yyleng/4); }
{INDENT_TAB}            { printf("INDENT\t\t\tdepth=%d\n", yyleng); }
{SPACE}                 { ; }
{LINEBREAK}+            { printf("LINEBREAK\n"); }
