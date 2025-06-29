/*	>>>>>>> start of cc5 <<<<<<<	*/

/* as of 5/5/81 rj */

expression()
{
	int lval[2];
	if(heir1(lval))rvalue(lval);
}
heir1(lval)
	int lval[];
{
	int k,lval2[2];
	k=heir2(lval);
	if (match("="))
		{if(k==0){needlval();return 0;}
		if (lval[1])zpush();
		if(heir1(lval2))rvalue(lval2);
		store(lval);
		return 0;
		}
	else return k;
}
heir2(lval)
	int lval[];
{	int k,lval2[2];
	k=heir3(lval);
	blanks();
	if(ch()!='|')return k;
	if(k)rvalue(lval);
	while(1)
		{if (match("|"))
			{zpush();
			if(heir3(lval2)) rvalue(lval2);
			zpop();
			zor();
			}
		else return 0;
		}
}
heir3(lval)
	int lval[];
{	int k,lval2[2];
	k=heir4(lval);
	blanks();
	if(ch()!='^')return k;
	if(k)rvalue(lval);
	while(1)
		{if (match("^"))
			{zpush();
			if(heir4(lval2))rvalue(lval2);
			zpop();
			zxor();
			}
		else return 0;
		}
}
heir4(lval)
	int lval[];
{	int k,lval2[2];
	k=heir5(lval);
	blanks();
	if(ch()!='&')return k;
	if(k)rvalue(lval);
	while(1)
		{if (match("&"))
			{zpush();
			if(heir5(lval2))rvalue(lval2);
			zpop();
			zand();
			}
		else return 0;
		}
}
heir5(lval)
	int lval[];
{
	int k,lval2[2];
	k=heir6(lval);
	blanks();
	if((streq(line+lptr,"==")==0)&
		(streq(line+lptr,"!=")==0))return k;
	if(k)rvalue(lval);
	while(1)
		{if (match("=="))
			{zpush();
			if(heir6(lval2))rvalue(lval2);
			zpop();
			zeq();
			}
		else if (match("!="))
			{zpush();
			if(heir6(lval2))rvalue(lval2);
			zpop();
			zne();
			}
		else return 0;
		}
}
heir6(lval)
	int lval[];
{
	int k,lval2[2];
	k=heir7(lval);
	blanks();
	if((streq(line+lptr,"<")==0)&
		(streq(line+lptr,">")==0)&
		(streq(line+lptr,"<=")==0)&
		(streq(line+lptr,">=")==0))return k;
		if(streq(line+lptr,">>"))return k;
		if(streq(line+lptr,"<<"))return k;
	if(k)rvalue(lval);
	while(1)
		{if (match("<="))
			{zpush();
			if(heir7(lval2))rvalue(lval2);
			zpop();
			if(cptr=lval[0])
				if(cptr[ident]==pointer)
				{ule();
				continue;
				}
			if(cptr=lval2[0])
				if(cptr[ident]==pointer)
				{ule();
				continue;
				}
			zle();
			}
		else if (match(">="))
			{zpush();
			if(heir7(lval2))rvalue(lval2);
			zpop();
			if(cptr=lval[0])
				if(cptr[ident]==pointer)
				{uge();
				continue;
				}
			if(cptr=lval2[0])
				if(cptr[ident]==pointer)
				{uge();
				continue;
				}
			zge();
			}
		else if((streq(line+lptr,"<"))&
			(streq(line+lptr,"<<")==0))
			{inbyte();
			zpush();
			if(heir7(lval2))rvalue(lval2);
			zpop();
			if(cptr=lval[0])
				if(cptr[ident]==pointer)
				{ult();
				continue;
				}
			if(cptr=lval2[0])
				if(cptr[ident]==pointer)
				{ult();
				continue;
				}
			zlt();
			}
		else if((streq(line+lptr,">"))&
			(streq(line+lptr,">>")==0))
			{inbyte();
			zpush();
			if(heir7(lval2))rvalue(lval2);
			zpop();
			if(cptr=lval[0])
				if(cptr[ident]==pointer)
				{ugt();
				continue;
				}
			if(cptr=lval2[0])
				if(cptr[ident]==pointer)
				{ugt();
				continue;
				}
			zgt();
			}
		else return 0;
		}
}
/*	>>>>>> start of cc6 <<<<<<	*/

heir7(lval)
	int lval[];
{
	int k,lval2[2];
	k=heir8(lval);
	blanks();
	if((streq(line+lptr,">>")==0)&
		(streq(line+lptr,"<<")==0))return k;
	if(k)rvalue(lval);
	while(1)
		{if (match(">>"))
			{zpush();
			if(heir8(lval2))rvalue(lval2);
			zpop();
			asr();
			}
		else if (match("<<"))
			{zpush();
			if(heir8(lval2))rvalue(lval2);
			zpop();
			asl();
			}
		else return 0;
		}
}
heir8(lval)
	int lval[];
{
	int k,lval2[2];
	k=heir9(lval);
	blanks();
	if((ch()!='+')&(ch()!='-'))return k;
	if(k)rvalue(lval);
	while(1)
		{if (match("+"))
			{zpush();
			if(heir9(lval2))rvalue(lval2);
			if(cptr=lval[0])
				if((cptr[ident]==pointer)&
				(cptr[type]==cint))
				doublereg();
			zpop();
			zadd();
			}
		else if (match("-"))
			{zpush();
			if(heir9(lval2))rvalue(lval2);
			if(cptr=lval[0])
				if((cptr[ident]==pointer)&
				(cptr[type]==cint))
				doublereg();
			zpop();
			zsub();
			}
		else return 0;
		}
}
heir9(lval)
	int lval[];
{
	int k,lval2[2];
	k=heir10(lval);
	blanks();
	if((ch()!='*')&(ch()!='/')&
		(ch()!='%'))return k;
	if(k)rvalue(lval);
	while(1)
		{if (match("*"))
			{zpush();
			if(heir9(lval2))rvalue(lval2);
			zpop();
			mult();
			}
		else if (match("/"))
			{zpush();
			if(heir10(lval2))rvalue(lval2);
			zpop();
			div();
			}
		else if (match("%"))
			{zpush();
			if(heir10(lval2))rvalue(lval2);
			zpop();
			zmod();
			}
		else return 0;
		}
}
heir10(lval)
	int lval[];
{
	int k;
	char *ptr;
	if(match("++"))
		{if((k=heir10(lval))==0)
			{needlval();
			return 0;
			}
		if(lval[1])zpush();
		rvalue(lval);
		inc();
		ptr=lval[0];
		if((ptr[ident]==pointer)&
			(ptr[type]==cint))
				inc();
		store(lval);
		return 0;
		}
	else if(match("--"))
		{if((k=heir10(lval))==0)
			{needlval();
			return 0;
			}
		if(lval[1])zpush();
		rvalue(lval);
		dec();
		ptr=lval[0];
		if((ptr[ident]==pointer)&
			(ptr[type]==cint))
				dec();
		store(lval);
		return 0;
		}
	else if (match("-"))
		{k=heir10(lval);
		if (k) rvalue(lval);
		neg();
		return 0;
		}
	else if(match("*"))
		{k=heir10(lval);
		if(k)rvalue(lval);
		lval[1]=cint;
		if(ptr=lval[0])lval[1]=ptr[type];
		lval[0]=0;
		return 1;
		}
	else if(match("&"))
		{k=heir10(lval);
		if(k==0)
			{error("illegal address");
			return 0;
			}
		else if(lval[1])return 0;
		else
			{immed();
			outname(ptr=lval[0]);
			nl();
			lval[1]=ptr[type];
			return 0;
			}
		}
	else 
		{k=heir11(lval);
		if(match("++"))
			{if(k==0)
				{needlval();
				return 0;
				}
			if(lval[1])zpush();
			rvalue(lval);
			inc();
			ptr=lval[0];
			if((ptr[ident]==pointer)&
				(ptr[type]==cint))
					inc();
			store(lval);
			dec();
			if((ptr[ident]==pointer)&
				(ptr[type]==cint))
				dec();
			return 0;
			}
		else if(match("--"))
			{if(k==0)
				{needlval();
				return 0;
				}
			if(lval[1])zpush();
			rvalue(lval);
			dec();
			ptr=lval[0];
			if((ptr[ident]==pointer)&
				(ptr[type]==cint))
					dec();
			store(lval);
			inc();
			if((ptr[ident]==pointer)&
				(ptr[type]==cint))
				inc();
			return 0;
			}
		else return k;
		}
	}
/*	>>>>>> start of cc7 <<<<<<	*/

heir11(lval)
	int *lval;
{	int k;char *ptr;
	k=primary(lval);
	ptr=lval[0];
	blanks();
	if((ch()=='[')|(ch()=='('))
	while(1)
		{if(match("["))
			{if(ptr==0)
				{error("can't subscript");
				junk();
				needbrack("]");
				return 0;
				}
			else if(ptr[ident]==pointer)rvalue(lval);
			else if(ptr[ident]!=array)
				{error("can't subscript");
				k=0;
				}
			zpush();
			expression();
			needbrack("]");
			if(ptr[type]==cint)doublereg();
			zpop();
			zadd();
			lval[1]=ptr[type];
				/* 4/1/81 - after subscripting, not ptr anymore */
			lval[0]=0;
			k=1;
			}
		else if(match("("))
			{if(ptr==0)
				{callfunction(0);
				}
			else if(ptr[ident]!=function)
				{rvalue(lval);
				callfunction(0);
				}
			else callfunction(ptr);
			k=lval[0]=0;
			}
		else return k;
		}
	if(ptr==0)return k;
	if(ptr[ident]==function)
		{immed();
		outname(ptr);
		nl();
		return 0;
		}
	return k;
}
primary(lval)
	int *lval;
{	char *ptr,sname[namesize];int num[1];
	int k;
	if(match("("))
		{k=heir1(lval);
		needbrack(")");
		return k;
		}
	if(symname(sname))
		{if(ptr=findloc(sname))
			{getloc(ptr);
			lval[0]=ptr;
			lval[1]=ptr[type];
			if(ptr[ident]==pointer)lval[1]=cint;
			if(ptr[ident]==array)return 0;
				else return 1;
			}
		if(ptr=findglb(sname))
			if(ptr[ident]!=function)
			{lval[0]=ptr;
			lval[1]=0;
			if(ptr[ident]!=array)return 1;
			immed();
			outname(ptr);nl();
			lval[1]=ptr[type];
			return 0;
			}
		ptr=addglb(sname,function,cint,0);
		lval[0]=ptr;
		lval[1]=0;
		return 0;
		}
	if(constant(num))
		return(lval[0]=lval[1]=0);
	else
		{error("invalid expression");
		immed();outdec(0);nl();
		junk();
		return 0;
		}
	}
store(lval)
	int *lval;
{	if (lval[1]==0)putmem(lval[0]);
	else putstk(lval[1]);
}
rvalue(lval)
	int *lval;
{	if((lval[0] != 0) & (lval[1] == 0))
		getmem(lval[0]);
		else indirect(lval[1]);
}
test(label)
	int label;
{
	needbrack("(");
	expression();
	needbrack(")");
	testjump(label);
}
constant(val)
	int val[];
{	if (number(val))
		immed();
	else if (pstr(val))
		immed();
	else if (qstr(val))
		{immed();printlabel(litlab);outbyte('+');}
	else return 0;	
	outdec(val[0]);
	nl();
	return 1;
}
number(val)
	int val[];
{	int k,minus;char c;
	k=minus=1;
	while(k)
		{k=0;
		if (match("+")) k=1;
		if (match("-")) {minus=(-minus);k=1;}
		}
	if(numeric(ch())==0)return 0;
	while (numeric(ch()))
		{c=inbyte();
		k=k*10+(c-'0');
		}
	if (minus<0) k=(-k);
	val[0]=k;
	return 1;
}
pstr(val)
	int val[];
{	int k;char c;
	k=0;
	if (match("'")==0) return 0;
	while((c=gch())!=39)
		k=(k&255)*256 + (c&127);
	val[0]=k;
	return 1;
}
qstr(val)
	int val[];
{	char c;
	if (match(quote)==0) return 0;
	val[0]=litptr;
	while (ch()!='"')
		{if(ch()==0)break;
		if(litptr>=litmax)
			{error("string space exhausted");
			while(match(quote)==0)
				if(gch()==0)break;
			return 1;
			}
		litq[litptr++]=gch();
		}
	gch();
	litq[litptr++]=0;
	return 1;
}
/*	>>>>>> start of cc8 <<<<<<<	*/

/* Begin a comment line for the assembler */
comment()
{	outbyte(';');
}

/* Put out assembler info before any code is generated */
header()
{	comment();
	outstr(BANNER);
	nl();
	comment();
	outstr(VERSION);
	nl();
	comment();
	outstr(AUTHOR);
	nl();
	comment();
	nl();
	if(mainflg){		/* do stuff needed for first */
		ol("ORG 100h"); /* assembler file. */		   
		ol("LHLD 6");	/* set up stack */
		ol("SPHL");
		callrts("ccgo");	/* set default drive for CP/M */
		zcall("main");	/* call the code generated by small-c */
		zcall("exit");	/* do an exit		gtf 7/16/80 */
		}
}
/* Print any assembler stuff needed after all code */
trailer()
{	/* ol("END"); */	/*...note: commented out! */

	nl();			/* 6 May 80 rj errorsummary() now goes to console */
	comment();
	outstr(" --- End of Compilation ---");
	nl();
}
/* Print out a name such that it won't annoy the assembler */
/*	(by matching anything reserved, like opcodes.) */
/*	gtf 4/7/80 */
outname(sname)
char *sname;
{	int len, i,j;

	outasm("qz");
	len = strlen(sname);
	if(len>(asmpref+asmsuff)){
		i = asmpref;
		len = len-asmpref-asmsuff;
		while(i-- > 0)
			outbyte(raise(*sname++));
		while(len-- > 0)
			sname++;
		while(*sname)
			outbyte(raise(*sname++));
		}
	else	outasm(sname);
/* end outname */}
/* Fetch a static memory cell into the primary register */
getmem(sym)
	char *sym;
{	if((sym[ident]!=pointer)&(sym[type]==cchar))
		{ot("LDA ");
		outname(sym+name);
		nl();
		callrts("ccsxt");
		}
	else
		{ot("LHLD ");
		outname(sym+name);
		nl();
		}
	}
/* Fetch the address of the specified symbol */
/*	into the primary register */
getloc(sym)
	char *sym;
{	immed();
	outdec(((sym[offset]&255)+
		((sym[offset+1]&255)<<8))-
		Zsp);
	nl();
	ol("DAD SP");
	}
/* Store the primary register into the specified */
/*	static memory cell */
putmem(sym)
	char *sym;
{	if((sym[ident]!=pointer)&(sym[type]==cchar))
		{ol("MOV A,L");
		ot("STA ");
		}
	else ot("SHLD ");
	outname(sym+name);
	nl();
	}
/* Store the specified object type in the primary register */
/*	at the address on the top of the stack */
putstk(typeobj)
char typeobj;
{	zpop();
	if(typeobj==cint)
		callrts("ccpint");
	else {	ol("MOV A,L");		/* per Ron Cain: gtf 9/25/80 */
		ol("STAX D");
		}
	}
/* Fetch the specified object type indirect through the */
/*	primary register into the primary register */
indirect(typeobj)
	char typeobj;
{	if(typeobj==cchar)callrts("ccgchar");
		else callrts("ccgint");
}
/* Swap the primary and secondary registers */
swap()
{	ol("XCHG");
}
/* Print partial instruction to get an immediate value */
/*	into the primary register */
immed()
{	ot("LXI H,");
}
/* Push the primary register onto the stack */
zpush()
{	ol("PUSH H");
	Zsp=Zsp-2;
}
/* Pop the top of the stack into the secondary register */
zpop()
{	ol("POP D");
	Zsp=Zsp+2;
}
/* Swap the primary register and the top of the stack */
swapstk()
{	ol("XTHL");
}
/* Call the specified subroutine name */
zcall(sname)
	char *sname;
{	ot("CALL ");
	outname(sname);
	nl();
}
/* Call a run-time library routine */
callrts(sname)
char *sname;
{
	ot("CALL ");
	outasm(sname);
	nl();
/*end callrts*/}

/* Return from subroutine */
zret()
{	ol("RET");
}
/* Perform subroutine call to value on top of stack */
callstk()
{	immed();
	outasm("$+5");
	nl();
	swapstk();
	ol("PCHL");
	Zsp=Zsp+2; /* corrected 5 May 81 rj */
	}
/* Jump to specified internal label number */
jump(label)
	int label;
{	ot("JMP ");
	printlabel(label);
	nl();
	}
/* Test the primary register and jump if false to label */
testjump(label)
	int label;
{	ol("MOV A,H");
	ol("ORA L");
	ot("JZ ");
	printlabel(label);
	nl();
	}
/* Print pseudo-op to define a byte */
defbyte()
{	ot("DB ");
}
/*Print pseudo-op to define storage */
defstorage()
{	ot("DS ");
}
/* Print pseudo-op to define a word */
defword()
{	ot("DW ");
}
/* Modify the stack pointer to the new value indicated */
modstk(newsp)
	int newsp;
 {	int k;
	k=newsp-Zsp;
	if(k==0)return newsp;
	if(k>=0)
		{if(k<7)
			{if(k&1)
				{ol("INX SP");
				k--;
				}
			while(k)
				{ol("POP B");
				k=k-2;
				}
			return newsp;
			}
		}
	if(k<0)
		{if(k>-7)
			{if(k&1)
				{ol("DCX SP");
				k++;
				}
			while(k)
				{ol("PUSH B");
				k=k+2;
				}
			return newsp;
			}
		}
	swap();
	immed();outdec(k);nl();
	ol("DAD SP");
	ol("SPHL");
	swap();
	return newsp;
}
/* Double the primary register */
doublereg()
{	ol("DAD H");
}
/* Add the primary and secondary registers */
/*	(results in primary) */
zadd()
{	ol("DAD D");
}
/* Subtract the primary register from the secondary */
/*	(results in primary) */
zsub()
{	callrts("ccsub");
}
/* Multiply the primary and secondary registers */
/*	(results in primary */
mult()
{	callrts("ccmult");
}
/* Divide the secondary register by the primary */
/*	(quotient in primary, remainder in secondary) */
div()
{	callrts("ccdiv");
}
/* Compute remainder (mod) of secondary register divided */
/*	by the primary */
/*	(remainder in primary, quotient in secondary) */
zmod()
{	div();
	swap();
	}
/* Inclusive 'or' the primary and the secondary registers */
/*	(results in primary) */
zor()
	{callrts("ccor");}
/* Exclusive 'or' the primary and seconday registers */
/*	(results in primary) */
zxor()
	{callrts("ccxor");}
/* 'And' the primary and secondary registers */
/*	(results in primary) */
zand()
	{callrts("ccand");}
/* Arithmetic shift right the secondary register number of */
/*	times in primary (results in primary) */
asr()
	{callrts("ccasr");}
/* Arithmetic left shift the secondary register number of */
/*	times in primary (results in primary) */
asl()
	{callrts("ccasl");}
/* Form two's complement of primary register */
neg()
	{callrts("ccneg");}
/* Form one's complement of primary register */
com()
	{callrts("cccom");}
/* Increment the primary register by one */
inc()
	{ol("INX H");}
/* Decrement the primary register by one */
dec()
	{ol("DCX H");}

/* Following are the conditional operators */
/* They compare the secondary register against the primary */
/* and put a literal 1 in the primary if the condition is */
/* true, otherwise they clear the primary register */

/* Test for equal */
zeq()
	{callrts("cceq");}
/* Test for not equal */
zne()
	{callrts("ccne");}
/* Test for less than (signed) */
zlt()
	{callrts("cclt");}
/* Test for less than or equal to (signed) */
zle()
	{callrts("ccle");}
/* Test for greater than (signed) */
zgt()
	{callrts("ccgt");}
/* Test for greater than or equal to (signed) */
zge()
	{callrts("ccge");}
/* Test for less than (unsigned) */
ult()
	{callrts("ccult");}
/* Test for less than or equal to (unsigned) */
ule()
	{callrts("ccule");}
/* Test for greater than (unsigned) */
ugt()
	{callrts("ccugt");}
/* Test for greater than or equal to (unsigned) */
uge()
	{callrts("ccuge");}

/*	<<<<<  End of small-c compiler	>>>>>	*/
/* Test for greater than or equal to (unsigned) */
uge(