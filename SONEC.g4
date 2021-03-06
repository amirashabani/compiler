grammar SONEC;

program:	stmts*;

/* Grammars */
/* Statements */

stmts:		stmt |
			NEWLINES stmt |
			stmt NEWLINES |
			NEWLINES stmt NEWLINES |
			stmt NEWLINE stmts |
			NEWLINES stmt NEWLINE stmts;

stmt:		if_stmt | for_stmt | while_stmt | print | initialize | save | load | crawl | push | pop | return;

if_stmt:	IF logic_exp COLON NEWLINE indent stmts NEWLINE dedent ELSE COLON NEWLINE indent stmts NEWLINE dedent |
			IF rel_exp COLON NEWLINE indent stmts NEWLINE dedent ELSE COLON NEWLINE indent stmts NEWLINE dedent;

for_stmt:	FOR ID IN ID COLON NEWLINE stmts;

while_stmt:	WHILE O_PARAN logic_exp	C_PARAN COLON NEWLINE stmts |
			WHILE O_PARAN rel_exp	C_PARAN COLON NEWLINE stmts |
			WHILE logic_exp COLON NEWLINE stmts					|
			WHILE rel_exp COLON NEWLINE stmts;

print:		PRINT O_PARAN CHARS		C_PARAN |
			PRINT O_PARAN ID 		C_PARAN |
			PRINT O_PARAN logic_exp C_PARAN |
			PRINT O_PARAN rel_exp	C_PARAN |
			PRINT O_PARAN art_exp	C_PARAN;

initialize:	INIT NETWORK WITH CHARS;

save:		SAVE ID IN CHARS;

load:		LOAD CHARS;

crawl:		CRAWL NODE ID |
			CRAWL POSTS ID |
			CRAWL FEEDBACKS ID |
			CRAWL INLINKS ID |
			CRAWL OUTLINKS ID;

push:		PUSH ID IN ID;

pop:		POP ID;

return:		RETURN logic_exp |
			RETURN rel_exp |
			RETURN art_exp |
			RETURN CHARS;

logic_exp:	O_PARAN logic_exp C_PARAN |
			NOT logic_exp |
			logic_exp AND logic_exp |
			logic_exp OR logic_exp |
			logic_exp XOR logic_exp |
			NOT rel_exp |
			rel_exp AND rel_exp |
			rel_exp OR rel_exp |
			rel_exp XOR rel_exp |
			TRUE | FALSE
			ID;

rel_exp:	O_PARAN rel_exp C_PARAN |
			art_exp EQU art_exp |
			art_exp NEQ art_exp |
			art_exp GTR art_exp |
			art_exp LSS art_exp |
			art_exp GEQ art_exp |
			art_exp LEQ art_exp;

art_exp:	O_PARAN art_exp C_PARAN |
			art_exp MUL art_exp	|
			art_exp DIV	art_exp |
			art_exp MOD art_exp |
			art_exp PLUS art_exp |
			art_exp SUB art_exp |
			FLOAT | DECIMAL | HEX |
			LEN O_PARAN ID C_PARAN |
			ID;

/* Tokens */
/* Keywords */

// Conditional keywords
FOR:		F O R;
WHILE:		W H I L E;
IF:			I F;
ELSE:		E L S E;

// Type keywords
NUMBER:		N U M B E R;
STRING:		S T R I N G;
BOOL:		B O O L;
QUEUE:		Q U E U E;
STACK:		S T A C K;
SET:		S E T;
FEEDBACKS:	F E E D B A C K S;
FEEDBACK:	F E E D B A C K;
POSTS:		P O S T S;
POST:		P O S T;
OUTLINKS:	O U T G O I N G '-' L I N K S;
INLINKS:	I N G O I N G '-' L I N K S;
OUTLINK:	O U T G O I N G '-' L I N K;
INLINK:		I N G O I N G '-' L I N K;
LINK:		L I N K;
NODE:		N O D E;
NETWORK:	T E L E G R A M | I N S T A G R A M | T W I T T E R;

// Other
DEF:		D E F;
RETURN:		R E T U R N;
THEN:		T H E N;
END:		E N D;
BEGIN:		B E G I N;
PRINT:		P R I N T;
INPUT:		I N P U T;
SOURCE:		S O U R C E;
SAVE:		S A V E;
LOAD:		L O A D;
LEN:		L E N;
INIT:		I N I T I A L I Z E;
IN:			I N;
OWNER:		O W N E R;
DEST:		D E S T I N A T I O N;
PUSH:		P U S H;
POP:		P O P;
WITH:		W I T H;
CRAWL:		C R A W L;

/* Literals */

// Logical
TRUE:		T R U E;
FALSE:		F A L S E;

// Numerical
FLOAT:		([0-9]+'.'[0-9]*) | ([0-9]*'.'[0-9]+);
DECIMAL:	[0-9]+;
HEX:		'0x'[0-9a-fA-F]+;

// String
CHARS:		'"' (~["\r\n])* '"';


/* Symbols */
O_BRACE:	'{';
C_BRACE:	'}';

O_PARAN:	'(';
C_PARAN:	')';

O_BRACKET:	'[';
C_BRACKET:	']';

COLON:		':';

/* Operands */

// Arithmetic
MUL:		'*';
DIV:		'/';
MOD:		'%';
PLUS:		'+';
SUB:		'-';

// Logical
NOT:		N O T;
AND:		A N D;
OR:			O R;
XOR:		X O R;

// Relational
EQU:		'==';
NEQ:		'!=';
GTR:		'>';
LSS:		'<';
GEQ:		'>=';
LEQ:		'<=';

// ASSIGNMENT
ASSIGN:		'=';

/* Comments */
M_COMMENT:	'##'(('\n' | .)*?)'##'NEWLINE;
S_COMMENT:	'#'((.)*?)NEWLINE;

NEWLINE:	'\r'?'\n';
NEWLINES:   ('\r'?'\n')+;

WHITESPACE:	[ ]+ -> skip;

ID:			[a-zA-Z_][a-zA-Z0-9_]*;

fragment A: 'a' | 'A';
fragment B: 'b' | 'B';
fragment C: 'c' | 'C';
fragment D: 'd' | 'D';
fragment E: 'e' | 'E';
fragment F: 'f' | 'F';
fragment G: 'g' | 'G';
fragment H: 'h' | 'H';
fragment I: 'i' | 'I';
fragment J: 'j' | 'J';
fragment K: 'k' | 'K';
fragment L: 'l' | 'L';
fragment M: 'm' | 'M';
fragment N: 'n' | 'N';
fragment O: 'o' | 'O';
fragment P: 'p' | 'P';
fragment Q: 'q' | 'Q';
fragment R: 'r' | 'R';
fragment S: 's' | 'S';
fragment T: 't' | 'T';
fragment U: 'u' | 'U';
fragment V: 'v' | 'V';
fragment W: 'w' | 'W';
fragment X: 'x' | 'X';
fragment Y: 'y' | 'Y';
fragment Z: 'z' | 'Z';

