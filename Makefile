calc4: calc4.y calc3.l
	lex calc3.l
	yacc -d calc4.y
	cc lex.yy.c y.tab.c -o calc4

calc5: calc5.y calc3.l
	lex calc3.l
	yacc -d calc5.y
	cc lex.yy.c y.tab.c -o calc5
