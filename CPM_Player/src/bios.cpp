#include "stdafx.h"

#include "fileio.h"
#include "console.h"
#include "cpm.h"
#include "z80.h"

bool CPM::BIOS(int num, uint16 *CallerPC, uint16 *regBC, uint16 *regDE, uint16 *regHL, uint8 *regA, uint16 *PC)
{
	bool retval = true;
	char string[256];
	BYTE code; 
    cold_boot = 0; 
	
	switch(num)
	{
	case 0:
		// BOOT
		if (log) {
  			sprintf_s(string, "BIOS 0: BOOT (Caller PC=$%04x)\n", *CallerPC);
			log->OutLog(string);
		}
        cold_boot = 1; // signal cold boot requested to end current program
		if (ccp_active == 1) {
			*PC = LoadAndRunCCP();
		} else {
			if (!submit_active) {
				console->PutString("\x0D\x0ATerminated: BIOS call BOOT()\x0D\x0A");
				console->Terminate();
			}
			params.running = false;
			retval = false;
		}
		break;
	case 1:
		// WBOOT
		if (log) {
  			sprintf_s(string, "BIOS 1: WBOOT (Caller PC=$%04x)\n", *CallerPC);
			log->OutLog(string);
		}
		if (ccp_active == 1) {
			*PC = LoadAndRunCCP();
		} else {
			if (!submit_active) {
				console->PutString("\x0D\x0ATerminated: BIOS call WBOOT()\x0D\x0A");
				console->Terminate();
			}
			params.running = false;
			retval = false;
		}
		break;
	case 2:
		// CONSTATUS
        extern int cpu_log; 
        code = (console->GetKeyStatus(0)) ? 0xff : 0;
        *regA = code;
		if (log) if ((*regA == 0xFF) || (cpu_log==1)) {
  			sprintf_s(string, "BIOS 2: CONST Console Status: Char Ready (A=$FF, Caller PC=$%04x)\n", *CallerPC);
			log->OutLog(string);
		}
		break;
	case 3:
		// CONIN
		code = console->GetChar();
		*regA = code;
		if (log) {
  			sprintf_s(string, "BIOS 3: CONIN (A=$%02x, Caller PC=$%04x): ", code, *CallerPC);
			log->OutLog(string);
			log->OutLogOneChar(code);
			log->OutLog("\n");
		}
		break;
	case 4:
		// CONOUT
		code = *regBC & 0xff;
		console->PutChar(code, true);
		if (log) {
  			sprintf_s(string, "BIOS 4: CONOUT (C=$%02x, Caller PC=$%04x): ", code, *CallerPC);
			log->OutLog(string);
			log->OutLogOneChar(code);
			log->OutLog("\n");
		}
        if (code == 0) *regBC = 1; // Epson MFBASIC requires C returns non zero value
		break;
	case 5:
		// LIST
		code = *regBC & 0xff;
        // list sent to physical printer port 
        if ((console) && (console->printer_log)) {
            console->printer_log->OutLogByte(code);
        }
		if (log) {
  			sprintf_s(string, "BIOS 5: LIST (C=$%02x, Caller PC=$%04x): ", code, *CallerPC);
			log->OutLog(string);
			log->OutLogOneChar(code);
			log->OutLog("\n");
		}
		break;
	case 6:
		// AUXOUT
		if (log) log->OutLog("BIOS 6: AUXOUT\n");
		break;
	case 7:
		// AUXIN
		if (log) log->OutLog("BIOS 7: AUXIN\n");
		break;
	case 8: 
		if (log) {
  			sprintf_s(string, "BIOS 8: HOME (disc head to track 0): Not Implemented (Caller PC=$%04x)\n", *CallerPC);
			log->OutLog(string);
		}
		break;
	case 9: 
		int drv;
		drv = *regBC & 255;
		if ((drv < 0) || (drv > 15)) {
			// return invalid drive
			*regHL = 0;
		} if (drive_path[drv][0] == 0) {
			// no drive defined: return invalid drive
			*regHL = 0;
		} else {
			*regHL = SetCPMtable(0); // populate DPH
		}
		if (log) {
			sprintf_s(string, "BIOS 9: SELDSK drive C=%d (%c:): Get addr for DPH (Disk Parameter Header) HL=$%04x\n", drv, drv+'A', *regHL);
			log->OutLog(string);
		}
		break;
	case 10: 
		if (log) {
  			sprintf_s(string, "BIOS 10: SETTRK (Track BC=%d): Not Implemented (Caller PC=$%04x)\n", *regBC, *CallerPC);
			log->OutLog(string);
		}
		break;
	case 11: 
		if (log) {
  			sprintf_s(string, "BIOS 11: SETSEC (Sector BC=%d): Not Implemented (Caller PC=$%04x)\n", *regBC, *CallerPC);
			log->OutLog(string);
		}
		break;
	case 12: 
		if (log) {
  			sprintf_s(string, "BIOS 12: SETDMA (Addr BC=$%04x, Caller PC=$%04x)\n", *regBC, *CallerPC);
			log->OutLog(string);
		}
		dma_addr = *regBC;
		break;
	case 13: 
		if (log) {
  			sprintf_s(string, "BIOS 13: READ: Not Implemented (Caller PC=$%04x)\n", *CallerPC);
			log->OutLog(string);
		}
		*regA =0; //return read ok
		break;
	case 14: 
		if (log) {
  			sprintf_s(string, "BIOS 14: WRITE: Not Implemented (Caller PC=$%04x)\n", *CallerPC);
			log->OutLog(string);
		}
		*regA =0; //return read ok
		break;
	case 15: 
		if (log) {
  			sprintf_s(string, "BIOS 15: LISTST: Printer status (Caller PC=$%04x)\n", *CallerPC);
			log->OutLog(string);
		}
		*regA =255; //allways return printer ready
		break;
	case 16: 
		if (log) {
  			sprintf_s(string, "BIOS 16: SECTRAN Not Implemented (Caller PC=$%04x)\n", *CallerPC);
			log->OutLog(string);
		}
		*regHL = *regBC; //return physical sector = logical sector
		break;
	case 22:
		// CPM/3: DRVTBL -> Drive Parameter Table address
        if (version_id != 0x31) {
            if (log) log->OutLog("BIOS 22: Unknown BIOS call (CP/M 3: DRVTBL)\n");
            break;
        }
		if (log) log->OutLog("BIOS 22: CP/M 3: DRVTBL: Not Implemented\n");
		*regHL = 0xFF00;
		break;
	case 27:
		// CPM/3: SELMEM -> Select current memory bank
        extern int common_mem_start_addr; 
        if (version_id != 0x31) {
            if (log) log->OutLog("BIOS 27: Unknown BIOS call (CP/M 3: SELMEM)\n");
            break;
        }
        // only bank 1 (TPA) and 2 (user bank) are implemented. bank 0 (System) is not
        int bank;
        bank=*regA; 
        if ((bank < 1) || (bank > 2)) {
		    if (log) {
  			    sprintf_s(string, "BIOS 27: SELMEM called with non implemented bank number %d. Ignored (Caller PC=$%04x)\n", bank, *CallerPC);
			    log->OutLog(string);
		    }
        } else {
            // selected a valid bank
            if (current_bank == bank) {
                // selected bank already visible. Do nothing
    		    if (log) {
  	    		    sprintf_s(string, "BIOS 27: SELMEM: select bank number %d (already selected)\n", bank, *CallerPC);
		    	    log->OutLog(string);
		        }
            } else {
                // swap memory banks up to common area to make selected bank visible 
                int b; 
                for (int i=0; i<common_mem_start_addr; i++) {
                    b=memory[i]; memory[i]=banked_memory[i]; banked_memory[i]=b; 
                }
                current_bank = bank;
    		    if (log) {
  	    		    sprintf_s(string, "BIOS 27: SELMEM: select bank number %d\n", bank, *CallerPC);
		    	    log->OutLog(string);
		        }
            }
        }
		break;
	case 28:
		// CPM/3: SETBNK -> Set the bank to be used for the next read/write sector operation
        if (version_id != 0x31) {
            if (log) log->OutLog("BIOS 28: Unknown BIOS call (CP/M 3: SETBNK)\n");
            break;
        }
		if (log) log->OutLog("BIOS 28: CP/M 3: SETBNK: Not Implemented\n");
		break;
	case 29:
		// CPM/3: XMOVE -> Select interbank move source and destination
        if (version_id != 0x31) {
            if (log) log->OutLog("BIOS 29: Unknown BIOS call (CP/M 3: XMOVE)\n");
            break;
        }
        // only bank 1 (TPA) and 2 (user bank) are implemented. bank 0 (System) is not
        // After XMOVE, the next call to MOVE will move data between different memory banks. Call XMOVE with C=source bank and B=destination bank. 
        src_bank=(*regBC) & 255; // C reg = source bank
        dest_bank=(*regBC) >> 8; // B reg = destination bank
	    if (log) {
   		    sprintf_s(string, "BIOS 29: XMOVE: select source bank %d, destination bank %d\n", src_bank, dest_bank, *CallerPC);
       	    log->OutLog(string);
	    }
		break;
	case 25:
		// CPM/3: MOVE -> move mem
        if (version_id != 0x31) {
            if (log) log->OutLog("BIOS 25: Unknown BIOS call (CP/M 3: MOVE)\n");
            break;
        }
        // only bank 1 (TPA) and 2 (user bank) are implemented. bank 0 (System) is not
        // Move BC bytes of memory, from the address in DE to the address in HL (the other 
        // way round from the Z80's LDIR instruction). Should return HL and DE pointing to the first addresses not copied. 
        // If XMOVE is used before this function, data are moved between two memory banks.
        // there is no provision to habdle overlapping source/dest addressed
        if ((src_bank < 1) || (src_bank > 2) || (dest_bank < 1) || (dest_bank > 2) ) {
		    if (log) {
  			    sprintf_s(string, "BIOS 25: MOVE called with non implemented bank src %d, dest %d. Ignored (Caller PC=$%04x)\n", src_bank, dest_bank, *CallerPC);
			    log->OutLog(string);
		    }
        } else {
            // source and dest are valid banks
            int b, src_ad, dest_ad, src_bk, dest_bk, len; 
            len=*regBC; if (len > 128) len = 128; // max move: 128 bytes. 
            src_ad=*regDE;  src_bk=src_bank; 
            dest_ad=*regHL; dest_bk=dest_bank;
            // copy data
            for (int i=0; i<len; i++) {
                if (src_bk == current_bank) b=memory[src_ad]; else b=banked_memory[src_ad];
                if (dest_bk == current_bank) memory[dest_ad]=b; else banked_memory[dest_ad]=b;
                src_ad = (src_ad + 1) & 0xFFFF; src_bk = (src_ad < common_mem_start_addr) ? src_bank:current_bank; 
                dest_ad = (dest_ad + 1) & 0xFFFF; dest_bk = (dest_ad < common_mem_start_addr) ? dest_bank:current_bank; 
            }
   		    if (log) {
  			    sprintf_s(string, "BIOS 25: MOVE from DE=$%04x src bank %d, to HL=$%04x dest bak %d. Move BC=%d bytes (Caller PC=$%04x)\n", 
                    *regDE, src_bank, *regHL, dest_bank, *regBC, *CallerPC);
	    	    log->OutLog(string);
            }
            *regDE=src_ad; 
            *regHL=dest_ad; 
        }
		break;
    default:
		if(log) {
			char string[256];
			sprintf_s(string, "Unknown BIOS Call %d (BC=$%04x, DE=$%04x, HL=$%04x, Caller PC=$%04x)\n", num, *regBC, *regDE, *regHL, *CallerPC);
			log->OutLog(string);
		}
	}
	return retval;
}


uint16 CPM::SetCPMtable(int nTable)
{
	uint16 addr = 0; 
	uint16 DPB = 0xffe0; // create fake DPB at this addr
	uint16 DPH = 0xffd0; // create fake DPH at this addr

	addr = DPH;
	uint16 dirbuf = addr + 16;
	uint16 csv    = addr; // csv does not change -> use same addr
	uint16 alv    = addr; // alv does not change -> use same addr
	uint16 xlt    = addr; // xlt does not change -> use same addr
	memory[addr + 0] = xlt & 255;	// DEFW	xlt	;Address of sector translation table
	memory[addr + 1] = xlt >> 8;
	memory[addr + 2] = 0;			// DEFW	0,0,0	;Used as workspace by CP/M
	memory[addr + 3] = memory[addr + 4] = memory[addr + 5] = memory[addr + 6] = memory[addr + 7] = 0;   
	memory[addr + 8] = dirbuf & 255;  // DEFW dirbuf	;Address of a 128-byte sector buffer; this is 
	memory[addr + 9] = dirbuf >> 8;  
	memory[addr + 10] = DPB & 255;	// DEFW dpb	;Address of the DPB for this drive
	memory[addr + 11] = DPB >> 8;  
	memory[addr + 12] = csv & 255;	// DEFW csv	;Address of the directory checksum vector
	memory[addr + 13] = csv >> 8;  
	memory[addr + 14] = alv & 255;	// DEFW alv	;Address of the allocation vector
	memory[addr + 15] = alv >> 8;  

	addr = DPB;
	memory[addr + 0] = 32;  // DEFW	spt	;Number of 128-byte records per track
	memory[addr + 1] = 0;
	memory[addr + 2] = 3;   // DEFB	bsh	;Block shift. 3 => 1k, 4 => 2k, 5 => 4k....
	memory[addr + 3] = 7;   // DEFB	blm	;Block mask. 7 => 1k, 0Fh => 2k, 1Fh => 4k...
	memory[addr + 4] = 1;   // DEFB	exm	;Extent mask, 
	memory[addr + 5] = 200; // DEFW	dsm	;(no. of blocks on the disc)-1
	memory[addr + 6] = 0;
	memory[addr + 7] = 255; // DEFW	drm	;(no. of directory entries)-1
	memory[addr + 8] = 3;
	memory[addr + 9] = 0xc0;// DEFB	al0	;Directory allocation bitmap, first byte
	memory[addr +10] = 0;   // DEFB	al1	;Directory allocation bitmap, second byte
	memory[addr +11] = 32;  // DEFW	cks	;Checksum vector size, dir entries/4
	memory[addr +12] = 0;
	memory[addr +13] = 2;   // DEFW	off	;Offset, number of reserved tracks
	memory[addr +14] = 0;

	if (nTable == 0) return DPB;
	if (nTable == 1) return DPH;
	if (nTable == 2) return alv;

	return 0;
}
