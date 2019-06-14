example1: 
	lex calc1.l
	cc lex.yy.c -o example1 -ll

calc4: calc4.y calc3.l
	lex calc3.l
	yacc -d calc4.y
	cc lex.yy.c y.tab.c -o calc4

calc5: calc5.y calc3.l
	lex calc3.l
	yacc -d calc5.y
	cc lex.yy.c y.tab.c -o calc5

calc6: calc6.y calc6.l
	lex calc6.l
	yacc -d calc6.y
	cc lex.yy.c y.tab.c -o calc6
