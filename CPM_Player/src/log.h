
#include <windows.h>

class FILEIO;

class LOG
{
private:
	FILEIO* fio;
public:
	LOG(char* filename);
	~LOG();
	void OutLog(char* string);
	void OutLogByte(char c);
	void OutLogOneChar(BYTE code);
    void flush(); 
};


