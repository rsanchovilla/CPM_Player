#include "stdafx.h"

#include "log.h"
#include "fileio.h"
#include "CPM_Player.h"

int max_log_lines = MAX_LOG_LINES; 
extern char module_path[MAX_PATH];

LOG::LOG(char* filename)
{
	char s[1024];
	sprintf_s(s, "%s%s", module_path, filename);
	remove(s);
	fio = new FILEIO();
	fio->Fopen(s, FILEIO_WRITE_ASCII_SHARED);
    if (max_log_lines < 1) max_log_lines = MAX_LOG_LINES; 
}

LOG::~LOG()
{
	if (this) if(fio) fio->Fclose();
	delete fio;
}

void LOG::flush()
{
    if (this) if(fio) fio->Fflush();
}

void LOG::OutLog(char* string)
{
	if (this) if(fio) {
        if (fio->NumLines++ > max_log_lines) return; // max lines in log
	    fio->Fprintf(string);
    }
}

void LOG::OutLogByte(char c)
{
	if (this) if(fio) fio->Fputc(c);
}

void LOG::OutLogOneChar(BYTE code)
{
	char logstring[64];

	if (code == 27) {
		OutLog("<ESC>");
	} else if (code == 26) {
		OutLog("<EOF> (^Z #26 $1A)");
	} else if (code == 13) {
		OutLog("<CR>");
	} else if (code == 9) {
		OutLog("<TAB>");
	} else if (code == 10) {
		OutLog("<LF>");
	} else if (code < 32) {
  	    sprintf_s(logstring, "^%c (#%d $%02x)", 64+code, code, code);
	    OutLog(logstring);
	} else if (code > 127) {
	    sprintf_s(logstring, " %c (#%d $%02x)", code, code, code);
	    OutLog(logstring);
	} else {
		logstring[0] = code;
		logstring[1] = 0;
		OutLog(logstring);
	}
}
