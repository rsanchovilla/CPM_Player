#include "stdafx.h"

#include <share.h>
#include "fileio.h"

int Fexists(char * szPath)
{
    DWORD dwAttr = GetFileAttributes(szPath);
    if (dwAttr == 0xffffffff){
        DWORD dwError = GetLastError();
        if (dwError == ERROR_FILE_NOT_FOUND) return 0; 
        else if (dwError == ERROR_PATH_NOT_FOUND) return 0; 
        else if (dwError == ERROR_ACCESS_DENIED) return 0; 
        return 0;  // some other error has occured
    } else {
        if (dwAttr & FILE_ATTRIBUTE_DIRECTORY) return 0; // this is a directory
        // is an ordinary file
        return 1; 
    }
}

FILEIO::FILEIO()
{
	fp = NULL;
}

FILEIO::~FILEIO(void)
{
	if(fp != NULL) Fclose();
}

bool FILEIO::Fopen(char *filename, int mode)
{
    int r; 
	if(fp != NULL) Fclose();
	fp = NULL;
	NumLines = 0;
	
	if(mode == FILEIO_READ_BINARY)
		r = fopen_s(&fp, filename, "rb");
	else if(mode == FILEIO_WRITE_BINARY)
		r = fopen_s(&fp, filename, "wb");
	else if(mode == FILEIO_READ_WRITE_BINARY)
		r = fopen_s(&fp, filename, "r+b");
	else if(mode == FILEIO_READ_ASCII)
		r = fopen_s(&fp, filename, "r");
	else if(mode == FILEIO_WRITE_ASCII)
		r = fopen_s(&fp, filename, "w");
	else if(mode == FILEIO_READ_WRITE_ASCII)
		r = fopen_s(&fp, filename, "r+w");   
	else if(mode == FILEIO_WRITE_ASCII_SHARED) {
        r=0;
		fp = _fsopen(filename, "w", _SH_DENYWR);
        if (fp == NULL) r=1; // error
    }
	return (r) ? false : true;
}

void FILEIO::Fclose()
{
	if(fp) fclose(fp);
	fp = NULL;
}

void FILEIO::Fflush()
{
	if(fp) fflush(fp);
}


uint32 FILEIO::Fread(void* buffer, uint32 size, uint32 count)
{
	return fread(buffer, size, count, fp);
}

uint32 FILEIO::Fwrite(void* buffer, uint32 size, uint32 count)
{
	return fwrite(buffer, size, count, fp);
}

void FILEIO::Fprintf(char *string)
{
//	_ftprintf(fp, string); // problen writing %s characters
	fwrite(string, 1, strlen(string), fp);
}

void FILEIO::Fputc(uint8 data)
{
	fputc(data, fp);
}

int FILEIO::Fgetc()
{
	return fgetc(fp);
}

bool FILEIO::Fgets(char *string, int size)
{
	return (fgets(string, size, fp) == NULL) ? false : true;
}

uint32 FILEIO::Fseek(long offset, int origin)
{
	DWORD val = 0xFFFFFFFF;
	if(origin == FILEIO_SEEK_CUR)
		val = fseek(fp, offset, SEEK_CUR);
	else if(origin == FILEIO_SEEK_END)
		val = fseek(fp, offset, SEEK_END);
	else if(origin == FILEIO_SEEK_SET)
		val = fseek(fp, offset, SEEK_SET);
	return val;
}

uint32 FILEIO::Ftell()
{
	return ftell(fp);
}

bool FILEIO::IsOpened()
{
	return (fp != NULL) ? true : false;
}

long FILEIO::Size()
{
	uint32 pos = Ftell();
	Fseek(0, FILEIO_SEEK_END);
	uint32 sz = Ftell();
	Fseek(pos, FILEIO_SEEK_SET);
	return sz;
}

bool FILEIO::Ftruncate(long sz)
{
	fseek(fp, sz, SEEK_SET);
	if (SetEndOfFile(fp) == 0) return false; 
	return true;
}

bool FILEIO::FreadIni(char *filename)
{
	//read the whole ini file into a buffer. Buffer should have at least a len of 3
	int read_ok = 0;
	int bufferlen = sizeof(inibuffer);

	if(Fopen(filename, FILEIO_READ_BINARY)) {
 		bufferlen = Fread((void *)&inibuffer[1], 1, bufferlen-2) + 1;
		Fclose();
		read_ok = 1;
	}
	if (read_ok == 0) {
		inibuffer[0] = 0;
		return FALSE;
	}

	//process the buffer to remove blanks, case, comments, etc
	inibuffer[0] = 13; 
	int iRead = 1;
	int iWrite = 1;
	int status = 0;
	char c;

	for (iRead=0; iRead<bufferlen; iRead++) {
		c = inibuffer[iRead];
		if (c < 13) {
			// skip control characters
			continue; 
		} else if (c == 13) {
			//New Line: remove trailing blanks
			while (inibuffer[iWrite-1] == 32) {
				iWrite--;
			}
			status = 0; // set status to: start of line
			if (inibuffer[iWrite-1] == 13) continue; // skip blank lines
			inibuffer[iWrite++] = c; // end of previous line;
		} else if (status == 4) {
			//is a comment, skip until end of line
			continue;
		} else if ((status == 0) && (c == ';')) {
			//is a comment
			status = 4;
		} else if (c == 32) {
			if ((status == 0) || (status == 1) || (status == 2)) {
				//0: start of line: skip leading blanks
				//1: reading tag: skip blanks
				//2: looking for value: skip leading blanks
				continue;
			} else {
				//3: reading value: keep blanks
				inibuffer[iWrite++] = c;
			}
		} else if ((c == '=') || (c == ':')) {
			if (status < 2) {
				inibuffer[iWrite++] = c;
				status = 2;
			} else {
				inibuffer[iWrite++] = c;
				status = 3;
			}
		} else {
			if (status < 2) {
				//set tag to uppercase
				if ((c >= 'a') && ( c <= 'z')) c = c - 'a' + 'A';
				inibuffer[iWrite++] = c;
				status = 1;
			} else {
				// keep value as it is
				inibuffer[iWrite++] = c;
				status = 3;
			}

		}
	}
	// add a closing CR, and an end of string
	inibuffer[iWrite++] = 13;
	inibuffer[iWrite++] = 0;
	return TRUE;
}

bool FILEIO::FGetIniStringN(int nOcurrence, char* strtag, char delimiter, char* strval, int strvallen)
{
	//search in inibuffer for the tag iInstance and return the value
	char tag[512];
	strval[0] = 0;

	int iRead = 0;
	int iWrite = 0;
	int status = 0;
	char c;

	tag[sizeof(tag)-1] = 0;

	// tag = upper(deletespaces(strtag))+delimiter
	for (iRead=0; iWrite<sizeof(tag)-1; iRead++) {
		c = strtag[iRead];
		if (c==0) {
			tag[iWrite++] = delimiter;
			tag[iWrite++] = 0;
			break;
		}
		if (c <= ' ') continue; // ignore spaces
		//set tag to uppercase
		if ((c >= 'a') && ( c <= 'z')) c = c - 'a' + 'A';
		tag[iWrite++] = c;
	}
	int taglen = iWrite;

    // search tag into inibuffer
	iRead = 0;
	int found = 0;
	int vallen = 0;

	for (;;) {
		while ((inibuffer[iRead] != 0) && (inibuffer[iRead] != 13)) {
			iRead++; // go to next begin of tag
		}
		c = inibuffer[iRead];
		if (c == 0) break;
		// Here c=13 -> is the begin of a tag
		// compare tag
		found = 0; 
		vallen = 0;
		iRead++;
		for (int i=0; i<taglen; i++) {
			if ((tag[i] == 0) && (inibuffer[iRead + i] == 0)) {
				// both string finishes at the same time -> found ok
				found = iRead + i;
				break;
			} else if (tag[i] == 0) {
				// tag found -> load value
				found = iRead + i;
				break;
			} else if (inibuffer[iRead + i] == 0) {
				// ini finished but tag is not finished -> not found
				found = 0;
				break;
			} else if (inibuffer[iRead + i] == tag[i]) {
				// same char -> keep comparing
				continue;
			} else {
				// diferent chars -> not found
				found = 0;
				break;
			}
		}
		if ((found >0) && (nOcurrence > 1)) {
			nOcurrence--;
			found = 0;
			continue;
		}
		if (found == 0) continue;

		// if value, read it
		for (int i=0; i<strvallen-1;i++) {
			c = inibuffer[i+found];
			if (c == 0) break;
			if (c == 13) break;
			strval[i] = c;
			vallen = i+1;
		}
		strval[vallen] = 0;
		return TRUE;
	}
	// tag not found
	return FALSE;
}


bool FILEIO::FGetIniString(char* strtag, char* strval, int strvallen)
{
    return FGetIniStringN(1, strtag, '=', strval, strvallen);
}

bool FILEIO::FGetIniFilePath(char* strtag, char* strval, int strvallen, char* module_path)
{
    if (!FGetIniStringN(1, strtag, '=', strval, strvallen)) return FALSE;

	FILEIO* fio = new FILEIO();
	if(fio->Fopen(strval, FILEIO_READ_BINARY)) {
		fio->Fclose();
		return TRUE;
	} 
	char s[MAX_PATH];
	sprintf_s(s, "%s%s", module_path, strval);
	
	if(fio->Fopen(s, FILEIO_READ_BINARY)) {
		fio->Fclose();
		sprintf_s(strval, 255, "%s", s);
		return TRUE;
	} 

	delete fio;
	return FALSE;
}

bool FILEIO::FGetIniInt(char* strtag, int& n)
{
	n = 0;

	char val[255];

	if (!FGetIniString(strtag, val, sizeof(val))) return FALSE;
	if (sscanf_s (val,"%d",&n) != 1) return FALSE;
	return TRUE;
}


bool FILEIO::FGetIniHex(char* strtag, int& n)
{
	n = 0;

	char val[255];

	if (!FGetIniString(strtag, val, sizeof(val))) return FALSE;
	if (sscanf_s (val,"%x",&n) != 1) return FALSE;
	return TRUE;
}

