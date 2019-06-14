example1: example1.l 
	lex example1.l
	cc lex.yy.c -o example1 -ll

example2: example2.l
	lex example2.l
	cc lex.yy.c -o example2 -ll

example3: example3.l example3.y
	lex example3.l
	yacc -d example3.y
	cc lex.yy.c y.tab.c -o example3

example4: example4.l example4.y
	lex example4.l
	yacc -d example4.y
	cc lex.yy.c y.tab.c -o example4

example5: example5.l example5.y
	lex example5.l
	yacc -d example5.y
	cc lex.yy.c y.tab.c -o example5

example6: example5.l example6.y
	lex example5.l
	yacc -d example6.y
	cc lex.yy.c y.tab.c -o example6

example7: example5.l example7.y
	lex example5.l
	yacc -d example7.y
	cc lex.yy.c y.tab.c -o example7


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
