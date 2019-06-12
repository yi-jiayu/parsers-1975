calc4: calc4.y calc3.l
	lex calc3.l
	yacc -d calc4.y
	cc lex.yy.c y.tab.c -o calc4
