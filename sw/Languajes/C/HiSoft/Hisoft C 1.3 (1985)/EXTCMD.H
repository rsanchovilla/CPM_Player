/* * * * * *      E X T C M D . H      * * * * * */
/*                                               */
/*  allow external (bar) commands in a C program */
/*          Copyright (C) 1985 HiSoft            */
/*                                               */
/* * * * * * * * * * * * * * * * * * * * * * * * */

extcmd(param_byte_count)  auto
{
  typedef char ** cpp;
  static char com_name[16], *s, *d;
  static unsigned reg_ix;

  reg_a  = param_byte_count/2 - 2; /* no of args of command */
  reg_ix = cast(int) &param_byte_count + 2; /* addr of last arg */
  s = *cast(cpp)(reg_ix + reg_a*2);
  
  d = com_name;
  do *d++ = toupper(*s++);
  while (*s);
  *--d |= 0x80;

  inline(
    LD_HL_with, com_name,
    CALL,       0xBCD4,   /* KL_FIND_COMMAND */
    PUSH_IX,
    LD_IX_from, &reg_ix,
    JR_NC,      10,
    LD_A_from,  &reg_a,
    PUSH_IY,
    CALL,       0x1B,0,  /* LO_KL_FAR_PCHL */
    POP_IY,
    POP_IX );
}

struct _dscrp {
  char _length;
  char *_start;
  };

int makestr(s,d)
  char *s;
  struct _dscrp *d;
{
  static char *p;

  p = s;
  do ; while (*p++);
  d->_length = p-s-1;
  d->_start  = s;
  return d;
}

/*  End of External Command Handling */


  do ; while (*p++);
  d->_length = p-s-1;