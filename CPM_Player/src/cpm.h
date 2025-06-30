
#include <windows.h>
#include <mmsystem.h>
#include <stdlib.h>
#include <stdio.h>
#include "common.h"
#include "CPM_Player.h"

class FILEIO;
class LOG;
class CONSOLE;
class Z80;

#define TPA_BASE 0x100

#define MAX_FIND_FILE 256

#define IRQ_ENTRY_MAX 8

#define MaxPrefetchFileSize 2*64*1024 // Max file size prefeched

class CPM
{
	friend CONSOLE;
	friend Z80;

private:
	char file_path[MAX_PATH];
	char drive_path[16][MAX_PATH];
	
	typedef struct {
		CPM* cpm;
		CONSOLE* console;
		bool running;
		int cpu_max_ips;
		int ccp_flag; 
	} PARAMS, *PPARAMS;
	PARAMS params;

	int submit_active;
	int xsub_active;
	int xsub_wait_counter;
	int xsub_wait_counter_ms;
	int xsub_delay;
	BYTE submit_file[16*1024];

	int emulation_running;

	int ccp_active; 
	BYTE ccp_mem[32768];
	int ccp_base, ccp_len;
	int cold_boot; 
	
	static DWORD WINAPI Thread(LPVOID pvoid);
	HANDLE hThread;
	
	int RunCPU(int cpu_slice, int cpu_time_slice_ms);
	uint8* memory;
	int ioport[256];

	// Memory sizes
    int CCP_BASE;
    int BDOS_BASE;
    int BIOS_BASE;

	// Prefech read file 
	int PrefetchFileLen; // len for file prefetched. -1 -> no file prefetched
	BYTE PrefetchFileFCB[12]; // CPM FileName for prefetched file
	BYTE PrefetchFileData[MaxPrefetchFileSize]; // Prefetched File contents
	int PrefetchEnabled; // 0-> open-read-close for each CP/M read. 1-> use prefetch file feature (default)

	// BDOS, BIOS
	uint8 version_id;
	uint8 user_id;
	uint8 default_drive;
    uint16 RecordsToReadAtOnce; 
	uint8 delimiter;
	bool read_only[16];

    // memory banks
    uint8 current_bank, src_bank, dest_bank; 
    uint8 banked_memory[64 * 1024];
    // int common_mem_start_addr  var is defined in WinMain

	uint16 cpm3_return_code;
	
	uint16 dma_addr;
	uint8 find_files[MAX_FIND_FILE][12];
	int find_num, find_idx;
    int SearchFileDirBlock; // dir block used on search; 

	    uint16 ParseFileName(uint16 fn, uint16 fcb, char * sterminators, char * file);
	bool OpenFile(uint16 fcb_addr);
	bool CloseFile(uint16 fcb_addr);
	bool SearchFirstFile(uint16 fcb_addr, uint16 * regHL);
	bool SearchNextFile(uint16 fcb_addr, uint16 * regHL);
	bool RemoveFile(uint16 fcb_addr);
	bool CreateNewFile(uint16 fcb_addr);
	bool RenameFile(uint16 fcb_addr);
	bool TruncateFile(uint16 fcb_addr);
	bool ChangeFileAttributes(uint16 fcb_addr);
	bool CalcFileSize(uint16 fcb_addr);
	bool SequentialRead(uint16 fcb_addr);
	bool SequentialWrite(uint16 fcb_addr);
	bool RandomRead(uint16 fcb_addr);
	bool RandomWrite(uint16 fcb_addr);
	bool GetFullPath1(int drive, uint8* src, char* dest);
	bool IsFilePrefeched(uint16 fcb_addr);
	bool ReadFileFechetched(uint16 fcb_addr, uint16 dma_addr, int record);
	void ClearFilePrefetch();
	int has_xsub_pending_chars();
	int return_xsub_pending_char();

public:
    LOG* log;
	CONSOLE* console;
	Z80* z80;

    CPM(CONSOLE* parent);
	~CPM();
	void SetMode(char cMode, int vMode);
	int GetMode(char cMode);
    char defined_drive_path[16][MAX_PATH];
	
	void Run(char* folder, char* file, 
			  int cpu_max_ips, 
			  int ccp_flag);
	void Terminate();
    int IsRunning();
    int terminate_cpm_requested; 
    void ClearMemory();
	void Initialize(char* cmd, char* smsg, int init_zero_page, int ccp_flag);
	int GetSubmitLine(char* sCmd, char* sParam);
	void InternalCommand(int SubCmd, char* cmd, char* smsg);
    int GetHostFileName(char* CPM_fileName, char* FileName);
	
	// IRQ
	void RequestIRQ(int dev, uint8 vector);
	void CancelRequestIRQ(int dev);
	void DoIRQ();
	void DoRETI();
	
	void WriteMemory(uint16 addr, uint8 data);
	uint8 ReadMemory(uint16 addr);
	void WriteIO(uint8 laddr, uint8 haddr, uint8 data);
	uint8 ReadIO(uint8 laddr, uint8 haddr);
	
	// BDOS/BIOS
	uint16 LoadAndRunCCP();

	bool CCP(uint16 *PC);
	bool BDOS(int num, uint16 *CallerPC, uint16 *regBC, uint16 *regDE, uint16 *regHL, uint8 *regA, uint16 *PC);
	bool BIOS(int num, uint16 *CallerPC, uint16 *regBC, uint16 *regDE, uint16 *regHL, uint8 *regA, uint16 *PC);

	void PrtLog(char* sLog);
    void gsx_log(uint16 CallerPC, uint16 ParamBlockAddr); 
    bool gsx_BDOS(uint16 CallerPC, int RegDE);

	uint16 SetCPMtable(int nTable);
    void SaveRAM(); 
};

