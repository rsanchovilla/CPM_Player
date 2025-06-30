
#include <windows.h>
#include <stdio.h>
#include "common.h"

#define FILEIO_READ_BINARY 1
#define FILEIO_WRITE_BINARY 2
#define FILEIO_READ_WRITE_BINARY 3
#define FILEIO_READ_ASCII 4
#define FILEIO_WRITE_ASCII 5
#define FILEIO_READ_WRITE_ASCII 6
#define FILEIO_WRITE_ASCII_SHARED 7

#define FILEIO_SEEK_SET 0
#define FILEIO_SEEK_CUR 1
#define FILEIO_SEEK_END 2

class FILEIO
{
private:
	FILE* fp;
	char inibuffer[65535];

public:
	int NumLines; 
	FILEIO();
	~FILEIO();
	bool Fopen(char *filename, int mode);
	void Fclose();
    void Fflush(); 
	uint32 Fread(void* buffer, uint32 size, uint32 count);
	uint32 Fwrite(void* buffer, uint32 size, uint32 count);
	void Fprintf(char *string);
	void Fputc(uint8 data);
	int Fgetc();
	bool Fgets(char *string, int size);
	uint32 Fseek(long offset, int origin);
	bool Ftruncate(long sz);
	uint32 Ftell();
	bool IsOpened();
	long Size();

	bool FreadIni(char *filename);
	bool FGetIniStringN(int nOcurrence, char* strtag, char delimiter, char* strval, int strvallen);
	bool FGetIniString(char* strtag, char* strval, int strvallen);
	bool FGetIniFilePath(char* strtag, char* strval, int strvallen, char* module_path);
	bool FGetIniInt(char* strtag, int& n);
	bool FGetIniHex(char* strtag, int& n);
};

int Fexists(char * szPath);
