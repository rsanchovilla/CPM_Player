#include "stdafx.h"

#include "common.h"
#include "z80.h"
#include "cpm.h"

int gsx_log_ret_PC = 0; // return addr on GSX call. used to log the func return

Z80::Z80(CPM* parent) : cpm(parent)
{
    static int init_done=0; 

	AF = BC = DE = HL = IX = IY = 0;
	_I = _R = 0;
	exAF = exBC = exDE = exHL = 0;
	PC = TPA_BASE;
	SP = cpm->CCP_BASE - 1;
	IM = IFF1 = IFF2 = HALT = 0;
	count = 0;
	memory_maped_devices = false; 
    if (init_done==0) {
        init_done=1; 
        logCPU_setup();
    }
}

Z80::~Z80()
{
}

void Z80::Reset(int CCP_BASE_z80)
{
	// CP/M 
	PC = TPA_BASE;
    // SP set to end of TPA 
    SP = memory[6] + 256*memory[7] - 1; 
    // push return addr to CCP
    PUSH(CCP_BASE_z80);
	_I = _R = 0;
	AF = 0xffff;
	IM = IFF1 = IFF2 = HALT = 0;
	BC = DE = HL = IX = IY = 0;

    gsx_log_ret_PC=0; 
}

uint8 Z80::ReadMemory(uint16 addr) 
{
    if (addr > 0xfe00) return cpm->ReadMemory(addr); //YYY

        uint8 b; 
		if (!memory_maped_devices) {
			b = memory[addr];
		} else {
			b = cpm->ReadMemory(addr); 
		}
		return b;
}

void Z80::WriteMemory(uint16 addr, uint8 val) 
{
		if (!memory_maped_devices) {
			memory[addr] = val;
            return;
		}
		cpm->WriteMemory(addr, val);
}

uint16 Z80::ReadMemory16(uint16 addr) 
{
		return ReadMemory(addr) | (ReadMemory(addr + 1) << 8);
}

void Z80::WriteMemory16(uint16 addr, uint16 val) {
	WriteMemory(addr, val & 0xff);
	WriteMemory(addr + 1, val >> 8);
}
uint8 Z80::Fetch() {
	return ReadMemory(PC++);
}
uint16 Z80::Fetch16() {
	uint16 tmp = Fetch();
	return tmp | (Fetch() << 8);
}
uint16 Z80::POP() {
	uint16 res = ReadMemory16(SP);
	SP += 2;
	return res;
}
void Z80::PUSH(uint16 val) {
	SP -= 2;
	WriteMemory16(SP, val);
}

// I/O
uint8 Z80::ReadIO(uint8 laddr, uint8 haddr) {
	return cpm->ReadIO(laddr, haddr);
}
void Z80::WriteIO(uint8 laddr, uint8 haddr, uint8 val) {
	cpm->WriteIO(laddr, haddr, val);
}

// IRQ
void Z80::InterruptFinished() {
	//cpm->DoRETI();
}
void Z80::InterruptEnabled() {
	//cpm->DoIRQ();
}

void Z80::EAX() {
	int res = Fetch();
	EA = IX + ((res < 128) ? res : res - 256);
}
void Z80::EAY() {
	int res = Fetch();
	EA = IY + ((res < 128) ? res : res - 256);
}

void Z80::JP() {
	PC = ReadMemory16(PC);
}
void Z80::JP_COND(uint8 cond) {
	if(cond) {
		PC = ReadMemory16(PC);
	} else {
		PC += 2;
	}
}
void Z80::JR() {
	int res = Fetch();
	PC += (res < 128) ? res : res - 256;
}
void Z80::JR_COND(uint8 cond, uint8 opcode) {
	if(cond) {
		int res = Fetch();
		PC += (res < 128) ? res : res - 256;
		count -= cc_ex[opcode];
	} else {
		PC++;
	}
}
void Z80::CALL() {
	EA = Fetch16();
        if ((EA==5) && (RegC==115)) { // call 0005 with C=115 -> BDOS call to GSX
            // log GSX call
            if (cpm->log) {
                gsx_log_ret_PC=PC; 
                cpm->gsx_log(PC-3, DE); 
            }
        }
	PUSH(PC);
	PC = EA;
}
void Z80::CALL_COND(uint8 cond, uint8 opcode) {
	if(cond) {
		EA = Fetch16();
        if ((EA==5) && (RegC==115)) { // call 0005 with C=115 -> BDOS call to GSX
            // log GSX call
            if (cpm->log) {
                gsx_log_ret_PC=PC; 
                cpm->gsx_log(PC-3, DE); 
            }
        }
		PUSH(PC);
		PC = EA;
		count -= cc_ex[opcode];
	} else {
		PC += 2;
	}
}
void Z80::RET() {
    PC = POP();
    if (gsx_log_ret_PC==PC) {
        if (cpm->log) cpm->gsx_log(0, 0); // return from GSX call to GSX driver
    }
}
void Z80::RET_COND(uint8 cond, uint8 opcode) {
	if(cond) {
		PC = POP();
		count -= cc_ex[opcode];
        if (gsx_log_ret_PC==PC) {
            if (cpm->log) cpm->gsx_log(0, 0); // return from GSX call to GSX driver
        }
    }
}
void Z80::DI() {
	IFF1 = IFF2 = 0;
}
void Z80::EI() {
	IFF1 = 3; 
	IFF2 = 1;
}
void Z80::RST(uint16 addr) {
	PUSH(PC);
	PC = addr;
}
void Z80::JP_REG(uint16 addr) {
	PC = addr;
}
void Z80::RETN() {
	PC = POP();
	IFF1 = IFF2;
	if(IFF1 == 1) InterruptEnabled();
}
void Z80::RETI() {
	PC = POP();
	IFF1 = IFF2;
	InterruptFinished();
}
void Z80::EX_AF() {
	uint16 tmp;
	tmp = AF; AF = exAF; exAF = tmp;
}
void Z80::EX_DE_HL() {
	uint16 tmp;
	tmp = DE; DE = HL; HL = tmp;
}
void Z80::EXX() {
	uint16 tmp;
	tmp = BC; BC = exBC; exBC = tmp;
	tmp = DE; DE = exDE; exDE = tmp;
	tmp = HL; HL = exHL; exHL = tmp;
}
uint16 Z80::EXSP(uint16 reg) {
	uint16 res = ReadMemory16(SP);
	WriteMemory16(SP, reg);
	return res;
}
uint8 Z80::INC(uint8 value) {
	uint8 res = value + 1;
	RegF = (RegF & CF) | SZHV_inc[res];
	return res;
}
uint8 Z80::DEC(uint8 value) {
	uint8 res = value - 1;
	RegF = (RegF & CF) | SZHV_dec[res];
	return res;
}
void Z80::ADD(uint8 value) {
	uint16 val = value;
	uint16 res = RegA + val;
	RegF = SZ[res & 0xff] | ((res >> 8) & CF) | ((RegA ^ res ^ val) & HF) | (((val ^ RegA ^ 0x80) & (val ^ res) & 0x80) >> 5);
	RegA = (uint8)res;
}
void Z80::ADC(uint8 value) {
	uint16 val = value;
	uint16 res = RegA + val + (RegF & CF);
	RegF = SZ[res & 0xff] | ((res >> 8) & CF) | ((RegA ^ res ^ val) & HF) | (((val ^ RegA ^ 0x80) & (val ^ res) & 0x80) >> 5);
	RegA = (uint8)res;
}
void Z80::SUB(uint8 value) {
	uint16 val = value;
	uint16 res = RegA - val;
	RegF = SZ[res & 0xff] | ((res >> 8) & CF) | NF | ((RegA ^ res ^ val) & HF) | (((val ^ RegA) & (RegA ^ res) & 0x80) >> 5);
	RegA = (uint8)res;
}
void Z80::SBC(uint8 value) {
	uint16 val = value;
	uint16 res = RegA - val - (RegF & CF);
	RegF = SZ[res & 0xff] | ((res >> 8) & CF) | NF | ((RegA ^ res ^ val) & HF) | (((val ^ RegA) & (RegA ^ res) & 0x80) >> 5);
	RegA = (uint8)res;
}
uint16 Z80::ADD16(uint16 dreg, uint16 sreg) {
	uint32 res = dreg + sreg;
	RegF = (uint8)((RegF & (SF | ZF | VF)) | (((dreg ^ res ^ sreg) >> 8) & HF) | ((res >> 16) & CF) | ((res >> 8) & (YF | XF)));
	return (uint16)res;
}
void Z80::ADC16(uint16 reg) {
	uint32 res = HL + reg + (RegF & CF);
	RegF = (uint8)((((HL ^ res ^ reg) >> 8) & HF) | ((res >> 16) & CF) | ((res >> 8) & (SF | YF | XF)) | ((res & 0xffff) ? 0 : ZF) | (((reg ^ HL ^ 0x8000) & (reg ^ res) & 0x8000) >> 13));
	HL = (uint16)res;
}
void Z80::SBC16(uint16 reg) {
	uint32 res = HL - reg - (RegF & CF);
	RegF = (uint8)((((HL ^ res ^ reg) >> 8) & HF) | NF | ((res >> 16) & CF) | ((res >> 8) & (SF | YF | XF)) | ((res & 0xffff) ? 0 : ZF) | (((reg ^ HL) & (HL ^ res) &0x8000) >> 13));
	HL = (uint16)res;
}
void Z80::NEG() {
	uint8 value = RegA;
	RegA = 0;
	SUB(value);
}
void Z80::DAA() {
	uint16 idx = RegA;
	if(RegF & CF) idx |= 0x100;
	if(RegF & HF) idx |= 0x200;
	if(RegF & NF) idx |= 0x400;
	AF = DAATable[idx];
}
void Z80::AND(uint8 value) {
	RegA &= value;
	RegF = SZP[RegA] | HF;
}
void Z80::OR(uint8 value) {
	RegA |= value;
	RegF = SZP[RegA];
}
void Z80::XOR(uint8 value) {
	RegA ^= value;
	RegF = SZP[RegA];
}
void Z80::CP(uint8 value) {
	uint16 val = value;
	uint16 res = RegA - val;
	RegF = (SZ[res & 0xff] & (SF | ZF)) | (val & (YF | XF)) | ((res >> 8) & CF) | NF | ((RegA ^ res ^ val) & HF) | ((((val ^ RegA) & (RegA ^ res)) >> 5) & VF);
}
void Z80::RLCA() {
	RegA = (RegA << 1) | (RegA >> 7);
	RegF = (RegF & (SF | ZF | PF)) | (RegA & (YF | XF | CF));
}
void Z80::RRCA() {
	RegF = (RegF & (SF | ZF | PF)) | (RegA & CF);
	RegA = (RegA >> 1) | (RegA << 7);
	RegF |= (RegA & (YF | XF));
}
void Z80::RLA() {
	uint8 res = (RegA << 1) | (RegF & CF);
	uint8 c = (RegA & 0x80) ? CF : 0;
	RegF = (RegF & (SF | ZF | PF)) | c | (res & (YF | XF));
	RegA = res;
}
void Z80::RRA() {
	uint8 res = (RegA >> 1) | (RegF << 7);
	uint8 c = (RegA & 0x01) ? CF : 0;
	RegF = (RegF & (SF | ZF | PF)) | c | (res & (YF | XF));
	RegA = res;
}
void Z80::RRD() {
	uint8 n = ReadMemory(HL);
	WriteMemory(HL, (n >> 4) | (RegA << 4));
	RegA = (RegA & 0xf0) | (n & 0x0f);
	RegF = (RegF & CF) | SZP[RegA];
}
void Z80::RLD() {
	uint8 n = ReadMemory(HL);
	WriteMemory(HL, (n << 4) | (RegA & 0x0f));
	RegA = (RegA & 0xf0) | (n >> 4);
	RegF = (RegF & CF) | SZP[RegA];
}
uint8 Z80::RLC(uint8 value) {
	uint8 res = value;
	uint8 c = (res & 0x80) ? CF : 0;
	res = ((res << 1) | (res >> 7)) & 0xff;
	RegF = SZP[res] | c;
	return res;
}
uint8 Z80::RRC(uint8 value) {
	uint8 res = value;
	uint8 c = (res & 0x01) ? CF : 0;
	res = ((res >> 1) | (res << 7)) & 0xff;
	RegF = SZP[res] | c;
	return res;
}
uint8 Z80::RL(uint8 value) {
	uint8 res = value;
	uint8 c = (res & 0x80) ? CF : 0;
	res = ((res << 1) | (RegF & CF)) & 0xff;
	RegF = SZP[res] | c;
	return res;
}
uint8 Z80::RR(uint8 value) {
	uint8 res = value;
	uint8 c = (res & 0x01) ? CF : 0;
	res = ((res >> 1) | (RegF << 7)) & 0xff;
	RegF = SZP[res] | c;
	return res;
}
uint8 Z80::SLA(uint8 value) {
	uint8 res = value;
	uint8 c = (res & 0x80) ? CF : 0;
	res = (res << 1) & 0xff;
	RegF = SZP[res] | c;
	return res;
}
uint8 Z80::SRA(uint8 value) {
	uint8 res = value;
	uint8 c = (res & 0x01) ? CF : 0;
	res = ((res >> 1) | (res & 0x80)) & 0xff;
	RegF = SZP[res] | c;
	return res;
}
uint8 Z80::SLL(uint8 value) {
	uint8 res = value;
	uint8 c = (res & 0x80) ? CF : 0;
	res = ((res << 1) | 0x01) & 0xff;
	RegF = SZP[res] | c;
	return res;
}
uint8 Z80::SRL(uint8 value) {
	uint8 res = value;
	uint8 c = (res & 0x01) ? CF : 0;
	res = (res >> 1) & 0xff;
	RegF = SZP[res] | c;
	return res;
}
void Z80::BIT(uint8 bit, uint8 reg) {
	RegF = (RegF & CF) | HF | SZ_BIT[reg & (1 << bit)];
}
void Z80::BIT_XY(uint8 bit, uint8 reg) {
	RegF = (RegF & CF) | HF | (SZ_BIT[reg & (1 << bit)] & ~(YF | XF)) | ((EA >> 8) & (YF | XF));
}
uint8 Z80::RES(uint8 bit, uint8 value) {
	return value & ~(1 << bit);
}
uint8 Z80::SET(uint8 bit, uint8 value) {
	return value | (1 << bit);
}
void Z80::LDI() {
	uint8 io = ReadMemory(HL);
	WriteMemory(DE, io);
	RegF &= SF | ZF | CF;
	if((RegA + io) & 0x02) RegF |= YF; // bit 1 -> flag 5
	if((RegA + io) & 0x08) RegF |= XF; // bit 3 -> flag 3
	HL++; DE++; BC--;
	if(BC) RegF |= VF;
}
void Z80::CPI() {
	uint8 val = ReadMemory(HL);
	uint8 res = RegA - val;
	HL++; BC--;
	RegF = (RegF & CF) | (SZ[res] & ~(YF | XF)) | ((RegA ^ val ^ res) & HF) | NF;
	if(RegF & HF) res -= 1;
	if(res & 0x02) RegF |= YF; // bit 1 -> flag 5
	if(res & 0x08) RegF |= XF; // bit 3 -> flag 3
	if(BC) RegF |= VF;
}
void Z80::INI() {
	uint8 io = ReadIO(RegC, RegB);
	RegB--;
	WriteMemory(HL, io);
	HL++;
	RegF = SZ[RegB];
	if(io & SF) RegF |= NF;
	if((((RegC + 1) & 0xff) + io) & 0x100) RegF |= HF | CF;
	if((irep_tmp[RegC & 3][io & 3] ^ breg_tmp[RegB] ^ (RegC >> 2) ^ (io >> 2)) & 1) RegF |= PF;
}
void Z80::OUTI() {
	uint8 io = ReadMemory(HL);
	RegB--;
	WriteIO(RegC, RegB, io);
	HL++;
	RegF = SZ[RegB];
	if(io & SF) RegF |= NF;
	if((((RegC + 1) & 0xff) + io) & 0x100) RegF |= HF | CF;
	if((irep_tmp[RegC & 3][io & 3] ^ breg_tmp[RegB] ^ (RegC >> 2) ^ (io >> 2)) & 1) RegF |= PF;
}
void Z80::LDD() {
	uint8 io = ReadMemory(HL);
	WriteMemory(DE, io);
	RegF &= SF | ZF | CF;
	if((RegA + io) & 0x02) RegF |= YF; // bit 1 -> flag 5
	if((RegA + io) & 0x08) RegF |= XF; // bit 3 -> flag 3
	HL--; DE--; BC--;
	if(BC) RegF |= VF;
}
void Z80::CPD() {
	uint8 val = ReadMemory(HL);
	uint8 res = RegA - val;
	HL--; BC--;
	RegF = (RegF & CF) | (SZ[res] & ~(YF | XF)) | ((RegA ^ val ^ res) & HF) | NF;
	if(RegF & HF) res -= 1;
	if(res & 0x02) RegF |= YF; // bit 1 -> flag 5
	if(res & 0x08) RegF |= XF; // bit 3 -> flag 3
	if(BC) RegF |= VF;
}
void Z80::IND() {
	uint8 io = ReadIO(RegC, RegB);
	RegB--;
	WriteMemory(HL, io);
	HL--;
	RegF = SZ[RegB];
	if(io & SF) RegF |= NF;
	if((((RegC - 1) & 0xff) + io) & 0x100) RegF |= HF | CF;
	if((drep_tmp[RegC & 3][io & 3] ^ breg_tmp[RegB] ^ (RegC >> 2) ^ (io >> 2)) & 1) RegF |= PF;
}
void Z80::OUTD() {
	uint8 io = ReadMemory(HL);
	RegB--;
	WriteIO(RegC, RegB, io);
	HL--;
	RegF = SZ[RegB];
	if(io & SF) RegF |= NF;
	if((((RegC - 1) & 0xff) + io) & 0x100) RegF |= HF | CF;
	if((drep_tmp[RegC & 3][io & 3] ^ breg_tmp[RegB] ^ (RegC >> 2) ^ (io >> 2)) & 1) RegF |= PF;
}
void Z80::LDIR() {
	LDI();
	if(BC) {
		PC -= 2;
		count -= cc_ex[0xb0];
	}
}
void Z80::CPIR() {
	while(1) {
		CPI();
		if(BC && !(RegF & ZF))
			count -= cc_ex[0xb1];
		else
			break;
	}
}
void Z80::INIR() {
	while(1) {
		INI();
		if(RegB)
			count -= cc_ex[0xb2];
		else
			break;
	}
}
void Z80::OTIR() {
	while(1) {
		OUTI();
		if(RegB)
			count -= cc_ex[0xb3];
		else
			break;
	}
}
void Z80::LDDR() {
	while(1) {
		LDD();
		if(BC)
			count -= cc_ex[0xb8];
		else
			break;
	}
}
void Z80::CPDR() {
	while(1) {
		CPD();
		if(BC && !(RegF & ZF))
			count -= cc_ex[0xb9];
		else
			break;
	}
}
void Z80::INDR() {
	while(1) {
		IND();
		if(RegB)
			count -= cc_ex[0xba];
		else
			break;
	}
}
void Z80::OTDR() {
	while(1) {
		OUTD();
		if(RegB)
			count -= cc_ex[0xbb];
		else
			break;
	}
}


void Z80::DoIRQ(uint8 vector)
{
	if(HALT) {
		PC++;
		HALT = 0;
	}
	
	// IRQ
	if(IM == 0) {
		// MODE 0 
		PUSH(PC);
		switch(vector) {
			case 0xc7:		// RST 00H
				PC = 0x0000;
				break;
			case 0xcf:		// RST 08H
				PC = 0x0008;
				break;
			case 0xd7:		// RST 10H
				PC = 0x0010;
				break;
			case 0xdf:		// RST 18H
				PC = 0x0018;
				break;
			case 0xe7:		// RST 20H
				PC = 0x0020;
				break;
			case 0xef:		// RST 28H
				PC = 0x0028;
				break;
			case 0xf7:		// RST 30H
				PC = 0x0030;
				break;
			case 0xff:		// RST 38H
				PC = 0x0038;
				break;
		}
		count -= 7;
	}
	else if(IM == 1) {
		// MODE 1
		PUSH(PC);
		PC = 0x0038;
		count -= 7;
	}
	else {
		// MODE 2
		PUSH(PC);
		PC = ReadMemory16((_I << 8) | vector);
		count -= 7;
	}
	IFF1 = IFF2 = 0;
}

void Z80::DoNMI()
{
	// NMI”­¶
	if(HALT) {
		PC++;
		HALT = 0;
	}
	PUSH(PC);
	PC = 0x0066;
	count -= 5;
	IFF1 = 0;
}

int Z80::Run(int inst_to_exec)
{
	count = 0;
	
	for(;;) {
		if(HALT) break;
		if(IFF1 > 1) {
			if(--IFF1 == 1) InterruptEnabled();
		}
		execute_op();
		if (inst_to_exec < -count) break;
        if (cpm->params.running == FALSE) break;

	}
	return -count;
}

void Z80::execute_op()
{

	OpPC = PC;

    extern int cpu_log; 
    if (cpu_log==1) if (cpm->log) logCPU_Opcode();

	uint8 cmd = Fetch();
	count -= cc_op[cmd];
	_R = (_R & 0x80) | ((_R + 1) & 0x7f);

	switch(cmd)
	{
		case 0x00: // NOP
			break;
		case 0x01: // LD BC, w
			BC = Fetch16();
			break;
		case 0x02: // LD (BC), A
			WriteMemory(BC, RegA);
			break;
		case 0x03: // INC BC
			BC++;
			break;
		case 0x04: // INC B
			RegB = INC(RegB);
			break;
		case 0x05: // DEC B
			RegB = DEC(RegB);
			break;
		case 0x06: // LD B, n
			RegB = Fetch();
			break;
		case 0x07: // RLCA
			RLCA();
			break;
		case 0x08: // EX AF, AF'
			EX_AF();
			break;
		case 0x09: // ADD HL, BC
			HL = ADD16(HL, BC);
			break;
		case 0x0a: // LD A, (BC)
			RegA = ReadMemory(BC);
			break;
		case 0x0b: // DEC BC
			BC--;
			break;
		case 0x0c: // INC C
			RegC = INC(RegC);
			break;
		case 0x0d: // DEC C
			RegC = DEC(RegC);
			break;
		case 0x0e: // LD C, n
			RegC = Fetch();
			break;
		case 0x0f: // RRCA
			RRCA();
			break;
		case 0x10: // DJNZ o
			RegB--;
			JR_COND(RegB, 0x10);
			break;
		case 0x11: // LD DE, w
			DE = Fetch16();
			break;
		case 0x12: // LD (DE), A
			WriteMemory(DE, RegA);
			break;
		case 0x13: // INC DE
			DE++;
			break;
		case 0x14: // INC D
			RegD = INC(RegD);
			break;
		case 0x15: // DEC D
			RegD = DEC(RegD);
			break;
		case 0x16: // LD D, n
			RegD = Fetch();
			break;
		case 0x17: // RLA
			RLA();
			break;
		case 0x18: // JR o
			JR();
			break;
		case 0x19: // ADD HL, DE
			HL = ADD16(HL, DE);
			break;
		case 0x1a: // LD A, (DE)
			RegA = ReadMemory(DE);
			break;
		case 0x1b: // DEC DE
			DE--;
			break;
		case 0x1c: // INC E
			RegE = INC(RegE);
			break;
		case 0x1d: // DEC E
			RegE = DEC(RegE);
			break;
		case 0x1e: // LD E, n
			RegE = Fetch();
			break;
		case 0x1f: // RRA
			RRA();
			break;
		case 0x20: // JR NZ, o
			JR_COND(!(RegF & ZF), 0x20);
			break;
		case 0x21: // LD HL, w
			HL = Fetch16();
			break;
		case 0x22: // LD (w), HL
			EA = Fetch16();
			WriteMemory16(EA, HL);
			break;
		case 0x23: // INC HL
			HL++;
			break;
		case 0x24: // INC H
			RegH = INC(RegH);
			break;
		case 0x25: // DEC H
			RegH = DEC(RegH);
			break;
		case 0x26: // LD H, n
			RegH = Fetch();
			break;
		case 0x27: // DAA
			DAA();
			break;
		case 0x28: // JR Z, o
			JR_COND(RegF & ZF, 0x28);
			break;
		case 0x29: // ADD HL, HL
			HL = ADD16(HL, HL);
			break;
		case 0x2a: // LD HL, (w)
			EA = Fetch16();
			HL = ReadMemory16(EA);
			break;
		case 0x2b: // DEC HL
			HL--;
			break;
		case 0x2c: // INC L
			RegL = INC(RegL);
			break;
		case 0x2d: // DEC L
			RegL = DEC(RegL);
			break;
		case 0x2e: // LD L, n
			RegL = Fetch();
			break;
		case 0x2f: // CPL
			RegA ^= 0xff;
			RegF = (RegF & (SF | ZF | PF | CF)) | HF | NF | (RegA & (YF | XF));
			break;
		case 0x30: // JR NC, o
			JR_COND(!(RegF & CF), 0x30);
			break;
		case 0x31: // LD SP, w
			SP = Fetch16();
			break;
		case 0x32: // LD (w), A
			EA = Fetch16();
			WriteMemory(EA, RegA);
			break;
		case 0x33: // INC SP
			SP++;
			break;
		case 0x34: // INC (HL)
			WriteMemory(HL, INC(ReadMemory(HL)));
			break;
		case 0x35: // DEC (HL)
			WriteMemory(HL, DEC(ReadMemory(HL)));
			break;
		case 0x36: // LD (HL), n
			WriteMemory(HL, Fetch());
			break;
		case 0x37: // SCF
			RegF = (RegF & (SF | ZF | PF)) | CF | (RegA & (YF | XF));
			break;
		case 0x38: // JR C, o
			JR_COND(RegF & CF, 0x38);
			break;
		case 0x39: // ADD HL, SP
			HL = ADD16(HL, SP);
			break;
		case 0x3a: // LD A, (w)
			EA = Fetch16();
			RegA = ReadMemory(EA);
			break;
		case 0x3b: // DEC SP
			SP--;
			break;
		case 0x3c: // INC A
			RegA = INC(RegA);
			break;
		case 0x3d: // DEC A
			RegA = DEC(RegA);
			break;
		case 0x3e: // LD A, n
			RegA = Fetch();
			break;
		case 0x3f: // CCF
			RegF = ((RegF & (SF | ZF | PF | CF)) | ((RegF & CF) << 4) | (RegA & (YF | XF))) ^ CF;
			break;
		case 0x40: // LD B, B
			break;
		case 0x41: // LD B, C
			RegB = RegC;
			break;
		case 0x42: // LD B, D
			RegB = RegD;
			break;
		case 0x43: // LD B, E
			RegB = RegE;
			break;
		case 0x44: // LD B, H
			RegB = RegH;
			break;
		case 0x45: // LD B, L
			RegB = RegL;
			break;
		case 0x46: // LD B, (HL)
			RegB = ReadMemory(HL);
			break;
		case 0x47: // LD B, A
			RegB = RegA;
			break;
		case 0x48: // LD C, B
			RegC = RegB;
			break;
		case 0x49: // LD C, C
			break;
		case 0x4a: // LD C, D
			RegC = RegD;
			break;
		case 0x4b: // LD C, E
			RegC = RegE;
			break;
		case 0x4c: // LD C, H
			RegC = RegH;
			break;
		case 0x4d: // LD C, L
			RegC = RegL;
			break;
		case 0x4e: // LD C, (HL)
			RegC = ReadMemory(HL);
			break;
		case 0x4f: // LD C, A
			RegC = RegA;
			break;
		case 0x50: // LD D, B
			RegD = RegB;
			break;
		case 0x51: // LD D, C
			RegD = RegC;
			break;
		case 0x52: // LD D, D
			break;
		case 0x53: // LD D, E
			RegD = RegE;
			break;
		case 0x54: // LD D, H
			RegD = RegH;
			break;
		case 0x55: // LD D, L
			RegD = RegL;
			break;
		case 0x56: // LD D, (HL)
			RegD = ReadMemory(HL);
			break;
		case 0x57: // LD D, A
			RegD = RegA;
			break;
		case 0x58: // LD E, B
			RegE = RegB;
			break;
		case 0x59: // LD E, C
			RegE = RegC;
			break;
		case 0x5a: // LD E, D
			RegE = RegD;
			break;
		case 0x5b: // LD E, E
			break;
		case 0x5c: // LD E, H
			RegE = RegH;
			break;
		case 0x5d: // LD E, L
			RegE = RegL;
			break;
		case 0x5e: // LD E, (HL)
			RegE = ReadMemory(HL);
			break;
		case 0x5f: // LD E, A
			RegE = RegA;
			break;
		case 0x60: // LD H, B
			RegH = RegB;
			break;
		case 0x61: // LD H, C
			RegH = RegC;
			break;
		case 0x62: // LD H, D
			RegH = RegD;
			break;
		case 0x63: // LD H, E
			RegH = RegE;
			break;
		case 0x64: // LD H, H
			break;
		case 0x65: // LD H, L
			RegH = RegL;
			break;
		case 0x66: // LD H, (HL)
			RegH = ReadMemory(HL);
			break;
		case 0x67: // LD H, A
			RegH = RegA;
			break;
		case 0x68: // LD L, B
			RegL = RegB;
			break;
		case 0x69: // LD L, C
			RegL = RegC;
			break;
		case 0x6a: // LD L, D
			RegL = RegD;
			break;
		case 0x6b: // LD L, E
			RegL = RegE;
			break;
		case 0x6c: // LD L, H
			RegL = RegH;
			break;
		case 0x6d: // LD L, L
			break;
		case 0x6e: // LD L, (HL)
			RegL = ReadMemory(HL);
			break;
		case 0x6f: // LD L, A
			RegL = RegA;
			break;
		case 0x70: // LD (HL), B
			WriteMemory(HL, RegB);
			break;
		case 0x71: // LD (HL), C
			WriteMemory(HL, RegC);
			break;
		case 0x72: // LD (HL), D
			WriteMemory(HL, RegD);
			break;
		case 0x73: // LD (HL), E
			WriteMemory(HL, RegE);
			break;
		case 0x74: // LD (HL), H
			WriteMemory(HL, RegH);
			break;
		case 0x75: // LD (HL), L
			WriteMemory(HL, RegL);
			break;
		case 0x76: // HALT
			PC--;
			HALT = 1;
			break;
		case 0x77: // LD (HL), A
			WriteMemory(HL, RegA);
			break;
		case 0x78: // LD A, B
			RegA = RegB;
			break;
		case 0x79: // LD A, C
			RegA = RegC;
			break;
		case 0x7a: // LD A, D
			RegA = RegD;
			break;
		case 0x7b: // LD A, E
			RegA = RegE;
			break;
		case 0x7c: // LD A, H
			RegA = RegH;
			break;
		case 0x7d: // LD A, L
			RegA = RegL;
			break;
		case 0x7e: // LD A, (HL)
			RegA = ReadMemory(HL);
			break;
		case 0x7f: // LD A, A
			break;
		case 0x80: // ADD A, B
			ADD(RegB);
			break;
		case 0x81: // ADD A, C
			ADD(RegC);
			break;
		case 0x82: // ADD A, D
			ADD(RegD);
			break;
		case 0x83: // ADD A, E
			ADD(RegE);
			break;
		case 0x84: // ADD A, H
			ADD(RegH);
			break;
		case 0x85: // ADD A, L
			ADD(RegL);
			break;
		case 0x86: // ADD A, (HL)
			ADD(ReadMemory(HL));
			break;
		case 0x87: // ADD A, A
			ADD(RegA);
			break;
		case 0x88: // ADC A, B
			ADC(RegB);
			break;
		case 0x89: // ADC A, C
			ADC(RegC);
			break;
		case 0x8a: // ADC A, D
			ADC(RegD);
			break;
		case 0x8b: // ADC A, E
			ADC(RegE);
			break;
		case 0x8c: // ADC A, H
			ADC(RegH);
			break;
		case 0x8d: // ADC A, L
			ADC(RegL);
			break;
		case 0x8e: // ADC A, (HL)
			ADC(ReadMemory(HL));
			break;
		case 0x8f: // ADC A, A
			ADC(RegA);
			break;
		case 0x90: // SUB B
			SUB(RegB);
			break;
		case 0x91: // SUB C
			SUB(RegC);
			break;
		case 0x92: // SUB D
			SUB(RegD);
			break;
		case 0x93: // SUB E
			SUB(RegE);
			break;
		case 0x94: // SUB H
			SUB(RegH);
			break;
		case 0x95: // SUB L
			SUB(RegL);
			break;
		case 0x96: // SUB (HL)
			SUB(ReadMemory(HL));
			break;
		case 0x97: // SUB A
			SUB(RegA);
			break;
		case 0x98: // SBC A, B
			SBC(RegB);
			break;
		case 0x99: // SBC A, C
			SBC(RegC);
			break;
		case 0x9a: // SBC A, D
			SBC(RegD);
			break;
		case 0x9b: // SBC A, E
			SBC(RegE);
			break;
		case 0x9c: // SBC A, H
			SBC(RegH);
			break;
		case 0x9d: // SBC A, L
			SBC(RegL);
			break;
		case 0x9e: // SBC A, (HL)
			SBC(ReadMemory(HL));
			break;
		case 0x9f: // SBC A, A
			SBC(RegA);
			break;
		case 0xa0: // AND B
			AND(RegB);
			break;
		case 0xa1: // AND C
			AND(RegC);
			break;
		case 0xa2: // AND D
			AND(RegD);
			break;
		case 0xa3: // AND E
			AND(RegE);
			break;
		case 0xa4: // AND H
			AND(RegH);
			break;
		case 0xa5: // AND L
			AND(RegL);
			break;
		case 0xa6: // AND (HL)
			AND(ReadMemory(HL));
			break;
		case 0xa7: // AND A
			AND(RegA);
			break;
		case 0xa8: // XOR B
			XOR(RegB);
			break;
		case 0xa9: // XOR C
			XOR(RegC);
			break;
		case 0xaa: // XOR D
			XOR(RegD);
			break;
		case 0xab: // XOR E
			XOR(RegE);
			break;
		case 0xac: // XOR H
			XOR(RegH);
			break;
		case 0xad: // XOR L
			XOR(RegL);
			break;
		case 0xae: // XOR (HL)
			XOR(ReadMemory(HL));
			break;
		case 0xaf: // XOR A
			XOR(RegA);
			break;
		case 0xb0: // OR B
			OR(RegB);
			break;
		case 0xb1: // OR C
			OR(RegC);
			break;
		case 0xb2: // OR D
			OR(RegD);
			break;
		case 0xb3: // OR E
			OR(RegE);
			break;
		case 0xb4: // OR H
			OR(RegH);
			break;
		case 0xb5: // OR L
			OR(RegL);
			break;
		case 0xb6: // OR (HL)
			OR(ReadMemory(HL));
			break;
		case 0xb7: // OR A
			OR(RegA);
			break;
		case 0xb8: // CP B
			CP(RegB);
			break;
		case 0xb9: // CP C
			CP(RegC);
			break;
		case 0xba: // CP D
			CP(RegD);
			break;
		case 0xbb: // CP E
			CP(RegE);
			break;
		case 0xbc: // CP H
			CP(RegH);
			break;
		case 0xbd: // CP L
			CP(RegL);
			break;
		case 0xbe: // CP (HL)
			CP(ReadMemory(HL));
			break;
		case 0xbf: // CP A
			CP(RegA);
			break;
		case 0xc0: // RET NZ
			RET_COND(!(RegF & ZF), 0xc0);
			break;
		case 0xc1: // POP BC
			BC = POP();
			break;
		case 0xc2: // JP NZ, a
			JP_COND(!(RegF & ZF));
			break;
		case 0xc3: // JP a
			JP();
			break;
		case 0xc4: // CALL NZ, a
			CALL_COND(!(RegF & ZF), 0xc4);
			break;
		case 0xc5: // PUSH BC
			PUSH(BC);
			break;
		case 0xc6: // ADD A, n
			ADD(Fetch());
			break;
		case 0xc7: // RST 0
			RST(0x00);
			break;
		case 0xc8: // RET Z
			RET_COND(RegF & ZF, 0xc8);
			break;
		case 0xc9: // RET
			RET();
			break;
		case 0xca: // JP Z, a
			JP_COND(RegF & ZF);
			break;
		case 0xcb: // **** CB xx
			execute_opCB();
			break;
		case 0xcc: // CALL Z, a
			CALL_COND(RegF & ZF, 0xcc);
			break;
		case 0xcd: // CALL a
			CALL();
			break;
		case 0xce: // ADC A, n
			ADC(Fetch());
			break;
		case 0xcf: // RST 1
			RST(0x08);
			break;
		case 0xd0: // RET NC
			RET_COND(!(RegF & CF), 0xd0);
			break;
		case 0xd1: // POP DE
			DE = POP();
			break;
		case 0xd2: // JP NC, a
			JP_COND(!(RegF & CF));
			break;
		case 0xd3: // OUT (n), A
			WriteIO(Fetch(), RegA, RegA);
			break;
		case 0xd4: // CALL NC, a
			CALL_COND(!(RegF & CF), 0xd4);
			break;
		case 0xd5: // PUSH DE
			PUSH(DE);
			break;
		case 0xd6: // SUB n
			SUB(Fetch());
			break;
		case 0xd7: // RST 2
			RST(0x10);
			break;
		case 0xd8: // RET C
			RET_COND(RegF & CF, 0xd8);
			break;
		case 0xd9: // EXX
			EXX();
			break;
		case 0xda: // JP C, a
			JP_COND(RegF & CF);
			break;
		case 0xdb: // IN A, (n)
			RegA = ReadIO(Fetch(), RegA);
			break;
		case 0xdc: // CALL C, a
			CALL_COND(RegF & CF, 0xdc);
			break;
		case 0xdd: // **** DD xx
			execute_opDD();
			break;
		case 0xde: // SBC A, n
			SBC(Fetch());
			break;
		case 0xdf: // RST 3
			RST(0x18);
			break;
		case 0xe0: // RET PO
			RET_COND(!(RegF & PF), 0xe0);
			break;
		case 0xe1: // POP HL
			HL = POP();
			break;
		case 0xe2: // JP PO, a
			JP_COND(!(RegF & PF));
			break;
		case 0xe3: // EX HL, (SP)
			HL = EXSP(HL);
			break;
		case 0xe4: // CALL PO, a
			CALL_COND(!(RegF & PF), 0xe4);
			break;
		case 0xe5: // PUSH HL
			PUSH(HL);
			break;
		case 0xe6: // AND n
			AND(Fetch());
			break;
		case 0xe7: // RST 4
			RST(0x20);
			break;
		case 0xe8: // RET PE
			RET_COND(RegF & PF, 0xe8);
			break;
		case 0xe9: // JP (HL)
			JP_REG(HL);
			break;
		case 0xea: // JP PE, a
			JP_COND(RegF & PF);
			break;
		case 0xeb: // EX DE, HL
			EX_DE_HL();
			break;
		case 0xec: // CALL PE, a
			CALL_COND(RegF & PF, 0xec);
			break;
		case 0xed: // **** ED xx
			execute_opED();
			break;
		case 0xee: // XOR n
			XOR(Fetch());
			break;
		case 0xef: // RST 5
			RST(0x28);
			break;
		case 0xf0: // RET P
			RET_COND(!(RegF & SF), 0xf0);
			break;
		case 0xf1: // POP AF
			AF = POP();
			break;
		case 0xf2: // JP P, a
			JP_COND(!(RegF & SF));
			break;
		case 0xf3: // DI
			DI();
			break;
		case 0xf4: // CALL P, a
			CALL_COND(!(RegF & SF), 0xf4);
			break;
		case 0xf5: // PUSH AF
			PUSH(AF);
			break;
		case 0xf6: // OR n
			OR(Fetch());
			break;
		case 0xf7: // RST 6
			RST(0x30);
			break;
		case 0xf8: // RET M
			RET_COND(RegF & SF, 0xf8);
			break;
		case 0xf9: // LD SP, HL
			SP = HL;
			break;
		case 0xfa: // JP M, a
			JP_COND(RegF & SF);
			break;
		case 0xfb: // EI
			EI();
			break;
		case 0xfc: // CALL M, a
			CALL_COND(RegF & SF, 0xfc);
			break;
		case 0xfd: // **** FD xx
			execute_opFD();
			break;
		case 0xfe: // CP n
			CP(Fetch());
			break;
		case 0xff: // RST 7
			RST(0x38);
			break;
	}
}

void Z80::execute_opCB()
{
	uint8 cmd = Fetch();
	count -= cc_cb[cmd];
	_R = (_R & 0x80) | ((_R + 1) & 0x7f);
	
	switch(cmd)
	{
		case 0x00: // RLC B
			RegB = RLC(RegB);
			break;
		case 0x01: // RLC C
			RegC = RLC(RegC);
			break;
		case 0x02: // RLC D
			RegD = RLC(RegD);
			break;
		case 0x03: // RLC E
			RegE = RLC(RegE);
			break;
		case 0x04: // RLC H
			RegH = RLC(RegH);
			break;
		case 0x05: // RLC L
			RegL = RLC(RegL);
			break;
		case 0x06: // RLC (HL)
			WriteMemory(HL, RLC(ReadMemory(HL)));
			break;
		case 0x07: // RLC A
			RegA = RLC(RegA);
			break;
		case 0x08: // RRC B
			RegB = RRC(RegB);
			break;
		case 0x09: // RRC C
			RegC = RRC(RegC);
			break;
		case 0x0a: // RRC D
			RegD = RRC(RegD);
			break;
		case 0x0b: // RRC E
			RegE = RRC(RegE);
			break;
		case 0x0c: // RRC H
			RegH = RRC(RegH);
			break;
		case 0x0d: // RRC L
			RegL = RRC(RegL);
			break;
		case 0x0e: // RRC (HL)
			WriteMemory(HL, RRC(ReadMemory(HL)));
			break;
		case 0x0f: // RRC A
			RegA = RRC(RegA);
			break;
		case 0x10: // RL B
			RegB = RL(RegB);
			break;
		case 0x11: // RL C
			RegC = RL(RegC);
			break;
		case 0x12: // RL D
			RegD = RL(RegD);
			break;
		case 0x13: // RL E
			RegE = RL(RegE);
			break;
		case 0x14: // RL H
			RegH = RL(RegH);
			break;
		case 0x15: // RL L
			RegL = RL(RegL);
			break;
		case 0x16: // RL (HL)
			WriteMemory(HL, RL(ReadMemory(HL)));
			break;
		case 0x17: // RL A
			RegA = RL(RegA);
			break;
		case 0x18: // RR B
			RegB = RR(RegB);
			break;
		case 0x19: // RR C
			RegC = RR(RegC);
			break;
		case 0x1a: // RR D
			RegD = RR(RegD);
			break;
		case 0x1b: // RR E
			RegE = RR(RegE);
			break;
		case 0x1c: // RR H
			RegH = RR(RegH);
			break;
		case 0x1d: // RR L
			RegL = RR(RegL);
			break;
		case 0x1e: // RR (HL)
			WriteMemory(HL, RR(ReadMemory(HL)));
			break;
		case 0x1f: // RR A
			RegA = RR(RegA);
			break;
		case 0x20: // SLA B
			RegB = SLA(RegB);
			break;
		case 0x21: // SLA C
			RegC = SLA(RegC);
			break;
		case 0x22: // SLA D
			RegD = SLA(RegD);
			break;
		case 0x23: // SLA E
			RegE = SLA(RegE);
			break;
		case 0x24: // SLA H
			RegH = SLA(RegH);
			break;
		case 0x25: // SLA L
			RegL = SLA(RegL);
			break;
		case 0x26: // SLA (HL)
			WriteMemory(HL, SLA(ReadMemory(HL)));
			break;
		case 0x27: // SLA A
			RegA = SLA(RegA);
			break;
		case 0x28: // SRA B
			RegB = SRA(RegB);
			break;
		case 0x29: // SRA C
			RegC = SRA(RegC);
			break;
		case 0x2a: // SRA D
			RegD = SRA(RegD);
			break;
		case 0x2b: // SRA E
			RegE = SRA(RegE);
			break;
		case 0x2c: // SRA H
			RegH = SRA(RegH);
			break;
		case 0x2d: // SRA L
			RegL = SRA(RegL);
			break;
		case 0x2e: // SRA (HL)
			WriteMemory(HL, SRA(ReadMemory(HL)));
			break;
		case 0x2f: // SRA A
			RegA = SRA(RegA);
			break;
		case 0x30: // SLL B
			RegB = SLL(RegB);
			break;
		case 0x31: // SLL C
			RegC = SLL(RegC);
			break;
		case 0x32: // SLL D
			RegD = SLL(RegD);
			break;
		case 0x33: // SLL E
			RegE = SLL(RegE);
			break;
		case 0x34: // SLL H
			RegH = SLL(RegH);
			break;
		case 0x35: // SLL L
			RegL = SLL(RegL);
			break;
		case 0x36: // SLL (HL)
			WriteMemory(HL, SLL(ReadMemory(HL)));
			break;
		case 0x37: // SLL A
			RegA = SLL(RegA);
			break;
		case 0x38: // SRL B
			RegB = SRL(RegB);
			break;
		case 0x39: // SRL C
			RegC = SRL(RegC);
			break;
		case 0x3a: // SRL D
			RegD = SRL(RegD);
			break;
		case 0x3b: // SRL E
			RegE = SRL(RegE);
			break;
		case 0x3c: // SRL H
			RegH = SRL(RegH);
			break;
		case 0x3d: // SRL L
			RegL = SRL(RegL);
			break;
		case 0x3e: // SRL (HL)
			WriteMemory(HL, SRL(ReadMemory(HL)));
			break;
		case 0x3f: // SRL A
			RegA = SRL(RegA);
			break;
		case 0x40: // BIT 0, B
			BIT(0, RegB);
			break;
		case 0x41: // BIT 0, C
			BIT(0, RegC);
			break;
		case 0x42: // BIT 0, D
			BIT(0, RegD);
			break;
		case 0x43: // BIT 0, E
			BIT(0, RegE);
			break;
		case 0x44: // BIT 0, H
			BIT(0, RegH);
			break;
		case 0x45: // BIT 0, L
			BIT(0, RegL);
			break;
		case 0x46: // BIT 0, (HL)
			BIT(0, ReadMemory(HL));
			break;
		case 0x47: // BIT 0, A
			BIT(0, RegA);
			break;
		case 0x48: // BIT 1, B
			BIT(1, RegB);
			break;
		case 0x49: // BIT 1, C
			BIT(1, RegC);
			break;
		case 0x4a: // BIT 1, D
			BIT(1, RegD);
			break;
		case 0x4b: // BIT 1, E
			BIT(1, RegE);
			break;
		case 0x4c: // BIT 1, H
			BIT(1, RegH);
			break;
		case 0x4d: // BIT 1, L
			BIT(1, RegL);
			break;
		case 0x4e: // BIT 1, (HL)
			BIT(1, ReadMemory(HL));
			break;
		case 0x4f: // BIT 1, A
			BIT(1, RegA);
			break;
		case 0x50: // BIT 2, B
			BIT(2, RegB);
			break;
		case 0x51: // BIT 2, C
			BIT(2, RegC);
			break;
		case 0x52: // BIT 2, D
			BIT(2, RegD);
			break;
		case 0x53: // BIT 2, E
			BIT(2, RegE);
			break;
		case 0x54: // BIT 2, H
			BIT(2, RegH);
			break;
		case 0x55: // BIT 2, L
			BIT(2, RegL);
			break;
		case 0x56: // BIT 2, (HL)
			BIT(2, ReadMemory(HL));
			break;
		case 0x57: // BIT 2, A
			BIT(2, RegA);
			break;
		case 0x58: // BIT 3, B
			BIT(3, RegB);
			break;
		case 0x59: // BIT 3, C
			BIT(3, RegC);
			break;
		case 0x5a: // BIT 3, D
			BIT(3, RegD);
			break;
		case 0x5b: // BIT 3, E
			BIT(3, RegE);
			break;
		case 0x5c: // BIT 3, H
			BIT(3, RegH);
			break;
		case 0x5d: // BIT 3, L
			BIT(3, RegL);
			break;
		case 0x5e: // BIT 3, (HL)
			BIT(3, ReadMemory(HL));
			break;
		case 0x5f: // BIT 3, A
			BIT(3, RegA);
			break;
		case 0x60: // BIT 4, B
			BIT(4, RegB);
			break;
		case 0x61: // BIT 4, C
			BIT(4, RegC);
			break;
		case 0x62: // BIT 4, D
			BIT(4, RegD);
			break;
		case 0x63: // BIT 4, E
			BIT(4, RegE);
			break;
		case 0x64: // BIT 4, H
			BIT(4, RegH);
			break;
		case 0x65: // BIT 4, L
			BIT(4, RegL);
			break;
		case 0x66: // BIT 4, (HL)
			BIT(4, ReadMemory(HL));
			break;
		case 0x67: // BIT 4, A
			BIT(4, RegA);
			break;
		case 0x68: // BIT 5, B
			BIT(5, RegB);
			break;
		case 0x69: // BIT 5, C
			BIT(5, RegC);
			break;
		case 0x6a: // BIT 5, D
			BIT(5, RegD);
			break;
		case 0x6b: // BIT 5, E
			BIT(5, RegE);
			break;
		case 0x6c: // BIT 5, H
			BIT(5, RegH);
			break;
		case 0x6d: // BIT 5, L
			BIT(5, RegL);
			break;
		case 0x6e: // BIT 5, (HL)
			BIT(5, ReadMemory(HL));
			break;
		case 0x6f: // BIT 5, A
			BIT(5, RegA);
			break;
		case 0x70: // BIT 6, B
			BIT(6, RegB);
			break;
		case 0x71: // BIT 6, C
			BIT(6, RegC);
			break;
		case 0x72: // BIT 6, D
			BIT(6, RegD);
			break;
		case 0x73: // BIT 6, E
			BIT(6, RegE);
			break;
		case 0x74: // BIT 6, H
			BIT(6, RegH);
			break;
		case 0x75: // BIT 6, L
			BIT(6, RegL);
			break;
		case 0x76: // BIT 6, (HL)
			BIT(6, ReadMemory(HL));
			break;
		case 0x77: // BIT 6, A
			BIT(6, RegA);
			break;
		case 0x78: // BIT 7, B
			BIT(7, RegB);
			break;
		case 0x79: // BIT 7, C
			BIT(7, RegC);
			break;
		case 0x7a: // BIT 7, D
			BIT(7, RegD);
			break;
		case 0x7b: // BIT 7, E
			BIT(7, RegE);
			break;
		case 0x7c: // BIT 7, H
			BIT(7, RegH);
			break;
		case 0x7d: // BIT 7, L
			BIT(7, RegL);
			break;
		case 0x7e: // BIT 7, (HL)
			BIT(7, ReadMemory(HL));
			break;
		case 0x7f: // BIT 7, A
			BIT(7, RegA);
			break;
		case 0x80: // RES 0, B
			RegB = RES(0, RegB);
			break;
		case 0x81: // RES 0, C
			RegC = RES(0, RegC);
			break;
		case 0x82: // RES 0, D
			RegD = RES(0, RegD);
			break;
		case 0x83: // RES 0, E
			RegE = RES(0, RegE);
			break;
		case 0x84: // RES 0, H
			RegH = RES(0, RegH);
			break;
		case 0x85: // RES 0, L
			RegL = RES(0, RegL);
			break;
		case 0x86: // RES 0, (HL)
			WriteMemory(HL, RES(0, ReadMemory(HL)));
			break;
		case 0x87: // RES 0, A
			RegA = RES(0, RegA);
			break;
		case 0x88: // RES 1, B
			RegB = RES(1, RegB);
			break;
		case 0x89: // RES 1, C
			RegC = RES(1, RegC);
			break;
		case 0x8a: // RES 1, D
			RegD = RES(1, RegD);
			break;
		case 0x8b: // RES 1, E
			RegE = RES(1, RegE);
			break;
		case 0x8c: // RES 1, H
			RegH = RES(1, RegH);
			break;
		case 0x8d: // RES 1, L
			RegL = RES(1, RegL);
			break;
		case 0x8e: // RES 1, (HL)
			WriteMemory(HL, RES(1, ReadMemory(HL)));
			break;
		case 0x8f: // RES 1, A
			RegA = RES(1, RegA);
			break;
		case 0x90: // RES 2, B
			RegB = RES(2, RegB);
			break;
		case 0x91: // RES 2, C
			RegC = RES(2, RegC);
			break;
		case 0x92: // RES 2, D
			RegD = RES(2, RegD);
			break;
		case 0x93: // RES 2, E
			RegE = RES(2, RegE);
			break;
		case 0x94: // RES 2, H
			RegH = RES(2, RegH);
			break;
		case 0x95: // RES 2, L
			RegL = RES(2, RegL);
			break;
		case 0x96: // RES 2, (HL)
			WriteMemory(HL, RES(2, ReadMemory(HL)));
			break;
		case 0x97: // RES 2, A
			RegA = RES(2, RegA);
			break;
		case 0x98: // RES 3, B
			RegB = RES(3, RegB);
			break;
		case 0x99: // RES 3, C
			RegC = RES(3, RegC);
			break;
		case 0x9a: // RES 3, D
			RegD = RES(3, RegD);
			break;
		case 0x9b: // RES 3, E
			RegE = RES(3, RegE);
			break;
		case 0x9c: // RES 3, H
			RegH = RES(3, RegH);
			break;
		case 0x9d: // RES 3, L
			RegL = RES(3, RegL);
			break;
		case 0x9e: // RES 3, (HL)
			WriteMemory(HL, RES(3, ReadMemory(HL)));
			break;
		case 0x9f: // RES 3, A
			RegA = RES(3, RegA);
			break;
		case 0xa0: // RES 4, B
			RegB = RES(4, RegB);
			break;
		case 0xa1: // RES 4, C
			RegC = RES(4, RegC);
			break;
		case 0xa2: // RES 4, D
			RegD = RES(4, RegD);
			break;
		case 0xa3: // RES 4, E
			RegE = RES(4, RegE);
			break;
		case 0xa4: // RES 4, H
			RegH = RES(4, RegH);
			break;
		case 0xa5: // RES 4, L
			RegL = RES(4, RegL);
			break;
		case 0xa6: // RES 4, (HL)
			WriteMemory(HL, RES(4, ReadMemory(HL)));
			break;
		case 0xa7: // RES 4, A
			RegA = RES(4, RegA);
			break;
		case 0xa8: // RES 5, B
			RegB = RES(5, RegB);
			break;
		case 0xa9: // RES 5, C
			RegC = RES(5, RegC);
			break;
		case 0xaa: // RES 5, D
			RegD = RES(5, RegD);
			break;
		case 0xab: // RES 5, E
			RegE = RES(5, RegE);
			break;
		case 0xac: // RES 5, H
			RegH = RES(5, RegH);
			break;
		case 0xad: // RES 5, L
			RegL = RES(5, RegL);
			break;
		case 0xae: // RES 5, (HL)
			WriteMemory(HL, RES(5, ReadMemory(HL)));
			break;
		case 0xaf: // RES 5, A
			RegA = RES(5, RegA);
			break;
		case 0xb0: // RES 6, B
			RegB = RES(6, RegB);
			break;
		case 0xb1: // RES 6, C
			RegC = RES(6, RegC);
			break;
		case 0xb2: // RES 6, D
			RegD = RES(6, RegD);
			break;
		case 0xb3: // RES 6, E
			RegE = RES(6, RegE);
			break;
		case 0xb4: // RES 6, H
			RegH = RES(6, RegH);
			break;
		case 0xb5: // RES 6, L
			RegL = RES(6, RegL);
			break;
		case 0xb6: // RES 6, (HL)
			WriteMemory(HL, RES(6, ReadMemory(HL)));
			break;
		case 0xb7: // RES 6, A
			RegA = RES(6, RegA);
			break;
		case 0xb8: // RES 7, B
			RegB = RES(7, RegB);
			break;
		case 0xb9: // RES 7, C
			RegC = RES(7, RegC);
			break;
		case 0xba: // RES 7, D
			RegD = RES(7, RegD);
			break;
		case 0xbb: // RES 7, E
			RegE = RES(7, RegE);
			break;
		case 0xbc: // RES 7, H
			RegH = RES(7, RegH);
			break;
		case 0xbd: // RES 7, L
			RegL = RES(7, RegL);
			break;
		case 0xbe: // RES 7, (HL)
			WriteMemory(HL, RES(7, ReadMemory(HL)));
			break;
		case 0xbf: // RES 7, A
			RegA = RES(7, RegA);
			break;
		case 0xc0: // SET 0, B
			RegB = SET(0, RegB);
			break;
		case 0xc1: // SET 0, C
			RegC = SET(0, RegC);
			break;
		case 0xc2: // SET 0, D
			RegD = SET(0, RegD);
			break;
		case 0xc3: // SET 0, E
			RegE = SET(0, RegE);
			break;
		case 0xc4: // SET 0, H
			RegH = SET(0, RegH);
			break;
		case 0xc5: // SET 0, L
			RegL = SET(0, RegL);
			break;
		case 0xc6: // SET 0, (HL)
			WriteMemory(HL, SET(0, ReadMemory(HL)));
			break;
		case 0xc7: // SET 0, A
			RegA = SET(0, RegA);
			break;
		case 0xc8: // SET 1, B
			RegB = SET(1, RegB);
			break;
		case 0xc9: // SET 1, C
			RegC = SET(1, RegC);
			break;
		case 0xca: // SET 1, D
			RegD = SET(1, RegD);
			break;
		case 0xcb: // SET 1, E
			RegE = SET(1, RegE);
			break;
		case 0xcc: // SET 1, H
			RegH = SET(1, RegH);
			break;
		case 0xcd: // SET 1, L
			RegL = SET(1, RegL);
			break;
		case 0xce: // SET 1, (HL)
			WriteMemory(HL, SET(1, ReadMemory(HL)));
			break;
		case 0xcf: // SET 1, A
			RegA = SET(1, RegA);
			break;
		case 0xd0: // SET 2, B
			RegB = SET(2, RegB);
			break;
		case 0xd1: // SET 2, C
			RegC = SET(2, RegC);
			break;
		case 0xd2: // SET 2, D
			RegD = SET(2, RegD);
			break;
		case 0xd3: // SET 2, E
			RegE = SET(2, RegE);
			break;
		case 0xd4: // SET 2, H
			RegH = SET(2, RegH);
			break;
		case 0xd5: // SET 2, L
			RegL = SET(2, RegL);
			break;
		case 0xd6: // SET 2, (HL)
			WriteMemory(HL, SET(2, ReadMemory(HL)));
			break;
		case 0xd7: // SET 2, A
			RegA = SET(2, RegA);
			break;
		case 0xd8: // SET 3, B
			RegB = SET(3, RegB);
			break;
		case 0xd9: // SET 3, C
			RegC = SET(3, RegC);
			break;
		case 0xda: // SET 3, D
			RegD = SET(3, RegD);
			break;
		case 0xdb: // SET 3, E
			RegE = SET(3, RegE);
			break;
		case 0xdc: // SET 3, H
			RegH = SET(3, RegH);
			break;
		case 0xdd: // SET 3, L
			RegL = SET(3, RegL);
			break;
		case 0xde: // SET 3, (HL)
			WriteMemory(HL, SET(3, ReadMemory(HL)));
			break;
		case 0xdf: // SET 3, A
			RegA = SET(3, RegA);
			break;
		case 0xe0: // SET 4, B
			RegB = SET(4, RegB);
			break;
		case 0xe1: // SET 4, C
			RegC = SET(4, RegC);
			break;
		case 0xe2: // SET 4, D
			RegD = SET(4, RegD);
			break;
		case 0xe3: // SET 4, E
			RegE = SET(4, RegE);
			break;
		case 0xe4: // SET 4, H
			RegH = SET(4, RegH);
			break;
		case 0xe5: // SET 4, L
			RegL = SET(4, RegL);
			break;
		case 0xe6: // SET 4, (HL)
			WriteMemory(HL, SET(4, ReadMemory(HL)));
			break;
		case 0xe7: // SET 4, A
			RegA = SET(4, RegA);
			break;
		case 0xe8: // SET 5, B
			RegB = SET(5, RegB);
			break;
		case 0xe9: // SET 5, C
			RegC = SET(5, RegC);
			break;
		case 0xea: // SET 5, D
			RegD = SET(5, RegD);
			break;
		case 0xeb: // SET 5, E
			RegE = SET(5, RegE);
			break;
		case 0xec: // SET 5, H
			RegH = SET(5, RegH);
			break;
		case 0xed: // SET 5, L
			RegL = SET(5, RegL);
			break;
		case 0xee: // SET 5, (HL)
			WriteMemory(HL, SET(5, ReadMemory(HL)));
			break;
		case 0xef: // SET 5, A
			RegA = SET(5, RegA);
			break;
		case 0xf0: // SET 6, B
			RegB = SET(6, RegB);
			break;
		case 0xf1: // SET 6, C
			RegC = SET(6, RegC);
			break;
		case 0xf2: // SET 6, D
			RegD = SET(6, RegD);
			break;
		case 0xf3: // SET 6, E
			RegE = SET(6, RegE);
			break;
		case 0xf4: // SET 6, H
			RegH = SET(6, RegH);
			break;
		case 0xf5: // SET 6, L
			RegL = SET(6, RegL);
			break;
		case 0xf6: // SET 6, (HL)
			WriteMemory(HL, SET(6, ReadMemory(HL)));
			break;
		case 0xf7: // SET 6, A
			RegA = SET(6, RegA);
			break;
		case 0xf8: // SET 7, B
			RegB = SET(7, RegB);
			break;
		case 0xf9: // SET 7, C
			RegC = SET(7, RegC);
			break;
		case 0xfa: // SET 7, D
			RegD = SET(7, RegD);
			break;
		case 0xfb: // SET 7, E
			RegE = SET(7, RegE);
			break;
		case 0xfc: // SET 7, H
			RegH = SET(7, RegH);
			break;
		case 0xfd: // SET 7, L
			RegL = SET(7, RegL);
			break;
		case 0xfe: // SET 7, (HL)
			WriteMemory(HL, SET(7, ReadMemory(HL)));
			break;
		case 0xff: // SET 7, A
			RegA = SET(7, RegA);
			break;
	}
}

void Z80::execute_opDD()
{
	uint8 cmd = Fetch();
	count -= cc_xy[cmd];
	_R = (_R & 0x80) | ((_R + 1) & 0x7f);
	
	switch(cmd)
	{
		case 0x09: // ADD IX, BC
			IX = ADD16(IX, BC);
			break;
		case 0x19: // ADD IX, DE
			IX = ADD16(IX, DE);
			break;
		case 0x21: // LD IX, w
			IX = Fetch16();
			break;
		case 0x22: // LD (w), IX
			EA = Fetch16();
			WriteMemory16(EA, IX);
			break;
		case 0x23: // INC IX
			IX++;
			break;
		case 0x24: // INC HX
			RegXH = INC(RegXH);
			break;
		case 0x25: // DEC HX
			RegXH = DEC(RegXH);
			break;
		case 0x26: // LD HX, n
			RegXH = Fetch();
			break;
		case 0x29: // ADD IX, IX
			IX = ADD16(IX, IX);
			break;
		case 0x2a: // LD IX, (w)
			EA = Fetch16();
			IX = ReadMemory16(EA);
			break;
		case 0x2b: // DEC IX
			IX--;
			break;
		case 0x2c: // INC LX
			RegXL = INC(RegXL);
			break;
		case 0x2d: // DEC LX
			RegXL = DEC(RegXL);
			break;
		case 0x2e: // LD LX, n
			RegXL = Fetch();
			break;
		case 0x34: // INC (IX+o)
			EAX();
			WriteMemory(EA, INC(ReadMemory(EA)));
			break;
		case 0x35: // DEC (IX+o)
			EAX();
			WriteMemory(EA, DEC(ReadMemory(EA)));
			break;
		case 0x36: // LD (IX+o), n
			EAX();
			WriteMemory(EA, Fetch());
			break;
		case 0x39: // ADD IX, SP
			IX = ADD16(IX, SP);
			break;
		case 0x44: // LD B, HX
			RegB = RegXH;
			break;
		case 0x45: // LD B, LX
			RegB = RegXL;
			break;
		case 0x46: // LD B, (IX+o)
			EAX();
			RegB = ReadMemory(EA);
			break;
		case 0x4c: // LD C, HX
			RegC = RegXH;
			break;
		case 0x4d: // LD C, LX
			RegC = RegXL;
			break;
		case 0x4e: // LD C, (IX+o)
			EAX();
			RegC = ReadMemory(EA);
			break;
		case 0x54: // LD D, HX
			RegD = RegXH;
			break;
		case 0x55: // LD D, LX
			RegD = RegXL;
			break;
		case 0x56: // LD D, (IX+o)
			EAX();
			RegD = ReadMemory(EA);
			break;
		case 0x5c: // LD E, HX
			RegE = RegXH;
			break;
		case 0x5d: // LD E, LX
			RegE = RegXL;
			break;
		case 0x5e: // LD E, (IX+o)
			EAX();
			RegE = ReadMemory(EA);
			break;
		case 0x60: // LD HX, B
			RegXH = RegB;
			break;
		case 0x61: // LD HX, C
			RegXH = RegC;
			break;
		case 0x62: // LD HX, D
			RegXH = RegD;
			break;
		case 0x63: // LD HX, E
			RegXH = RegE;
			break;
		case 0x64: // LD HX, HX
			break;
		case 0x65: // LD HX, LX
			RegXH = RegXL;
			break;
		case 0x66: // LD H, (IX+o)
			EAX();
			RegH = ReadMemory(EA);
			break;
		case 0x67: // LD HX, A
			RegXH = RegA;
			break;
		case 0x68: // LD LX, B
			RegXL = RegB;
			break;
		case 0x69: // LD LX, C
			RegXL = RegC;
			break;
		case 0x6a: // LD LX, D
			RegXL = RegD;
			break;
		case 0x6b: // LD LX, E
			RegXL = RegE;
			break;
		case 0x6c: // LD LX, HX
			RegXL = RegXH;
			break;
		case 0x6d: // LD LX, LX
			break;
		case 0x6e: // LD L, (IX+o)
			EAX();
			RegL = ReadMemory(EA);
			break;
		case 0x6f: // LD LX, A
			RegXL = RegA;
			break;
		case 0x70: // LD (IX+o), B
			EAX();
			WriteMemory(EA, RegB);
			break;
		case 0x71: // LD (IX+o), C
			EAX();
			WriteMemory(EA, RegC);
			break;
		case 0x72: // LD (IX+o), D
			EAX();
			WriteMemory(EA, RegD);
			break;
		case 0x73: // LD (IX+o), E
			EAX();
			WriteMemory(EA, RegE);
			break;
		case 0x74: // LD (IX+o), H
			EAX();
			WriteMemory(EA, RegH);
			break;
		case 0x75: // LD (IX+o), L
			EAX();
			WriteMemory(EA, RegL);
			break;
		case 0x77: // LD (IX+o), A
			EAX();
			WriteMemory(EA, RegA);
			break;
		case 0x7c: // LD A, HX
			RegA = RegXH;
			break;
		case 0x7d: // LD A, LX
			RegA = RegXL;
			break;
		case 0x7e: // LD A, (IX+o)
			EAX();
			RegA = ReadMemory(EA);
			break;
		case 0x84: // ADD A, HX
			ADD(RegXH);
			break;
		case 0x85: // ADD A, LX
			ADD(RegXL);
			break;
		case 0x86: // ADD A, (IX+o)
			EAX();
			ADD(ReadMemory(EA));
			break;
		case 0x8c: // ADC A, HX
			ADC(RegXH);
			break;
		case 0x8d: // ADC A, LX
			ADC(RegXL);
			break;
		case 0x8e: // ADC A, (IX+o)
			EAX();
			ADC(ReadMemory(EA));
			break;
		case 0x94: // SUB HX
			SUB(RegXH);
			break;
		case 0x95: // SUB LX
			SUB(RegXL);
			break;
		case 0x96: // SUB (IX+o)
			EAX();
			SUB(ReadMemory(EA));
			break;
		case 0x9c: // SBC A, HX
			SBC(RegXH);
			break;
		case 0x9d: // SBC A, LX
			SBC(RegXL);
			break;
		case 0x9e: // SBC A, (IX+o)
			EAX();
			SBC(ReadMemory(EA));
			break;
		case 0xa4: // AND HX
			AND(RegXH);
			break;
		case 0xa5: // AND LX
			AND(RegXL);
			break;
		case 0xa6: // AND (IX+o)
			EAX();
			AND(ReadMemory(EA));
			break;
		case 0xac: // XOR HX
			XOR(RegXH);
			break;
		case 0xad: // XOR LX
			XOR(RegXL);
			break;
		case 0xae: // XOR (IX+o)
			EAX();
			XOR(ReadMemory(EA));
			break;
		case 0xb4: // OR HX
			OR(RegXH);
			break;
		case 0xb5: // OR LX
			OR(RegXL);
			break;
		case 0xb6: // OR (IX+o)
			EAX();
			OR(ReadMemory(EA));
			break;
		case 0xbc: // CP HX
			CP(RegXH);
			break;
		case 0xbd: // CP LX
			CP(RegXL);
			break;
		case 0xbe: // CP (IX+o)
			EAX();
			CP(ReadMemory(EA));
			break;
		case 0xcb: // ** DD CB xx
			EAX();
			execute_opXY();
			break;
		case 0xe1: // POP IX
			IX = POP();
			break;
		case 0xe3: // EX (SP), IX
			IX = EXSP(IX);
			break;
		case 0xe5: // PUSH IX
			PUSH(IX);
			break;
		case 0xe9: // JP (IX)
			JP_REG(IX);
			break;
		case 0xf9: // LD SP, IX
			SP = IX;
			break;
	}
}

void Z80::execute_opED()
{
	uint8 cmd = Fetch();
	count -= cc_ed[cmd];
	_R = (_R & 0x80) | ((_R + 1) & 0x7f);
	
	switch(cmd)
	{
		case 0x40: // IN B, (C)
			RegB = ReadIO(RegC, RegB);
			RegF = (RegF & CF) | SZP[RegB];
			break;
		case 0x41: // OUT (C), B
			WriteIO(RegC, RegB, RegB);
			break;
		case 0x42: // SBC HL, BC
			SBC16(BC);
			break;
		case 0x43: // LD (w), BC
			EA = Fetch16();
			WriteMemory16(EA, BC);
			break;
		case 0x44: // NEG
			NEG();
			break;
		case 0x45: // RETN;
			RETN();
			break;
		case 0x46: // IM 0
			IM = 0;
			break;
		case 0x47: // LD I, A
			_I = RegA;
			break;
		case 0x48: // IN C, (C)
			RegC = ReadIO(RegC, RegB);
			RegF = (RegF & CF) | SZP[RegC];
			break;
		case 0x49: // OUT (C), C
			WriteIO(RegC, RegB, RegC);
			break;
		case 0x4a: // ADC HL, BC
			ADC16(BC);
			break;
		case 0x4b: // LD BC, (w)
			EA = Fetch16();
			BC = ReadMemory16(EA);
			break;
		case 0x4c: // NEG
			NEG();
			break;
		case 0x4d: // RETI
			RETI();
			break;
		case 0x4e: // IM 0
			IM = 0;
			break;
		case 0x4f: // LD R, A
			_R = RegA;
			break;
		case 0x50: // IN D, (C)
			RegD = ReadIO(RegC, RegB);
			RegF = (RegF & CF) | SZP[RegD];
			break;
		case 0x51: // OUT (C), D
			WriteIO(RegC, RegB, RegD);
			break;
		case 0x52: // SBC HL, DE
			SBC16(DE);
			break;
		case 0x53: // LD (w), DE
			EA = Fetch16();
			WriteMemory16(EA, DE);
			break;
		case 0x54: // NEG
			NEG();
			break;
		case 0x55: // RETN;
			RETN();
			break;
		case 0x56: // IM 1
			IM = 1;
			break;
		case 0x57: // LD A, I
			RegA = _I;
			RegF = (RegF & CF) | SZ[RegA] | (IFF2 << 2);
			break;
		case 0x58: // IN E, (C)
			RegE = ReadIO(RegC, RegB);
			RegF = (RegF & CF) | SZP[RegE];
			break;
		case 0x59: // OUT (C), E
			WriteIO(RegC, RegB, RegE);
			break;
		case 0x5a: // ADC HL, DE
			ADC16(DE);
			break;
		case 0x5b: // LD DE, (w)
			EA = Fetch16();
			DE = ReadMemory16(EA);
			break;
		case 0x5c: // NEG
			NEG();
			break;
		case 0x5d: // RETI
			RETI();
			break;
		case 0x5e: // IM 2
			IM = 2;
			break;
		case 0x5f: // LD A, R
			RegA = _R;
			RegF = (RegF & CF) | SZ[RegA] | (IFF2 << 2);
			break;
		case 0x60: // IN H, (C)
			RegH = ReadIO(RegC, RegB);
			RegF = (RegF & CF) | SZP[RegH];
			break;
		case 0x61: // OUT (C), H
			WriteIO(RegC, RegB, RegH);
			break;
		case 0x62: // SBC HL, HL
			SBC16(HL);
			break;
		case 0x63: // LD (w), HL
			EA = Fetch16();
			WriteMemory16(EA, HL);
			break;
		case 0x64: // NEG
			NEG();
			break;
		case 0x65: // RETN;
			RETN();
			break;
		case 0x66: // IM 0
			IM = 0;
			break;
		case 0x67: // RRD (HL)
			RRD();
			break;
		case 0x68: // IN L, (C)
			RegL = ReadIO(RegC, RegB);
			RegF = (RegF & CF) | SZP[RegL];
			break;
		case 0x69: // OUT (C), L
			WriteIO(RegC, RegB, RegL);
			break;
		case 0x6a: // ADC HL, HL
			ADC16(HL);
			break;
		case 0x6b: // LD HL, (w)
			EA = Fetch16();
			HL = ReadMemory16(EA);
			break;
		case 0x6c: // NEG
			NEG();
			break;
		case 0x6d: // RETI
			RETI();
			break;
		case 0x6e: // IM 0
			IM = 0;
			break;
		case 0x6f: // RLD (HL)
			RLD();
			break;
		case 0x70: // IN 0, (C)
			RegF = (RegF & CF) | SZP[ReadIO(RegC, RegB)];
			break;
		case 0x71: // OUT (C), 0
			WriteIO(RegC, RegB, 0);
			break;
		case 0x72: // SBC HL, SP
			SBC16(SP);
			break;
		case 0x73: // LD (w), SP
			EA = Fetch16();
			WriteMemory16(EA, SP);
			break;
		case 0x74: // NEG
			NEG();
			break;
		case 0x75: // RETN;
			RETN();
			break;
		case 0x76: // IM 1
			IM = 1;
			break;
		case 0x78: // IN E, (C)
			RegE = ReadIO(RegC, RegB);
			RegF = (RegF & CF) | SZP[RegA];
			break;
		case 0x79: // OUT (C), E
			WriteIO(RegC, RegB, RegE);
			break;
		case 0x7a: // ADC HL, SP
			ADC16(SP);
			break;
		case 0x7b: // LD SP, (w)
			EA = ReadMemory16(PC);
			PC += 2;
			SP = ReadMemory16(EA);
			break;
		case 0x7c: // NEG
			NEG();
			break;
		case 0x7d: // RETI
			RETI();
			break;
		case 0x7e: // IM 2
			IM = 2;
			break;
		case 0xa0: // LDI
			LDI();
			break;
		case 0xa1: // CPI
			CPI();
			break;
		case 0xa2: // INI
			INI();
			break;
		case 0xa3: // OUTI
			OUTI();
			break;
		case 0xa8: // LDD
			LDD();
			break;
		case 0xa9: // CPD
			CPD();
			break;
		case 0xaa: // IND
			IND();
			break;
		case 0xab: // OUTD
			OUTD();
			break;
		case 0xb0: // LDIR
			LDIR();
			break;
		case 0xb1: // CPIR
			CPIR();
			break;
		case 0xb2: // INIR
			INIR();
			break;
		case 0xb3: // OTIR
			OTIR();
			break;
		case 0xb8: // LDDR
			LDDR();
			break;
		case 0xb9: // CPDR
			CPDR();
			break;
		case 0xba: // INDR
			INDR();
			break;
		case 0xbb: // OTDR
			OTDR();
			break;
		// special instr to simulate calling CCP BDOS BIOS GSX
		case 0xfc: // Trap: EDFC instr -> call to BDOS func 115 = GSX function
            uint16 CallerPC, retad;
            retad=memory[SP] + 256*memory[(SP+1) & 0xFFFF];
            CallerPC=(retad-3) & 0xFFFF; // call 0005
			if (!cpm->gsx_BDOS(CallerPC, DE)) {
                // pause 
                count=-1000000; 
            }
            break;
        case 0xfd: // return to CCP
			if(!cpm->CCP(&PC)) HALT = 1;
			break;		
		case 0xfe: // Trap: EDFE instr -> call to BDOS
            retad=memory[SP] + 256*memory[(SP+1) & 0xFFFF];
            CallerPC=(retad-3) & 0xFFFF; // call 0005
			if(!cpm->BDOS(RegC, &CallerPC, &BC, &DE, &HL, &RegA, &PC)) HALT = 1;
			break;		
		case 0xff: // Trap: EDFF instr -> call to BIOS
			int biosfunc = Fetch();
            retad=memory[SP] + 256*memory[SP+1];
            if ((retad > 3) && ((memory[retad-3]==0xCD) || (memory[retad-3]==0xC9))) {
                CallerPC=retad-3;  // call bios or jmp bios
            }
			if(!cpm->BIOS(biosfunc, &OpPC, &BC, &DE, &HL, &RegA, &PC)) HALT = 1;
			break;		
	}
}

void Z80::execute_opFD()
{
	uint8 cmd = Fetch();
	count -= cc_xy[cmd];
	_R = (_R & 0x80) | ((_R + 1) & 0x7f);
	
	switch(cmd)
	{
		case 0x09: // ADD IY, BC
			IY = ADD16(IY, BC);
			break;
		case 0x19: // ADD IY, DE
			IY = ADD16(IY, DE);
			break;
		case 0x21: // LD IY, w
			IY = ReadMemory16(PC);
			PC += 2;
			break;
		case 0x22: // LD (w), IY
			EA = ReadMemory16(PC);
			PC += 2;
			WriteMemory16(EA, IY);
			break;
		case 0x23: // INC IY
			IY++;
			break;
		case 0x24: // INC HY
			RegYH = INC(RegYH);
			break;
		case 0x25: // DEC HY
			RegYH = DEC(RegYH);
			break;
		case 0x26: // LD HY, n
			RegYH = Fetch();
			break;
		case 0x29: // ADD IY, IY
			IY = ADD16(IY, IY);
			break;
		case 0x2a: // LD IY, (w)
			EA = ReadMemory16(PC);
			PC += 2;
			IY = ReadMemory16(EA);
			break;
		case 0x2b: // DEC IY
			IY--;
			break;
		case 0x2c: // INC LY
			RegYL = INC(RegYL);
			break;
		case 0x2d: // DEC LY
			RegYL = DEC(RegYL);
			break;
		case 0x2e: // LD LY, n
			RegYL = Fetch();
			break;
		case 0x34: // INC (IY+o)
			EAY();
			WriteMemory(EA, INC(ReadMemory(EA)));
			break;
		case 0x35: // DEC (IY+o)
			EAY();
			WriteMemory(EA, DEC(ReadMemory(EA)));
			break;
		case 0x36: // LD (IY+o), n
			EAY();
			WriteMemory(EA, Fetch());
			break;
		case 0x39: // ADD IY, SP
			IY = ADD16(IY, SP);
			break;
		case 0x44: // LD B, HY
			RegB = RegYH;
			break;
		case 0x45: // LD B, LY
			RegB = RegYL;
			break;
		case 0x46: // LD B, (IY+o)
			EAY();
			RegB = ReadMemory(EA);
			break;
		case 0x4c: // LD C, HY
			RegC = RegYH;
			break;
		case 0x4d: // LD C, LY
			RegC = RegYL;
			break;
		case 0x4e: // LD C, (IY+o)
			EAY();
			RegC = ReadMemory(EA);
			break;
		case 0x54: // LD D, HY
			RegD = RegYH;
			break;
		case 0x55: // LD D, LY
			RegD = RegYL;
			break;
		case 0x56: // LD D, (IY+o)
			EAY();
			RegD = ReadMemory(EA);
			break;
		case 0x5c: // LD E, HY
			RegE = RegYH;
			break;
		case 0x5d: // LD E, LY
			RegE = RegYL;
			break;
		case 0x5e: // LD E, (IY+o)
			EAY();
			RegE = ReadMemory(EA);
			break;
		case 0x60: // LD HY, B
			RegYH = RegB;
			break;
		case 0x61: // LD HY, C
			RegYH = RegC;
			break;
		case 0x62: // LD HY, D
			RegYH = RegD;
			break;
		case 0x63: // LD HY, E
			RegYH = RegE;
			break;
		case 0x64: // LD HY, HY
			break;
		case 0x65: // LD HY, LY
			RegYH = RegYL;
			break;
		case 0x66: // LD H, (IY+o)
			EAY();
			RegH = ReadMemory(EA);
			break;
		case 0x67: // LD HY, A
			RegYH = RegA;
			break;
		case 0x68: // LD LY, B
			RegYL = RegB;
			break;
		case 0x69: // LD LY, C
			RegYL = RegC;
			break;
		case 0x6a: // LD LY, D
			RegYL = RegD;
			break;
		case 0x6b: // LD LY, E
			RegYL = RegE;
			break;
		case 0x6c: // LD LY, HY
			RegYL = RegYH;
			break;
		case 0x6d: // LD LY, LY
			break;
		case 0x6e: // LD L, (IY+o)
			EAY();
			RegL = ReadMemory(EA);
			break;
		case 0x6f: // LD LY, A
			RegYL = RegA;
			break;
		case 0x70: // LD (IY+o), B
			EAY();
			WriteMemory(EA, RegB);
			break;
		case 0x71: // LD (IY+o), C
			EAY();
			WriteMemory(EA, RegC);
			break;
		case 0x72: // LD (IY+o), D
			EAY();
			WriteMemory(EA, RegD);
			break;
		case 0x73: // LD (IY+o), E
			EAY();
			WriteMemory(EA, RegE);
			break;
		case 0x74: // LD (IY+o), H
			EAY();
			WriteMemory(EA, RegH);
			break;
		case 0x75: // LD (IY+o), L
			EAY();
			WriteMemory(EA, RegL);
			break;
		case 0x77: // LD (IY+o), A
			EAY();
			WriteMemory(EA, RegA);
			break;
		case 0x7c: // LD A, HY
			RegA = RegYH;
			break;
		case 0x7d: // LD A, LY
			RegA = RegYL;
			break;
		case 0x7e: // LD A, (IY+o)
			EAY();
			RegA = ReadMemory(EA);
			break;
		case 0x84: // ADD A, HY
			ADD(RegYH);
			break;
		case 0x85: // ADD A, LY
			ADD(RegYL);
			break;
		case 0x86: // ADD A, (IY+o)
			EAY();
			ADD(ReadMemory(EA));
			break;
		case 0x8c: // ADC A, HY
			ADC(RegYH);
			break;
		case 0x8d: // ADC A, LY
			ADC(RegYL);
			break;
		case 0x8e: // ADC A, (IY+o)
			EAY();
			ADC(ReadMemory(EA));
			break;
		case 0x94: // SUB HY
			SUB(RegYH);
			break;
		case 0x95: // SUB LY
			SUB(RegYL);
			break;
		case 0x96: // SUB (IY+o)
			EAY();
			SUB(ReadMemory(EA));
			break;
		case 0x9c: // SBC A, HY
			SBC(RegYH);
			break;
		case 0x9d: // SBC A, LY
			SBC(RegYL);
			break;
		case 0x9e: // SBC A, (IY+o)
			EAY();
			SBC(ReadMemory(EA));
			break;
		case 0xa4: // AND HY
			AND(RegYH);
			break;
		case 0xa5: // AND LY
			AND(RegYL);
			break;
		case 0xa6: // AND (IY+o)
			EAY();
			AND(ReadMemory(EA));
			break;
		case 0xac: // XOR HY
			XOR(RegYH);
			break;
		case 0xad: // XOR LY
			XOR(RegYL);
			break;
		case 0xae: // XOR (IY+o)
			EAY();
			XOR(ReadMemory(EA));
			break;
		case 0xb4: // OR HY
			OR(RegYH);
			break;
		case 0xb5: // OR LY
			OR(RegYL);
			break;
		case 0xb6: // OR (IY+o)
			EAY();
			OR(ReadMemory(EA));
			break;
		case 0xbc: // CP HY
			CP(RegYH);
			break;
		case 0xbd: // CP LY
			CP(RegYL);
			break;
		case 0xbe: // CP (IY+o)
			EAY();
			CP(ReadMemory(EA));
			break;
		case 0xcb: // ** FD CB xx
			EAY();
			execute_opXY();
			break;
		case 0xe1: // POP IY
			IY = POP();
			break;
		case 0xe3: // EX (SP), IY
			IY = EXSP(IY);
			break;
		case 0xe5: // PUSH IY
			PUSH(IY);
			break;
		case 0xe9: // JP (IY)
			JP_REG(IY);
			break;
		case 0xf9: // LD SP, IY
			SP = IY;
			break;
	}
}

void Z80::execute_opXY()
{
	uint8 cmd = Fetch();
	count -= cc_xy[cmd];
	_R = (_R & 0x80) | ((_R + 1) & 0x7f);
	
	switch(cmd)
	{
		case 0x00: // RLC B=(XY+o)
			RegB = RLC(ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0x01: // RLC C=(XY+o)
			RegC = RLC(ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0x02: // RLC D=(XY+o)
			RegD = RLC(ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0x03: // RLC E=(XY+o)
			RegE = RLC(ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0x04: // RLC H=(XY+o)
			RegH = RLC(ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0x05: // RLC L=(XY+o)
			RegL = RLC(ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0x06: // RLC (XY+o)
			WriteMemory(EA, RLC(ReadMemory(EA)));
			break;
		case 0x07: // RLC A=(XY+o)
			RegA = RLC(ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0x08: // RRC B=(XY+o)
			RegB = RRC(ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0x09: // RRC C=(XY+o)
			RegC = RRC(ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0x0a: // RRC D=(XY+o)
			RegD = RRC(ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0x0b: // RRC E=(XY+o)
			RegE = RRC(ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0x0c: // RRC H=(XY+o)
			RegH = RRC(ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0x0d: // RRC L=(XY+o)
			RegL = RRC(ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0x0e: // RRC (XY+o)
			WriteMemory(EA, RRC(ReadMemory(EA)));
			break;
		case 0x0f: // RRC A=(XY+o)
			RegA = RRC(ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0x10: // RL B=(XY+o)
			RegB = RL(ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0x11: // RL C=(XY+o)
			RegC = RL(ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0x12: // RL D=(XY+o)
			RegD = RL(ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0x13: // RL E=(XY+o)
			RegE = RL(ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0x14: // RL H=(XY+o)
			RegH = RL(ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0x15: // RL L=(XY+o)
			RegL = RL(ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0x16: // RL (XY+o)
			WriteMemory(EA, RL(ReadMemory(EA)));
			break;
		case 0x17: // RL A=(XY+o)
			RegA = RL(ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0x18: // RR B=(XY+o)
			RegB = RR(ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0x19: // RR C=(XY+o)
			RegC = RR(ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0x1a: // RR D=(XY+o)
			RegD = RR(ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0x1b: // RR E=(XY+o)
			RegE = RR(ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0x1c: // RR H=(XY+o)
			RegH = RR(ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0x1d: // RR L=(XY+o)
			RegL = RR(ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0x1e: // RR (XY+o)
			WriteMemory(EA, RR(ReadMemory(EA)));
			break;
		case 0x1f: // RR A=(XY+o)
			RegA = RR(ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0x20: // SLA B=(XY+o)
			RegB = SLA(ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0x21: // SLA C=(XY+o)
			RegC = SLA(ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0x22: // SLA D=(XY+o)
			RegD = SLA(ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0x23: // SLA E=(XY+o)
			RegE = SLA(ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0x24: // SLA H=(XY+o)
			RegH = SLA(ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0x25: // SLA L=(XY+o)
			RegL = SLA(ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0x26: // SLA (XY+o)
			WriteMemory(EA, SLA(ReadMemory(EA)));
			break;
		case 0x27: // SLA A=(XY+o)
			RegA = SLA(ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0x28: // SRA B=(XY+o)
			RegB = SRA(ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0x29: // SRA C=(XY+o)
			RegC = SRA(ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0x2a: // SRA D=(XY+o)
			RegD = SRA(ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0x2b: // SRA E=(XY+o)
			RegE = SRA(ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0x2c: // SRA H=(XY+o)
			RegH = SRA(ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0x2d: // SRA L=(XY+o)
			RegL = SRA(ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0x2e: // SRA (XY+o)
			WriteMemory(EA, SRA(ReadMemory(EA)));
			break;
		case 0x2f: // SRA A=(XY+o)
			RegA = SRA(ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0x30: // SLL B=(XY+o)
			RegB = SLL(ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0x31: // SLL C=(XY+o)
			RegC = SLL(ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0x32: // SLL D=(XY+o)
			RegD = SLL(ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0x33: // SLL E=(XY+o)
			RegE = SLL(ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0x34: // SLL H=(XY+o)
			RegH = SLL(ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0x35: // SLL L=(XY+o)
			RegL = SLL(ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0x36: // SLL (XY+o)
			WriteMemory(EA, SLL(ReadMemory(EA)));
			break;
		case 0x37: // SLL A=(XY+o)
			RegA = SLL(ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0x38: // SRL B=(XY+o)
			RegB = SRL(ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0x39: // SRL C=(XY+o)
			RegC = SRL(ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0x3a: // SRL D=(XY+o)
			RegD = SRL(ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0x3b: // SRL E=(XY+o)
			RegE = SRL(ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0x3c: // SRL H=(XY+o)
			RegH = SRL(ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0x3d: // SRL L=(XY+o)
			RegL = SRL(ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0x3e: // SRL (XY+o)
			WriteMemory(EA, SRL(ReadMemory(EA)));
			break;
		case 0x3f: // SRL A=(XY+o)
			RegA = SRL(ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0x40: // BIT 0, B=(XY+o)
		case 0x41: // BIT 0, C=(XY+o)
		case 0x42: // BIT 0, D=(XY+o)
		case 0x43: // BIT 0, E=(XY+o)
		case 0x44: // BIT 0, H=(XY+o)
		case 0x45: // BIT 0, L=(XY+o)
		case 0x46: // BIT 0, (XY+o)
		case 0x47: // BIT 0, A=(XY+o)
			BIT_XY(0, ReadMemory(EA));
			break;
		case 0x48: // BIT 1, B=(XY+o)
		case 0x49: // BIT 1, C=(XY+o)
		case 0x4a: // BIT 1, D=(XY+o)
		case 0x4b: // BIT 1, E=(XY+o)
		case 0x4c: // BIT 1, H=(XY+o)
		case 0x4d: // BIT 1, L=(XY+o)
		case 0x4e: // BIT 1, (XY+o)
		case 0x4f: // BIT 1, A=(XY+o)
			BIT_XY(1, ReadMemory(EA));
			break;
		case 0x50: // BIT 2, B=(XY+o)
		case 0x51: // BIT 2, C=(XY+o)
		case 0x52: // BIT 2, D=(XY+o)
		case 0x53: // BIT 2, E=(XY+o)
		case 0x54: // BIT 2, H=(XY+o)
		case 0x55: // BIT 2, L=(XY+o)
		case 0x56: // BIT 2, (XY+o)
		case 0x57: // BIT 2, A=(XY+o)
			BIT_XY(2, ReadMemory(EA));
			break;
		case 0x58: // BIT 3, B=(XY+o)
		case 0x59: // BIT 3, C=(XY+o)
		case 0x5a: // BIT 3, D=(XY+o)
		case 0x5b: // BIT 3, E=(XY+o)
		case 0x5c: // BIT 3, H=(XY+o)
		case 0x5d: // BIT 3, L=(XY+o)
		case 0x5e: // BIT 3, (XY+o)
		case 0x5f: // BIT 3, A=(XY+o)
			BIT_XY(3, ReadMemory(EA));
			break;
		case 0x60: // BIT 4, B=(XY+o)
		case 0x61: // BIT 4, C=(XY+o)
		case 0x62: // BIT 4, D=(XY+o)
		case 0x63: // BIT 4, E=(XY+o)
		case 0x64: // BIT 4, H=(XY+o)
		case 0x65: // BIT 4, L=(XY+o)
		case 0x66: // BIT 4, (XY+o)
		case 0x67: // BIT 4, A=(XY+o)
			BIT_XY(4, ReadMemory(EA));
			break;
		case 0x68: // BIT 5, B=(XY+o)
		case 0x69: // BIT 5, C=(XY+o)
		case 0x6a: // BIT 5, D=(XY+o)
		case 0x6b: // BIT 5, E=(XY+o)
		case 0x6c: // BIT 5, H=(XY+o)
		case 0x6d: // BIT 5, L=(XY+o)
		case 0x6e: // BIT 5, (XY+o)
		case 0x6f: // BIT 5, A=(XY+o)
			BIT_XY(5, ReadMemory(EA));
			break;
		case 0x70: // BIT 6, B=(XY+o)
		case 0x71: // BIT 6, C=(XY+o)
		case 0x72: // BIT 6, D=(XY+o)
		case 0x73: // BIT 6, E=(XY+o)
		case 0x74: // BIT 6, H=(XY+o)
		case 0x75: // BIT 6, L=(XY+o)
		case 0x76: // BIT 6, (XY+o)
		case 0x77: // BIT 6, A=(XY+o)
			BIT_XY(6, ReadMemory(EA));
			break;
		case 0x78: // BIT 7, B=(XY+o)
		case 0x79: // BIT 7, C=(XY+o)
		case 0x7a: // BIT 7, D=(XY+o)
		case 0x7b: // BIT 7, E=(XY+o)
		case 0x7c: // BIT 7, H=(XY+o)
		case 0x7d: // BIT 7, L=(XY+o)
		case 0x7e: // BIT 7, (XY+o)
		case 0x7f: // BIT 7, A=(XY+o)
			BIT_XY(7, ReadMemory(EA));
			break;
		case 0x80: // RES 0, B=(XY+o)
			RegB = RES(0, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0x81: // RES 0, C=(XY+o)
			RegC = RES(0, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0x82: // RES 0, D=(XY+o)
			RegD = RES(0, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0x83: // RES 0, E=(XY+o)
			RegE = RES(0, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0x84: // RES 0, H=(XY+o)
			RegH = RES(0, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0x85: // RES 0, L=(XY+o)
			RegL = RES(0, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0x86: // RES 0, (XY+o)
			WriteMemory(EA, RES(0, ReadMemory(EA)));
			break;
		case 0x87: // RES 0, A=(XY+o)
			RegA = RES(0, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0x88: // RES 1, B=(XY+o)
			RegB = RES(1, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0x89: // RES 1, C=(XY+o)
			RegC = RES(1, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0x8a: // RES 1, D=(XY+o)
			RegD = RES(1, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0x8b: // RES 1, E=(XY+o)
			RegE = RES(1, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0x8c: // RES 1, H=(XY+o)
			RegH = RES(1, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0x8d: // RES 1, L=(XY+o)
			RegL = RES(1, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0x8e: // RES 1, (XY+o)
			WriteMemory(EA, RES(1, ReadMemory(EA)));
			break;
		case 0x8f: // RES 1, A=(XY+o)
			RegA = RES(1, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0x90: // RES 2, B=(XY+o)
			RegB = RES(2, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0x91: // RES 2, C=(XY+o)
			RegC = RES(2, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0x92: // RES 2, D=(XY+o)
			RegD = RES(2, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0x93: // RES 2, E=(XY+o)
			RegE = RES(2, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0x94: // RES 2, H=(XY+o)
			RegH = RES(2, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0x95: // RES 2, L=(XY+o)
			RegL = RES(2, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0x96: // RES 2, (XY+o)
			WriteMemory(EA, RES(2, ReadMemory(EA)));
			break;
		case 0x97: // RES 2, A=(XY+o)
			RegA = RES(2, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0x98: // RES 3, B=(XY+o)
			RegB = RES(3, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0x99: // RES 3, C=(XY+o)
			RegC = RES(3, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0x9a: // RES 3, D=(XY+o)
			RegD = RES(3, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0x9b: // RES 3, E=(XY+o)
			RegE = RES(3, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0x9c: // RES 3, H=(XY+o)
			RegH = RES(3, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0x9d: // RES 3, L=(XY+o)
			RegL = RES(3, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0x9e: // RES 3, (XY+o)
			WriteMemory(EA, RES(3, ReadMemory(EA)));
			break;
		case 0x9f: // RES 3, A=(XY+o)
			RegA = RES(3, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0xa0: // RES 4, B=(XY+o)
			RegB = RES(4, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0xa1: // RES 4, C=(XY+o)
			RegC = RES(4, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0xa2: // RES 4, D=(XY+o)
			RegD = RES(4, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0xa3: // RES 4, E=(XY+o)
			RegE = RES(4, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0xa4: // RES 4, H=(XY+o)
			RegH = RES(4, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0xa5: // RES 4, L=(XY+o)
			RegL = RES(4, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0xa6: // RES 4, (XY+o)
			WriteMemory(EA, RES(4, ReadMemory(EA)));
			break;
		case 0xa7: // RES 4, A=(XY+o)
			RegA = RES(4, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0xa8: // RES 5, B=(XY+o)
			RegB = RES(5, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0xa9: // RES 5, C=(XY+o)
			RegC = RES(5, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0xaa: // RES 5, D=(XY+o)
			RegD = RES(5, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0xab: // RES 5, E=(XY+o)
			RegE = RES(5, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0xac: // RES 5, H=(XY+o)
			RegH = RES(5, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0xad: // RES 5, L=(XY+o)
			RegL = RES(5, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0xae: // RES 5, (XY+o)
			WriteMemory(EA, RES(5, ReadMemory(EA)));
			break;
		case 0xaf: // RES 5, A=(XY+o)
			RegA = RES(5, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0xb0: // RES 6, B=(XY+o)
			RegB = RES(6, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0xb1: // RES 6, C=(XY+o)
			RegC = RES(6, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0xb2: // RES 6, D=(XY+o)
			RegD = RES(6, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0xb3: // RES 6, E=(XY+o)
			RegE = RES(6, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0xb4: // RES 6, H=(XY+o)
			RegH = RES(6, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0xb5: // RES 6, L=(XY+o)
			RegL = RES(6, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0xb6: // RES 6, (XY+o)
			WriteMemory(EA, RES(6, ReadMemory(EA)));
			break;
		case 0xb7: // RES 6, A=(XY+o)
			RegA = RES(6, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0xb8: // RES 7, B=(XY+o)
			RegB = RES(7, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0xb9: // RES 7, C=(XY+o)
			RegC = RES(7, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0xba: // RES 7, D=(XY+o)
			RegD = RES(7, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0xbb: // RES 7, E=(XY+o)
			RegE = RES(7, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0xbc: // RES 7, H=(XY+o)
			RegH = RES(7, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0xbd: // RES 7, L=(XY+o)
			RegL = RES(7, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0xbe: // RES 7, (XY+o)
			WriteMemory(EA, RES(7, ReadMemory(EA)));
			break;
		case 0xbf: // RES 7, A=(XY+o)
			RegA = RES(7, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0xc0: // SET 0, B=(XY+o)
			RegB = SET(0, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0xc1: // SET 0, C=(XY+o)
			RegC = SET(0, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0xc2: // SET 0, D=(XY+o)
			RegD = SET(0, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0xc3: // SET 0, E=(XY+o)
			RegE = SET(0, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0xc4: // SET 0, H=(XY+o)
			RegH = SET(0, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0xc5: // SET 0, L=(XY+o)
			RegL = SET(0, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0xc6: // SET 0, (XY+o)
			WriteMemory(EA, SET(0, ReadMemory(EA)));
			break;
		case 0xc7: // SET 0, A=(XY+o)
			RegA = SET(0, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0xc8: // SET 1, B=(XY+o)
			RegB = SET(1, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0xc9: // SET 1, C=(XY+o)
			RegC = SET(1, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0xca: // SET 1, D=(XY+o)
			RegD = SET(1, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0xcb: // SET 1, E=(XY+o)
			RegE = SET(1, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0xcc: // SET 1, H=(XY+o)
			RegH = SET(1, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0xcd: // SET 1, L=(XY+o)
			RegL = SET(1, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0xce: // SET 1, (XY+o)
			WriteMemory(EA, SET(1, ReadMemory(EA)));
			break;
		case 0xcf: // SET 1, A=(XY+o)
			RegA = SET(1, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0xd0: // SET 2, B=(XY+o)
			RegB = SET(2, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0xd1: // SET 2, C=(XY+o)
			RegC = SET(2, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0xd2: // SET 2, D=(XY+o)
			RegD = SET(2, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0xd3: // SET 2, E=(XY+o)
			RegE = SET(2, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0xd4: // SET 2, H=(XY+o)
			RegH = SET(2, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0xd5: // SET 2, L=(XY+o)
			RegL = SET(2, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0xd6: // SET 2, (XY+o)
			WriteMemory(EA, SET(2, ReadMemory(EA)));
			break;
		case 0xd7: // SET 2, A=(XY+o)
			RegA = SET(2, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0xd8: // SET 3, B=(XY+o)
			RegB = SET(3, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0xd9: // SET 3, C=(XY+o)
			RegC = SET(3, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0xda: // SET 3, D=(XY+o)
			RegD = SET(3, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0xdb: // SET 3, E=(XY+o)
			RegE = SET(3, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0xdc: // SET 3, H=(XY+o)
			RegH = SET(3, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0xdd: // SET 3, L=(XY+o)
			RegL = SET(3, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0xde: // SET 3, (XY+o)
			WriteMemory(EA, SET(3, ReadMemory(EA)));
			break;
		case 0xdf: // SET 3, A=(XY+o)
			RegA = SET(3, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0xe0: // SET 4, B=(XY+o)
			RegB = SET(4, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0xe1: // SET 4, C=(XY+o)
			RegC = SET(4, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0xe2: // SET 4, D=(XY+o)
			RegD = SET(4, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0xe3: // SET 4, E=(XY+o)
			RegE = SET(4, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0xe4: // SET 4, H=(XY+o)
			RegH = SET(4, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0xe5: // SET 4, L=(XY+o)
			RegL = SET(4, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0xe6: // SET 4, (XY+o)
			WriteMemory(EA, SET(4, ReadMemory(EA)));
			break;
		case 0xe7: // SET 4, A=(XY+o)
			RegA = SET(4, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0xe8: // SET 5, B=(XY+o)
			RegB = SET(5, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0xe9: // SET 5, C=(XY+o)
			RegC = SET(5, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0xea: // SET 5, D=(XY+o)
			RegD = SET(5, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0xeb: // SET 5, E=(XY+o)
			RegE = SET(5, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0xec: // SET 5, H=(XY+o)
			RegH = SET(5, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0xed: // SET 5, L=(XY+o)
			RegL = SET(5, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0xee: // SET 5, (XY+o)
			WriteMemory(EA, SET(5, ReadMemory(EA)));
			break;
		case 0xef: // SET 5, A=(XY+o)
			RegA = SET(5, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0xf0: // SET 6, B=(XY+o)
			RegB = SET(6, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0xf1: // SET 6, C=(XY+o)
			RegC = SET(6, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0xf2: // SET 6, D=(XY+o)
			RegD = SET(6, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0xf3: // SET 6, E=(XY+o)
			RegE = SET(6, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0xf4: // SET 6, H=(XY+o)
			RegH = SET(6, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0xf5: // SET 6, L=(XY+o)
			RegL = SET(6, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0xf6: // SET 6, (XY+o)
			WriteMemory(EA, SET(6, ReadMemory(EA)));
			break;
		case 0xf7: // SET 6, A=(XY+o)
			RegA = SET(6, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
		case 0xf8: // SET 7, B=(XY+o)
			RegB = SET(7, ReadMemory(EA));
			WriteMemory(EA, RegB);
			break;
		case 0xf9: // SET 7, C=(XY+o)
			RegC = SET(7, ReadMemory(EA));
			WriteMemory(EA, RegC);
			break;
		case 0xfa: // SET 7, D=(XY+o)
			RegD = SET(7, ReadMemory(EA));
			WriteMemory(EA, RegD);
			break;
		case 0xfb: // SET 7, E=(XY+o)
			RegE = SET(7, ReadMemory(EA));
			WriteMemory(EA, RegE);
			break;
		case 0xfc: // SET 7, H=(XY+o)
			RegH = SET(7, ReadMemory(EA));
			WriteMemory(EA, RegH);
			break;
		case 0xfd: // SET 7, L=(XY+o)
			RegL = SET(7, ReadMemory(EA));
			WriteMemory(EA, RegL);
			break;
		case 0xfe: // SET 7, (XY+o)
			WriteMemory(EA, SET(7, ReadMemory(EA)));
			break;
		case 0xff: // SET 7, A=(XY+o)
			RegA = SET(7, ReadMemory(EA));
			WriteMemory(EA, RegA);
			break;
	}
}

char sOpcodeList[] = 
    // mne           mode   opcodes
    "|nop\x00"          "\x01" "\x00"
    "|ld bc,*\x00"      "\x08" "\x01"
    "|ld (bc),a\x00"    "\x01" "\x02"
    "|inc bc\x00"       "\x01" "\x03"
    "|inc b\x00"        "\x01" "\x04"
    "|dec b\x00"        "\x01" "\x05"
    "|ld b,*\x00"       "\x02" "\x06"
    "|rlca\x00"         "\x01" "\x07"
    "|ex af,af'\x00"    "\x01" "\x08"
    "|add hl,bc\x00"    "\x01" "\x09"
    "|ld a,(bc)\x00"    "\x01" "\x0a"
    "|dec bc\x00"       "\x01" "\x0b"
    "|inc c\x00"        "\x01" "\x0c"
    "|dec c\x00"        "\x01" "\x0d"
    "|ld c,*\x00"       "\x02" "\x0e"
    "|rrca\x00"         "\x01" "\x0f"
    "|djnz *\x00"       "\x10" "\x10"
    "|ld de,*\x00"      "\x08" "\x11"
    "|ld (de),a\x00"    "\x01" "\x12"
    "|inc de\x00"       "\x01" "\x13"
    "|inc d\x00"        "\x01" "\x14"
    "|dec d\x00"        "\x01" "\x15"
    "|ld d,*\x00"       "\x02" "\x16"
    "|rla\x00"          "\x01" "\x17"
    "|jr *\x00"         "\x10" "\x18"
    "|add hl,de\x00"    "\x01" "\x19"
    "|ld a,(de)\x00"    "\x01" "\x1a"
    "|dec de\x00"       "\x01" "\x1b"
    "|inc e\x00"        "\x01" "\x1c"
    "|dec e\x00"        "\x01" "\x1d"
    "|ld e,*\x00"       "\x02" "\x1e"
    "|rra\x00"          "\x01" "\x1f"
    "|jr nz,*\x00"      "\x10" "\x20"
    "|ld hl,*\x00"      "\x08" "\x21"
    "|ld (*),hl\x00"    "\x08" "\x22"
    "|inc hl\x00"       "\x01" "\x23"
    "|inc h\x00"        "\x01" "\x24"
    "|dec h\x00"        "\x01" "\x25"
    "|ld h,*\x00"       "\x02" "\x26"
    "|daa\x00"          "\x01" "\x27"
    "|jr z,*\x00"       "\x10" "\x28"
    "|add hl,hl\x00"    "\x01" "\x29"
    "|ld hl,(*)\x00"    "\x08" "\x2a"
    "|dec hl\x00"       "\x01" "\x2b"
    "|inc l\x00"        "\x01" "\x2c"
    "|dec l\x00"        "\x01" "\x2d"
    "|ld l,*\x00"       "\x02" "\x2e"
    "|cpl\x00"          "\x01" "\x2f"
    "|jr nc,*\x00"      "\x10" "\x30"
    "|ld sp,*\x00"      "\x08" "\x31"
    "|ld (*),a\x00"     "\x08" "\x32"
    "|inc sp\x00"       "\x01" "\x33"
    "|inc (hl)\x00"     "\x01" "\x34"
    "|dec (hl)\x00"     "\x01" "\x35"
    "|ld (hl),*\x00"    "\x02" "\x36"
    "|scf\x00"          "\x01" "\x37"
    "|jr c,*\x00"       "\x10" "\x38"   // mode 16 -> 1 byte opcode, 1 byte PC-relative operand $+2
    "|add hl,sp\x00"    "\x01" "\x39"
    "|ld a,(*)\x00"     "\x08" "\x3a"
    "|dec sp\x00"       "\x01" "\x3b"
    "|inc a\x00"        "\x01" "\x3c"
    "|dec a\x00"        "\x01" "\x3d"
    "|ld a,*\x00"       "\x02" "\x3e"
    "|ccf\x00"          "\x01" "\x3f"
    "|ld b,b\x00"       "\x01" "\x40"
    "|ld b,c\x00"       "\x01" "\x41"
    "|ld b,d\x00"       "\x01" "\x42"
    "|ld b,e\x00"       "\x01" "\x43"
    "|ld b,h\x00"       "\x01" "\x44"
    "|ld b,l\x00"       "\x01" "\x45"
    "|ld b,(hl)\x00"    "\x01" "\x46"
    "|ld b,a\x00"       "\x01" "\x47"
    "|ld c,b\x00"       "\x01" "\x48"
    "|ld c,c\x00"       "\x01" "\x49"
    "|ld c,d\x00"       "\x01" "\x4a"
    "|ld c,e\x00"       "\x01" "\x4b"
    "|ld c,h\x00"       "\x01" "\x4c"
    "|ld c,l\x00"       "\x01" "\x4d"
    "|ld c,(hl)\x00"    "\x01" "\x4e"
    "|ld c,a\x00"       "\x01" "\x4f"
    "|ld d,b\x00"       "\x01" "\x50"
    "|ld d,c\x00"       "\x01" "\x51"
    "|ld d,d\x00"       "\x01" "\x52"
    "|ld d,e\x00"       "\x01" "\x53"
    "|ld d,h\x00"       "\x01" "\x54"
    "|ld d,l\x00"       "\x01" "\x55"
    "|ld d,(hl)\x00"    "\x01" "\x56"
    "|ld d,a\x00"       "\x01" "\x57"
    "|ld e,b\x00"       "\x01" "\x58"
    "|ld e,c\x00"       "\x01" "\x59"
    "|ld e,d\x00"       "\x01" "\x5a"
    "|ld e,e\x00"       "\x01" "\x5b"
    "|ld e,h\x00"       "\x01" "\x5c"
    "|ld e,l\x00"       "\x01" "\x5d"
    "|ld e,(hl)\x00"    "\x01" "\x5e"
    "|ld e,a\x00"       "\x01" "\x5f"
    "|ld h,b\x00"       "\x01" "\x60"
    "|ld h,c\x00"       "\x01" "\x61"
    "|ld h,d\x00"       "\x01" "\x62"
    "|ld h,e\x00"       "\x01" "\x63"
    "|ld h,h\x00"       "\x01" "\x64"
    "|ld h,l\x00"       "\x01" "\x65"
    "|ld h,(hl)\x00"    "\x01" "\x66"
    "|ld h,a\x00"       "\x01" "\x67"
    "|ld l,b\x00"       "\x01" "\x68"
    "|ld l,c\x00"       "\x01" "\x69"
    "|ld l,d\x00"       "\x01" "\x6a"
    "|ld l,e\x00"       "\x01" "\x6b"
    "|ld l,h\x00"       "\x01" "\x6c"
    "|ld l,l\x00"       "\x01" "\x6d"
    "|ld l,(hl)\x00"    "\x01" "\x6e"
    "|ld l,a\x00"       "\x01" "\x6f"
    "|ld (hl),b\x00"    "\x01" "\x70"
    "|ld (hl),c\x00"    "\x01" "\x71"
    "|ld (hl),d\x00"    "\x01" "\x72"
    "|ld (hl),e\x00"    "\x01" "\x73"
    "|ld (hl),h\x00"    "\x01" "\x74"
    "|ld (hl),l\x00"    "\x01" "\x75"
    "|halt\x00"         "\x01" "\x76"
    "|ld (hl),a\x00"    "\x01" "\x77"
    "|ld a,b\x00"       "\x01" "\x78"
    "|ld a,c\x00"       "\x01" "\x79"
    "|ld a,d\x00"       "\x01" "\x7a"
    "|ld a,e\x00"       "\x01" "\x7b"
    "|ld a,h\x00"       "\x01" "\x7c"
    "|ld a,l\x00"       "\x01" "\x7d"
    "|ld a,(hl)\x00"    "\x01" "\x7e"
    "|ld a,a\x00"       "\x01" "\x7f"
    "|add a,b\x00"      "\x01" "\x80"
    "|add a,c\x00"      "\x01" "\x81"
    "|add a,d\x00"      "\x01" "\x82"
    "|add a,e\x00"      "\x01" "\x83"
    "|add a,h\x00"      "\x01" "\x84"
    "|add a,l\x00"      "\x01" "\x85"
    "|add a,(hl)\x00"   "\x01" "\x86"
    "|add a,a\x00"      "\x01" "\x87"
    "|adc a,b\x00"      "\x01" "\x88"
    "|adc a,c\x00"      "\x01" "\x89"
    "|adc a,d\x00"      "\x01" "\x8a"
    "|adc a,e\x00"      "\x01" "\x8b"
    "|adc a,h\x00"      "\x01" "\x8c"
    "|adc a,l\x00"      "\x01" "\x8d"
    "|adc a,(hl)\x00"   "\x01" "\x8e"
    "|adc a,a\x00"      "\x01" "\x8f"
    "|sub b\x00"        "\x01" "\x90"
    "|sub c\x00"        "\x01" "\x91"
    "|sub d\x00"        "\x01" "\x92"
    "|sub e\x00"        "\x01" "\x93"
    "|sub h\x00"        "\x01" "\x94"
    "|sub l\x00"        "\x01" "\x95"
    "|sub (hl)\x00"     "\x01" "\x96"
    "|sub a\x00"        "\x01" "\x97"
    "|sbc b\x00"        "\x01" "\x98"
    "|sbc c\x00"        "\x01" "\x99"
    "|sbc d\x00"        "\x01" "\x9a"
    "|sbc e\x00"        "\x01" "\x9b"
    "|sbc h\x00"        "\x01" "\x9c"
    "|sbc l\x00"        "\x01" "\x9d"
    "|sbc (hl)\x00"     "\x01" "\x9e"
    "|sbc a\x00"        "\x01" "\x9f"
    "|and b\x00"        "\x01" "\xa0"
    "|and c\x00"        "\x01" "\xa1"
    "|and d\x00"        "\x01" "\xa2"
    "|and e\x00"        "\x01" "\xa3"
    "|and h\x00"        "\x01" "\xa4"
    "|and l\x00"        "\x01" "\xa5"
    "|and (hl)\x00"     "\x01" "\xa6"
    "|and a\x00"        "\x01" "\xa7"
    "|xor b\x00"        "\x01" "\xa8"
    "|xor c\x00"        "\x01" "\xa9"
    "|xor d\x00"        "\x01" "\xaa"
    "|xor e\x00"        "\x01" "\xab"
    "|xor h\x00"        "\x01" "\xac"
    "|xor l\x00"        "\x01" "\xad"
    "|xor (hl)\x00"     "\x01" "\xae"
    "|xor a\x00"        "\x01" "\xaf"
    "|or b\x00"         "\x01" "\xb0"
    "|or c\x00"         "\x01" "\xb1"
    "|or d\x00"         "\x01" "\xb2"
    "|or e\x00"         "\x01" "\xb3"
    "|or h\x00"         "\x01" "\xb4"
    "|or l\x00"         "\x01" "\xb5"
    "|or (hl)\x00"      "\x01" "\xb6"
    "|or a\x00"         "\x01" "\xb7"
    "|cp b\x00"         "\x01" "\xb8"
    "|cp c\x00"         "\x01" "\xb9"
    "|cp d\x00"         "\x01" "\xba"
    "|cp e\x00"         "\x01" "\xbb"
    "|cp h\x00"         "\x01" "\xbc"
    "|cp l\x00"         "\x01" "\xbd"
    "|cp (hl)\x00"      "\x01" "\xbe"
    "|cp a\x00"         "\x01" "\xbf"
    "|ret nz\x00"       "\x01" "\xc0"
    "|pop bc\x00"       "\x01" "\xc1"
    "|jp nz,*\x00"      "\x08" "\xc2"
    "|jp *\x00"         "\x08" "\xc3"
    "|call nz,*\x00"    "\x08" "\xc4"
    "|push bc\x00"      "\x01" "\xc5"
    "|add a,*\x00"      "\x02" "\xc6"
    "|rst 0\x00"        "\x01" "\xc7"
    "|ret z\x00"        "\x01" "\xc8"
    "|ret\x00"          "\x01" "\xc9"
    "|jp z,*\x00"       "\x08" "\xca"
    "|rlc b\x00"        "\x0f" "\xcb\x00"
    "|rlc c\x00"        "\x0f" "\xcb\x01"
    "|rlc d\x00"        "\x0f" "\xcb\x02"
    "|rlc e\x00"        "\x0f" "\xcb\x03"
    "|rlc h\x00"        "\x0f" "\xcb\x04"
    "|rlc l\x00"        "\x0f" "\xcb\x05"
    "|rlc (hl)\x00"     "\x0f" "\xcb\x06"
    "|rlc a\x00"        "\x0f" "\xcb\x07"
    "|rrc b\x00"        "\x0f" "\xcb\x08"
    "|rrc c\x00"        "\x0f" "\xcb\x09"
    "|rrc d\x00"        "\x0f" "\xcb\x0a"
    "|rrc e\x00"        "\x0f" "\xcb\x0b"
    "|rrc h\x00"        "\x0f" "\xcb\x0c"
    "|rrc l\x00"        "\x0f" "\xcb\x0d"
    "|rrc (hl)\x00"     "\x0f" "\xcb\x0e"
    "|rrc a\x00"        "\x0f" "\xcb\x0f"
    "|rl  b\x00"        "\x0f" "\xcb\x10"
    "|rl  c\x00"        "\x0f" "\xcb\x11"
    "|rl  d\x00"        "\x0f" "\xcb\x12"
    "|rl  e\x00"        "\x0f" "\xcb\x13"
    "|rl  h\x00"        "\x0f" "\xcb\x14"
    "|rl  l\x00"        "\x0f" "\xcb\x15"
    "|rl  (hl)\x00"     "\x0f" "\xcb\x16"
    "|rl  a\x00"        "\x0f" "\xcb\x17"
    "|rr  b\x00"        "\x0f" "\xcb\x18"
    "|rr  c\x00"        "\x0f" "\xcb\x19"
    "|rr  d\x00"        "\x0f" "\xcb\x1a"
    "|rr  e\x00"        "\x0f" "\xcb\x1b"
    "|rr  h\x00"        "\x0f" "\xcb\x1c"
    "|rr  l\x00"        "\x0f" "\xcb\x1d"
    "|rr  (hl)\x00"     "\x0f" "\xcb\x1e"
    "|rr  a\x00"        "\x0f" "\xcb\x1f"
    "|sla b\x00"        "\x0f" "\xcb\x20"
    "|sla c\x00"        "\x0f" "\xcb\x21"
    "|sla d\x00"        "\x0f" "\xcb\x22"
    "|sla e\x00"        "\x0f" "\xcb\x23"
    "|sla h\x00"        "\x0f" "\xcb\x24"
    "|sla l\x00"        "\x0f" "\xcb\x25"
    "|sla (hl)\x00"     "\x0f" "\xcb\x26"
    "|sla a\x00"        "\x0f" "\xcb\x27"
    "|sra b\x00"        "\x0f" "\xcb\x28"
    "|sra c\x00"        "\x0f" "\xcb\x29"
    "|sra d\x00"        "\x0f" "\xcb\x2a"
    "|sra e\x00"        "\x0f" "\xcb\x2b"
    "|sra h\x00"        "\x0f" "\xcb\x2c"
    "|sra l\x00"        "\x0f" "\xcb\x2d"
    "|sra (hl)\x00"     "\x0f" "\xcb\x2e"
    "|sra a\x00"        "\x0f" "\xcb\x2f"
    "|srl b\x00"        "\x0f" "\xcb\x38"
    "|srl c\x00"        "\x0f" "\xcb\x39"
    "|srl d\x00"        "\x0f" "\xcb\x3a"
    "|srl e\x00"        "\x0f" "\xcb\x3b"
    "|srl h\x00"        "\x0f" "\xcb\x3c"
    "|srl l\x00"        "\x0f" "\xcb\x3d"
    "|srl (hl)\x00"     "\x0f" "\xcb\x3e"
    "|srl a\x00"        "\x0f" "\xcb\x3f"
    "|bit 0,b\x00"      "\x0f" "\xcb\x40"
    "|bit 0,c\x00"      "\x0f" "\xcb\x41"
    "|bit 0,d\x00"      "\x0f" "\xcb\x42"
    "|bit 0,e\x00"      "\x0f" "\xcb\x43"
    "|bit 0,h\x00"      "\x0f" "\xcb\x44"
    "|bit 0,l\x00"      "\x0f" "\xcb\x45"
    "|bit 0,(hl)\x00"   "\x0f" "\xcb\x46"
    "|bit 0,a\x00"      "\x0f" "\xcb\x47"
    "|bit 1,b\x00"      "\x0f" "\xcb\x48"
    "|bit 1,c\x00"      "\x0f" "\xcb\x49"
    "|bit 1,d\x00"      "\x0f" "\xcb\x4a"
    "|bit 1,e\x00"      "\x0f" "\xcb\x4b"
    "|bit 1,h\x00"      "\x0f" "\xcb\x4c"
    "|bit 1,l\x00"      "\x0f" "\xcb\x4d"
    "|bit 1,(hl)\x00"   "\x0f" "\xcb\x4e"
    "|bit 1,a\x00"      "\x0f" "\xcb\x4f"
    "|bit 2,b\x00"      "\x0f" "\xcb\x50"
    "|bit 2,c\x00"      "\x0f" "\xcb\x51"
    "|bit 2,d\x00"      "\x0f" "\xcb\x52"
    "|bit 2,e\x00"      "\x0f" "\xcb\x53"
    "|bit 2,h\x00"      "\x0f" "\xcb\x54"
    "|bit 2,l\x00"      "\x0f" "\xcb\x55"
    "|bit 2,(hl)\x00"   "\x0f" "\xcb\x56"
    "|bit 2,a\x00"      "\x0f" "\xcb\x57"
    "|bit 3,b\x00"      "\x0f" "\xcb\x58"
    "|bit 3,c\x00"      "\x0f" "\xcb\x59"
    "|bit 3,d\x00"      "\x0f" "\xcb\x5a"
    "|bit 3,e\x00"      "\x0f" "\xcb\x5b"
    "|bit 3,h\x00"      "\x0f" "\xcb\x5c"
    "|bit 3,l\x00"      "\x0f" "\xcb\x5d"
    "|bit 3,(hl)\x00"   "\x0f" "\xcb\x5e"
    "|bit 3,a\x00"      "\x0f" "\xcb\x5f"
    "|bit 4,b\x00"      "\x0f" "\xcb\x60"
    "|bit 4,c\x00"      "\x0f" "\xcb\x61"
    "|bit 4,d\x00"      "\x0f" "\xcb\x62"
    "|bit 4,e\x00"      "\x0f" "\xcb\x63"
    "|bit 4,h\x00"      "\x0f" "\xcb\x64"
    "|bit 4,l\x00"      "\x0f" "\xcb\x65"
    "|bit 4,(hl)\x00"   "\x0f" "\xcb\x66"
    "|bit 4,a\x00"      "\x0f" "\xcb\x67"
    "|bit 5,b\x00"      "\x0f" "\xcb\x68"
    "|bit 5,c\x00"      "\x0f" "\xcb\x69"
    "|bit 5,d\x00"      "\x0f" "\xcb\x6a"
    "|bit 5,e\x00"      "\x0f" "\xcb\x6b"
    "|bit 5,h\x00"      "\x0f" "\xcb\x6c"
    "|bit 5,l\x00"      "\x0f" "\xcb\x6d"
    "|bit 5,(hl)\x00"   "\x0f" "\xcb\x6e"
    "|bit 5,a\x00"      "\x0f" "\xcb\x6f"
    "|bit 6,b\x00"      "\x0f" "\xcb\x70"
    "|bit 6,c\x00"      "\x0f" "\xcb\x71"
    "|bit 6,d\x00"      "\x0f" "\xcb\x72"
    "|bit 6,e\x00"      "\x0f" "\xcb\x73"
    "|bit 6,h\x00"      "\x0f" "\xcb\x74"
    "|bit 6,l\x00"      "\x0f" "\xcb\x75"
    "|bit 6,(hl)\x00"   "\x0f" "\xcb\x76"
    "|bit 6,a\x00"      "\x0f" "\xcb\x77"
    "|bit 7,b\x00"      "\x0f" "\xcb\x78"
    "|bit 7,c\x00"      "\x0f" "\xcb\x79"
    "|bit 7,d\x00"      "\x0f" "\xcb\x7a"
    "|bit 7,e\x00"      "\x0f" "\xcb\x7b"
    "|bit 7,h\x00"      "\x0f" "\xcb\x7c"
    "|bit 7,l\x00"      "\x0f" "\xcb\x7d"
    "|bit 7,(hl)\x00"   "\x0f" "\xcb\x7e"
    "|bit 7,a\x00"      "\x0f" "\xcb\x7f"
    "|res 0,b\x00"      "\x0f" "\xcb\x80"
    "|res 0,c\x00"      "\x0f" "\xcb\x81"
    "|res 0,d\x00"      "\x0f" "\xcb\x82"
    "|res 0,e\x00"      "\x0f" "\xcb\x83"
    "|res 0,h\x00"      "\x0f" "\xcb\x84"
    "|res 0,l\x00"      "\x0f" "\xcb\x85"
    "|res 0,(hl)\x00"   "\x0f" "\xcb\x86"
    "|res 0,a\x00"      "\x0f" "\xcb\x87"
    "|res 1,b\x00"      "\x0f" "\xcb\x88"
    "|res 1,c\x00"      "\x0f" "\xcb\x89"
    "|res 1,d\x00"      "\x0f" "\xcb\x8a"
    "|res 1,e\x00"      "\x0f" "\xcb\x8b"
    "|res 1,h\x00"      "\x0f" "\xcb\x8c"
    "|res 1,l\x00"      "\x0f" "\xcb\x8d"
    "|res 1,(hl)\x00"   "\x0f" "\xcb\x8e"
    "|res 1,a\x00"      "\x0f" "\xcb\x8f"
    "|res 2,b\x00"      "\x0f" "\xcb\x90"
    "|res 2,c\x00"      "\x0f" "\xcb\x91"
    "|res 2,d\x00"      "\x0f" "\xcb\x92"
    "|res 2,e\x00"      "\x0f" "\xcb\x93"
    "|res 2,h\x00"      "\x0f" "\xcb\x94"
    "|res 2,l\x00"      "\x0f" "\xcb\x95"
    "|res 2,(hl)\x00"   "\x0f" "\xcb\x96"
    "|res 2,a\x00"      "\x0f" "\xcb\x97"
    "|res 3,b\x00"      "\x0f" "\xcb\x98"
    "|res 3,c\x00"      "\x0f" "\xcb\x99"
    "|res 3,d\x00"      "\x0f" "\xcb\x9a"
    "|res 3,e\x00"      "\x0f" "\xcb\x9b"
    "|res 3,h\x00"      "\x0f" "\xcb\x9c"
    "|res 3,l\x00"      "\x0f" "\xcb\x9d"
    "|res 3,(hl)\x00"   "\x0f" "\xcb\x9e"
    "|res 3,a\x00"      "\x0f" "\xcb\x9f"
    "|res 4,b\x00"      "\x0f" "\xcb\xa0"
    "|res 4,c\x00"      "\x0f" "\xcb\xa1"
    "|res 4,d\x00"      "\x0f" "\xcb\xa2"
    "|res 4,e\x00"      "\x0f" "\xcb\xa3"
    "|res 4,h\x00"      "\x0f" "\xcb\xa4"
    "|res 4,l\x00"      "\x0f" "\xcb\xa5"
    "|res 4,(hl)\x00"   "\x0f" "\xcb\xa6"
    "|res 4,a\x00"      "\x0f" "\xcb\xa7"
    "|res 5,b\x00"      "\x0f" "\xcb\xa8"
    "|res 5,c\x00"      "\x0f" "\xcb\xa9"
    "|res 5,d\x00"      "\x0f" "\xcb\xaa"
    "|res 5,e\x00"      "\x0f" "\xcb\xab"
    "|res 5,h\x00"      "\x0f" "\xcb\xac"
    "|res 5,l\x00"      "\x0f" "\xcb\xad"
    "|res 5,(hl)\x00"   "\x0f" "\xcb\xae"
    "|res 5,a\x00"      "\x0f" "\xcb\xaf"
    "|res 6,b\x00"      "\x0f" "\xcb\xb0"
    "|res 6,c\x00"      "\x0f" "\xcb\xb1"
    "|res 6,d\x00"      "\x0f" "\xcb\xb2"
    "|res 6,e\x00"      "\x0f" "\xcb\xb3"
    "|res 6,h\x00"      "\x0f" "\xcb\xb4"
    "|res 6,l\x00"      "\x0f" "\xcb\xb5"
    "|res 6,(hl)\x00"   "\x0f" "\xcb\xb6"
    "|res 6,a\x00"      "\x0f" "\xcb\xb7"
    "|res 7,b\x00"      "\x0f" "\xcb\xb8"
    "|res 7,c\x00"      "\x0f" "\xcb\xb9"
    "|res 7,d\x00"      "\x0f" "\xcb\xba"
    "|res 7,e\x00"      "\x0f" "\xcb\xbb"
    "|res 7,h\x00"      "\x0f" "\xcb\xbc"
    "|res 7,l\x00"      "\x0f" "\xcb\xbd"
    "|res 7,(hl)\x00"   "\x0f" "\xcb\xbe"
    "|res 7,a\x00"      "\x0f" "\xcb\xbf"
    "|set 0,b\x00"      "\x0f" "\xcb\xc0"
    "|set 0,c\x00"      "\x0f" "\xcb\xc1"
    "|set 0,d\x00"      "\x0f" "\xcb\xc2"
    "|set 0,e\x00"      "\x0f" "\xcb\xc3"
    "|set 0,h\x00"      "\x0f" "\xcb\xc4"
    "|set 0,l\x00"      "\x0f" "\xcb\xc5"
    "|set 0,(hl)\x00"   "\x0f" "\xcb\xc6"
    "|set 0,a\x00"      "\x0f" "\xcb\xc7"
    "|set 1,b\x00"      "\x0f" "\xcb\xc8"
    "|set 1,c\x00"      "\x0f" "\xcb\xc9"
    "|set 1,d\x00"      "\x0f" "\xcb\xca"
    "|set 1,e\x00"      "\x0f" "\xcb\xcb"
    "|set 1,h\x00"      "\x0f" "\xcb\xcc"
    "|set 1,l\x00"      "\x0f" "\xcb\xcd"
    "|set 1,(hl)\x00"   "\x0f" "\xcb\xce"
    "|set 1,a\x00"      "\x0f" "\xcb\xcf"
    "|set 2,b\x00"      "\x0f" "\xcb\xd0"
    "|set 2,c\x00"      "\x0f" "\xcb\xd1"
    "|set 2,d\x00"      "\x0f" "\xcb\xd2"
    "|set 2,e\x00"      "\x0f" "\xcb\xd3"
    "|set 2,h\x00"      "\x0f" "\xcb\xd4"
    "|set 2,l\x00"      "\x0f" "\xcb\xd5"
    "|set 2,(hl)\x00"   "\x0f" "\xcb\xd6"
    "|set 2,a\x00"      "\x0f" "\xcb\xd7"
    "|set 3,b\x00"      "\x0f" "\xcb\xd8"
    "|set 3,c\x00"      "\x0f" "\xcb\xd9"
    "|set 3,d\x00"      "\x0f" "\xcb\xda"
    "|set 3,e\x00"      "\x0f" "\xcb\xdb"
    "|set 3,h\x00"      "\x0f" "\xcb\xdc"
    "|set 3,l\x00"      "\x0f" "\xcb\xdd"
    "|set 3,(hl)\x00"   "\x0f" "\xcb\xde"
    "|set 3,a\x00"      "\x0f" "\xcb\xdf"
    "|set 4,b\x00"      "\x0f" "\xcb\xe0"
    "|set 4,c\x00"      "\x0f" "\xcb\xe1"
    "|set 4,d\x00"      "\x0f" "\xcb\xe2"
    "|set 4,e\x00"      "\x0f" "\xcb\xe3"
    "|set 4,h\x00"      "\x0f" "\xcb\xe4"
    "|set 4,l\x00"      "\x0f" "\xcb\xe5"
    "|set 4,(hl)\x00"   "\x0f" "\xcb\xe6"
    "|set 4,a\x00"      "\x0f" "\xcb\xe7"
    "|set 5,b\x00"      "\x0f" "\xcb\xe8"
    "|set 5,c\x00"      "\x0f" "\xcb\xe9"
    "|set 5,d\x00"      "\x0f" "\xcb\xea"
    "|set 5,e\x00"      "\x0f" "\xcb\xeb"
    "|set 5,h\x00"      "\x0f" "\xcb\xec"
    "|set 5,l\x00"      "\x0f" "\xcb\xed"
    "|set 5,(hl)\x00"   "\x0f" "\xcb\xee"
    "|set 5,a\x00"      "\x0f" "\xcb\xef"
    "|set 6,b\x00"      "\x0f" "\xcb\xf0"
    "|set 6,c\x00"      "\x0f" "\xcb\xf1"
    "|set 6,d\x00"      "\x0f" "\xcb\xf2"
    "|set 6,e\x00"      "\x0f" "\xcb\xf3"
    "|set 6,h\x00"      "\x0f" "\xcb\xf4"
    "|set 6,l\x00"      "\x0f" "\xcb\xf5"
    "|set 6,(hl)\x00"   "\x0f" "\xcb\xf6"
    "|set 6,a\x00"      "\x0f" "\xcb\xf7"
    "|set 7,b\x00"      "\x0f" "\xcb\xf8"
    "|set 7,c\x00"      "\x0f" "\xcb\xf9"
    "|set 7,d\x00"      "\x0f" "\xcb\xfa"
    "|set 7,e\x00"      "\x0f" "\xcb\xfb"
    "|set 7,h\x00"      "\x0f" "\xcb\xfc"
    "|set 7,l\x00"      "\x0f" "\xcb\xfd"
    "|set 7,(hl)\x00"   "\x0f" "\xcb\xfe"
    "|set 7,a\x00"      "\x0f" "\xcb\xff"       // mode 15 -> 2 byte opcode (cb nn), no operand
    "|call z,*\x00"     "\x08" "\xcc"
    "|call *\x00"       "\x08" "\xcd"
    "|adc a,*\x00"      "\x02" "\xce"
    "|rst 8h\x00"       "\x01" "\xcf"
    "|ret nc\x00"       "\x01" "\xd0"
    "|pop de\x00"       "\x01" "\xd1"
    "|jp nc,*\x00"      "\x08" "\xd2"
    "|out (*),a\x00"    "\x02" "\xd3"
    "|call nc,*\x00"    "\x08" "\xd4"
    "|push de\x00"      "\x01" "\xd5"
    "|sub *\x00"        "\x02" "\xd6"
    "|rst 10h\x00"      "\x01" "\xd7"
    "|ret c\x00"        "\x01" "\xd8"
    "|exx\x00"          "\x01" "\xd9"
    "|jp c,*\x00"       "\x08" "\xda"
    "|in a,(*)\x00"     "\x02" "\xdb"
    "|call c,*\x00"     "\x08" "\xdc"
    "|add ix,bc\x00"    "\x0b" "\xdd\x09"
    "|add ix,de\x00"    "\x0b" "\xdd\x19"
    "|ld ix,*\x00"      "\x0e" "\xdd\x21"
    "|ld (*),ix\x00"    "\x0e" "\xdd\x22"
    "|inc ix\x00"       "\x0b" "\xdd\x23"
    "|add ix,ix\x00"    "\x0b" "\xdd\x29"
    "|ld ix,(*)\x00"    "\x0e" "\xdd\x2a"        // mode 14 -> 2 byte opcode (dd nn), 2 byte operand (xx xx)
    "|dec ix\x00"       "\x0b" "\xdd\x2b"
    "|inc (ix+*)\x00"   "\x0d" "\xdd\x34"
    "|dec (ix+*)\x00"   "\x0d" "\xdd\x35"
    "|ld (ix+*),*\x00"  "\x06" "\xdd\x36" 
    "|add ix,sp\x00"    "\x0b" "\xdd\x39"
    "|ld b,(ix+*)\x00"  "\x0d" "\xdd\x46"
    "|ld c,(ix+*)\x00"  "\x0d" "\xdd\x4e"
    "|ld d,(ix+*)\x00"  "\x0d" "\xdd\x56"
    "|ld e,(ix+*)\x00"  "\x0d" "\xdd\x5e"
    "|ld h,(ix+*)\x00"  "\x0d" "\xdd\x66"
    "|ld l,(ix+*)\x00"  "\x0d" "\xdd\x6e"
    "|ld (ix+*),b\x00"  "\x0d" "\xdd\x70"
    "|ld (ix+*),c\x00"  "\x0d" "\xdd\x71"
    "|ld (ix+*),d\x00"  "\x0d" "\xdd\x72"
    "|ld (ix+*),e\x00"  "\x0d" "\xdd\x73"
    "|ld (ix+*),h\x00"  "\x0d" "\xdd\x74"
    "|ld (ix+*),l\x00"  "\x0d" "\xdd\x75"
    "|ld (ix+*),a\x00"  "\x0d" "\xdd\x77"
    "|ld a,(ix+*)\x00"  "\x0d" "\xdd\x7e"
    "|add a,(ix+*)\x00" "\x0d" "\xdd\x86"
    "|adc a,(ix+*)\x00" "\x0d" "\xdd\x8e"
    "|sub (ix+*)\x00"   "\x0d" "\xdd\x96"
    "|sbc a,(ix+*)\x00" "\x0d" "\xdd\x9e"
    "|and (ix+*)\x00"   "\x0d" "\xdd\xa6"
    "|xor (ix+*)\x00"   "\x0d" "\xdd\xae"
    "|or (ix+*)\x00"    "\x0d" "\xdd\xb6"
    "|cp (ix+*)\x00"    "\x0d" "\xdd\xbe"   // mode 13 -> 2 byte opcode (dd nn), 1 byte operand (xx)
    "|rlc (ix+*)\x00"   "\x0c" "\xdd\xcb\x06"
    "|rrc (ix+*)\x00"   "\x0c" "\xdd\xcb\x0e"
    "|rl (ix+*)\x00"    "\x0c" "\xdd\xcb\x16"
    "|rr (ix+*)\x00"    "\x0c" "\xdd\xcb\x1e"
    "|sla (ix+*)\x00"   "\x0c" "\xdd\xcb\x26"
    "|sra (ix+*)\x00"   "\x0c" "\xdd\xcb\x2e"
    "|bit 0,(ix+*)\x00" "\x0c" "\xdd\xcb\x46"
    "|bit 1,(ix+*)\x00" "\x0c" "\xdd\xcb\x4e"
    "|bit 2,(ix+*)\x00" "\x0c" "\xdd\xcb\x56"
    "|bit 3,(ix+*)\x00" "\x0c" "\xdd\xcb\x5e"
    "|bit 4,(ix+*)\x00" "\x0c" "\xdd\xcb\x66"
    "|bit 5,(ix+*)\x00" "\x0c" "\xdd\xcb\x6e"
    "|bit 6,(ix+*)\x00" "\x0c" "\xdd\xcb\x76"
    "|bit 7,(ix+*)\x00" "\x0c" "\xdd\xcb\x7e"
    "|res 0,(ix+*)\x00" "\x0c" "\xdd\xcb\x86"
    "|res 1,(ix+*)\x00" "\x0c" "\xdd\xcb\x8e"
    "|res 2,(ix+*)\x00" "\x0c" "\xdd\xcb\x96"
    "|res 3,(ix+*)\x00" "\x0c" "\xdd\xcb\x9e"
    "|res 4,(ix+*)\x00" "\x0c" "\xdd\xcb\xa6"
    "|res 5,(ix+*)\x00" "\x0c" "\xdd\xcb\xae"
    "|res 6,(ix+*)\x00" "\x0c" "\xdd\xcb\xb6"
    "|res 7,(ix+*)\x00" "\x0c" "\xdd\xcb\xbe"
    "|set 0,(ix+*)\x00" "\x0c" "\xdd\xcb\xc6"
    "|set 1,(ix+*)\x00" "\x0c" "\xdd\xcb\xce"
    "|set 2,(ix+*)\x00" "\x0c" "\xdd\xcb\xd6"
    "|set 3,(ix+*)\x00" "\x0c" "\xdd\xcb\xde"
    "|set 4,(ix+*)\x00" "\x0c" "\xdd\xcb\xe6"
    "|set 5,(ix+*)\x00" "\x0c" "\xdd\xcb\xee"
    "|set 6,(ix+*)\x00" "\x0c" "\xdd\xcb\xf6"
    "|set 7,(ix+*)\x00" "\x0c" "\xdd\xcb\xfe"     // mode 12 -> 3 byte opcode (dd cb xx nn), 1 byte operand (xx)
    "|pop ix\x00"       "\x0b" "\xdd\xe1"
    "|ex (sp),ix\x00"   "\x0b" "\xdd\xe3"
    "|push ix\x00"      "\x0b" "\xdd\xe5"
    "|jp (ix)\x00"      "\x0b" "\xdd\xe9"
    "|ld sp,ix\x00"     "\x0b" "\xdd\xf9"    // mode 11 -> 2 byte opcode (dd nn), no operand
    "|sbc a,*\x00"      "\x02" "\xde"
    "|rst 18h\x00"      "\x01" "\xdf"
    "|ret po\x00"       "\x01" "\xe0"
    "|pop hl\x00"       "\x01" "\xe1"
    "|jp po,*\x00"      "\x08" "\xe2"
    "|ex (sp),hl\x00"   "\x01" "\xe3"
    "|call po,*\x00"    "\x08" "\xe4"
    "|push hl\x00"      "\x01" "\xe5"
    "|and *\x00"        "\x02" "\xe6"
    "|rst 20h\x00"      "\x01" "\xe7"
    "|ret pe\x00"       "\x01" "\xe8"
    "|jp (hl)\x00"      "\x01" "\xe9"
    "|jp pe,*\x00"      "\x08" "\xea"
    "|ex de,hl\x00"     "\x01" "\xeb"
    "|call pe,*\x00"    "\x08" "\xec"
    "|in b,(c)\x00"     "\x09" "\xed\x40"
    "|out (c),b\x00"    "\x09" "\xed\x41"
    "|sbc hl,bc\x00"    "\x09" "\xed\x42"
    "|ld (*),bc\x00"    "\x0a" "\xed\x43"
    "|neg\x00"          "\x09" "\xed\x44"
    "|retn\x00"         "\x09" "\xed\x45"
    "|im 0\x00"         "\x09" "\xed\x46"
    "|ld i,a\x00"       "\x09" "\xed\x47"
    "|in c,(c)\x00"     "\x09" "\xed\x48"
    "|out (c),c\x00"    "\x09" "\xed\x49"
    "|adc hl,bc\x00"    "\x09" "\xed\x4a"
    "|ld bc,(*)\x00"    "\x0a" "\xed\x4b"
    "|reti\x00"         "\x09" "\xed\x4d"
    "|in d,(c)\x00"     "\x09" "\xed\x50"
    "|out (c),d\x00"    "\x09" "\xed\x51"
    "|sbc hl,de\x00"    "\x09" "\xed\x52"
    "|ld (*),de\x00"    "\x0a" "\xed\x53"
    "|im 1\x00"         "\x09" "\xed\x56"
    "|ld a,i\x00"       "\x09" "\xed\x57"
    "|in e,(c)\x00"     "\x09" "\xed\x58"
    "|out (c),e\x00"    "\x09" "\xed\x59"
    "|adc hl,de\x00"    "\x09" "\xed\x5a"
    "|ld de,(*)\x00"    "\x0a" "\xed\x5b"
    "|im 2\x00"         "\x09" "\xed\x5e"
    "|in h,(c)\x00"     "\x09" "\xed\x60"
    "|out (c),h\x00"    "\x09" "\xed\x61"
    "|sbc hl,hl\x00"    "\x09" "\xed\x62"
    "|rrd\x00"          "\x09" "\xed\x67"
    "|in l,(c)\x00"     "\x09" "\xed\x68"
    "|out (c),l\x00"    "\x09" "\xed\x69"
    "|adc hl,hl\x00"    "\x09" "\xed\x6a"
    "|rld\x00"          "\x09" "\xed\x6f"
    "|sbc hl,sp\x00"    "\x09" "\xed\x72"
    "|ld (*),sp\x00"    "\x0a" "\xed\x73"
    "|in a,(c)\x00"     "\x09" "\xed\x78"
    "|out (c),a\x00"    "\x09" "\xed\x79"
    "|adc hl,sp\x00"    "\x09" "\xed\x7a"
    "|ld sp,(*)\x00"    "\x0a" "\xed\x7b"   // mode 10 -> 2 byte opcode (ed nn xx xx), 2 byte operand (xx xx)
    "|ldi\x00"          "\x09" "\xed\xa0"
    "|cpi\x00"          "\x09" "\xed\xa1"
    "|ini\x00"          "\x09" "\xed\xa2"
    "|outi\x00"         "\x09" "\xed\xa3"
    "|ldd\x00"          "\x09" "\xed\xa8"
    "|cpd\x00"          "\x09" "\xed\xa9"
    "|ind\x00"          "\x09" "\xed\xaa"
    "|outd\x00"         "\x09" "\xed\xab"
    "|ldir\x00"         "\x09" "\xed\xb0"
    "|cpir\x00"         "\x09" "\xed\xb1"
    "|inir\x00"         "\x09" "\xed\xb2"
    "|otir\x00"         "\x09" "\xed\xb3"
    "|lddr\x00"         "\x09" "\xed\xb8"
    "|cpdr\x00"         "\x09" "\xed\xb9"
    "|indr\x00"         "\x09" "\xed\xba"
    "|otdr\x00"         "\x09" "\xed\xbb"  // mode 9 -> 2 byte opcode (ed nn), no operand
    "|Trap GSX\x00"     "\x09" "\xed\xfc"  // non standard z80 instr. Used in emulator to trab GSX calls
    "|Trap BOOT\x00"    "\x09" "\xed\xfd"  // non standard z80 instr. Used in emulator to return to CCP
    "|Trap BDOS\x00"    "\x09" "\xed\xfe"  // non standard z80 instr. Used in emulator to trap BDOS calls
    "|Trap BIOS\x00"    "\x09" "\xed\xff"  // non standard z80 instr. Used in emulator to trap BIOS calls
    "|xor *\x00"        "\x02" "\xee"
    "|rst 28h\x00"      "\x01" "\xef"
    "|ret p\x00"        "\x01" "\xf0"
    "|pop af\x00"       "\x01" "\xf1"
    "|jp p,*\x00"       "\x08" "\xf2"
    "|di\x00"           "\x01" "\xf3"
    "|call p,*\x00"     "\x08" "\xf4"
    "|push af\x00"      "\x01" "\xf5"
    "|or *\x00"         "\x02" "\xf6"
    "|rst 30h\x00"      "\x01" "\xf7"
    "|ret m\x00"        "\x01" "\xf8"
    "|ld sp,hl\x00"     "\x01" "\xf9"
    "|jp m,*\x00"       "\x08" "\xfa"
    "|ei\x00"           "\x01" "\xfb"
    "|call m,*\x00"     "\x08" "\xfc"              // mode 8 -> 1 byte opcode, 2 byte operand
    "|add iy,bc\x00"    "\x03" "\xfd\x09"
    "|add iy,de\x00"    "\x03" "\xfd\x19"
    "|ld iy,*\x00"      "\x07" "\xfd\x21"
    "|ld (*),iy\x00"    "\x07" "\xfd\x22"
    "|inc iy\x00"       "\x03" "\xfd\x23"
    "|add iy,iy\x00"    "\x03" "\xfd\x29"
    "|ld iy,(*)\x00"    "\x07" "\xfd\x2a"          // mode 7 -> 2 byte opcode (fd nn xx xx), 2 byte operand (xx xx)
    "|dec iy\x00"       "\x03" "\xfd\x2b"
    "|inc (iy+*)\x00"   "\x05" "\xfd\x34"
    "|dec (iy+*)\x00"   "\x05" "\xfd\x35"
    "|ld (iy+*),*\x00"  "\x06" "\xfd\x36"         // mode 6 -> 2 byte opcode (dd/fd nn xx xx), two 1 byte operand (xx xx), fist operane signed
    "|add iy,sp\x00"    "\x03" "\xfd\x39"
    "|ld b,(iy+*)\x00"  "\x05" "\xfd\x46"
    "|ld c,(iy+*)\x00"  "\x05" "\xfd\x4e"
    "|ld d,(iy+*)\x00"  "\x05" "\xfd\x56"
    "|ld e,(iy+*)\x00"  "\x05" "\xfd\x5e"
    "|ld h,(iy+*)\x00"  "\x05" "\xfd\x66"
    "|ld l,(iy+*)\x00"  "\x05" "\xfd\x6e"
    "|ld (iy+*),b\x00"  "\x05" "\xfd\x70"
    "|ld (iy+*),c\x00"  "\x05" "\xfd\x71"
    "|ld (iy+*),d\x00"  "\x05" "\xfd\x72"
    "|ld (iy+*),e\x00"  "\x05" "\xfd\x73"
    "|ld (iy+*),h\x00"  "\x05" "\xfd\x74"
    "|ld (iy+*),l\x00"  "\x05" "\xfd\x75"
    "|ld (iy+*),a\x00"  "\x05" "\xfd\x77"
    "|ld a,(iy+*)\x00"  "\x05" "\xfd\x7e"
    "|add a,(iy+*)\x00" "\x05" "\xfd\x86"
    "|adc a,(iy+*)\x00" "\x05" "\xfd\x8e"
    "|sub (iy+*)\x00"   "\x05" "\xfd\x96"
    "|sbc a,(iy+*)\x00" "\x05" "\xfd\x9e"
    "|and (iy+*)\x00"   "\x05" "\xfd\xa6"
    "|xor (iy+*)\x00"   "\x05" "\xfd\xae"
    "|or (iy+*)\x00"    "\x05" "\xfd\xb6"
    "|cp (iy+*)\x00"    "\x05" "\xfd\xbe"       // mode 5 -> 2 byte opcode (fd nn), 1 byte operand (xx)
    "|rlc (iy+*)\x00"   "\x04" "\xfd\xcb\x06"
    "|rrc (iy+*)\x00"   "\x04" "\xfd\xcb\x0e"
    "|rl (iy+*)\x00"    "\x04" "\xfd\xcb\x16"
    "|rr (iy+*)\x00"    "\x04" "\xfd\xcb\x1e"
    "|sla (iy+*)\x00"   "\x04" "\xfd\xcb\x26"
    "|sra (iy+*)\x00"   "\x04" "\xfd\xcb\x2e"
    "|bit 0,(iy+*)\x00" "\x04" "\xfd\xcb\x46"
    "|bit 1,(iy+*)\x00" "\x04" "\xfd\xcb\x4e"
    "|bit 2,(iy+*)\x00" "\x04" "\xfd\xcb\x56"
    "|bit 3,(iy+*)\x00" "\x04" "\xfd\xcb\x5e"
    "|bit 4,(iy+*)\x00" "\x04" "\xfd\xcb\x66"
    "|bit 5,(iy+*)\x00" "\x04" "\xfd\xcb\x6e"
    "|bit 6,(iy+*)\x00" "\x04" "\xfd\xcb\x76"
    "|bit 7,(iy+*)\x00" "\x04" "\xfd\xcb\x7e"
    "|res 0,(iy+*)\x00" "\x04" "\xfd\xcb\x86"
    "|res 1,(iy+*)\x00" "\x04" "\xfd\xcb\x8e"
    "|res 2,(iy+*)\x00" "\x04" "\xfd\xcb\x96"
    "|res 3,(iy+*)\x00" "\x04" "\xfd\xcb\x9e"
    "|res 4,(iy+*)\x00" "\x04" "\xfd\xcb\xa6"
    "|res 5,(iy+*)\x00" "\x04" "\xfd\xcb\xae"
    "|res 6,(iy+*)\x00" "\x04" "\xfd\xcb\xb6"
    "|res 7,(iy+*)\x00" "\x04" "\xfd\xcb\xbe"
    "|set 0,(iy+*)\x00" "\x04" "\xfd\xcb\xc6"
    "|set 1,(iy+*)\x00" "\x04" "\xfd\xcb\xce"
    "|set 2,(iy+*)\x00" "\x04" "\xfd\xcb\xd6"
    "|set 3,(iy+*)\x00" "\x04" "\xfd\xcb\xde"
    "|set 4,(iy+*)\x00" "\x04" "\xfd\xcb\xe6"
    "|set 5,(iy+*)\x00" "\x04" "\xfd\xcb\xee"
    "|set 6,(iy+*)\x00" "\x04" "\xfd\xcb\xf6"
    "|set 7,(iy+*)\x00" "\x04" "\xfd\xcb\xfe"  // mode 4 -> 3 byte opcode (fd cb xx nn), 1 byte signed operand (xx)
    "|pop iy\x00"       "\x03" "\xfd\xe1"
    "|ex (sp),iy\x00"   "\x03" "\xfd\xe3"
    "|push iy\x00"      "\x03" "\xfd\xe5"
    "|jp (iy)\x00"      "\x03" "\xfd\xe9"
    "|ld sp,iy\x00"     "\x03" "\xfd\xf9"  // mode 3 -> 2 byte opcode (fd nn), no operand
    "|cp *\x00"         "\x02" "\xfe"     // mode 2 -> 1 byte opcode, 1 byte operand
    "|rst 38h\x00"      "\x01" "\xff";    // mode 1 -> 1 byte opcode, no operand. 

typedef struct {
    int mode; 
    char * mne; // menomic string
} OPTAB; 

OPTAB OpCodeTab[255] = {0};
OPTAB OpCodeTabDDCB[256] = {0}; 
OPTAB OpCodeTabFDCB[256] = {0}; 
OPTAB OpCodeTabED[256] = {0}; 
OPTAB OpCodeTabDD[256] = {0}; 
OPTAB OpCodeTabCB[256] = {0}; 
OPTAB OpCodeTabFD[256] = {0}; 


void Z80::logCPU_setup()
{
    // build data for instr log
    int n; 
    int mode; 
    char *pMne; 
    int nOp; 
    OPTAB * pOpCodeTab; 

    uint8 * pOpcode = (uint8 *) sOpcodeList; // source list of z80 opcodes to be processed

    while(1) {
        // decode opcode
        if (pOpcode[0]==0) break; // list finished
        if (*pOpcode++ != '|') {
            bad_list: return; 
        }
        // now pOpcode="ld a,* " \x00 "m.."
        pMne=(char *) pOpcode; 
        n=strlen(pMne);
        pOpcode += n+1; 
        // now sMne="ld a,*" pOpcode="m.."
        // get mode
        mode=*pOpcode++;
        nOp =*pOpcode++; // get first opcode 
        if ((mode==1) || (mode==2) || (mode==8) || (mode==16)) { 
            // mode 1 -> 1 byte opcode, no operand. 
            // mode 2 -> 1 byte opcode, 1 byte operand
            // mode 8 -> 1 byte opcode, 2 byte operand
            // mode 16 -> 1 byte opcode, 1 byte PC-relative operand $+2
            pOpCodeTab=&OpCodeTab[nOp]; 
        } else if ((mode==3) || (mode==5) || (mode==6) || (mode==7)) { 
            // mode 3 -> 2 byte opcode (fd nn), no operand
            // mode 5 -> 2 byte opcode (fd nn xx), 1 byte operand (xx)
            // mode 6 -> 2 byte opcode (dd/fd nn xx xx), two 1 byte operand (xx xx), fist operane signed
            // mode 7 -> 2 byte opcode (fd nn xx xx), 2 byte operand (xx xx)
            if (nOp==0xdd) {
                nOp =*pOpcode++; // get second opcode 
                pOpCodeTab=&OpCodeTabDD[nOp]; 
            } else {
                nOp =*pOpcode++; // get second opcode 
                pOpCodeTab=&OpCodeTabFD[nOp]; 
            }
        } else if ((mode==9) || (mode==10)) { 
            // mode 9 -> 2 byte opcode (ed nn), no operand
            // mode 10 -> 2 byte opcode (ed nn xx xx), 2 byte operand (xx xx)
            nOp =*pOpcode++; // get second opcode 
            pOpCodeTab=&OpCodeTabED[nOp]; 
        } else if ((mode==11) || (mode==13) || (mode==14)) { 
            // mode 11 -> 2 byte opcode (dd nn), no operand
            // mode 13 -> 2 byte opcode (dd nn), 1 byte operand (xx)
            // mode 14 -> 2 byte opcode (dd nn), 2 byte operand (xx xx)
            nOp =*pOpcode++; // get second opcode 
            pOpCodeTab=&OpCodeTabDD[nOp]; 
        } else if (mode==15) { 
            // mode 15 -> 2 byte opcode (cd nn), no operand
            nOp =*pOpcode++; // get second opcode 
            pOpCodeTab=&OpCodeTabCB[nOp]; 
        } else if (mode==4) { 
            // mode 4 -> 3 byte opcode (fd cb xx nn), 1 byte operand (xx)
            *pOpcode++; // skip second opcode 
            nOp =*pOpcode++; // get third opcode 
            pOpCodeTab=&OpCodeTabFDCB[nOp]; 
        } else if (mode==12) { 
            // mode 12 -> 3 byte opcode (dd cb xx nn), 1 byte operand (xx)
            *pOpcode++; // skip second opcode 
            nOp =*pOpcode++; // get third opcode 
            pOpCodeTab=&OpCodeTabDDCB[nOp]; 
        } else goto bad_list; 
        // add mode and pointer to mnemonic string in selected OpCodeTable
        pOpCodeTab->mode=mode; 
        pOpCodeTab->mne=pMne; 
    }
}

void Z80::logCPU_Opcode ()
{
    extern int cpu_addr_log; 

    if (this) if (cpm) { /* log available */ } else return;

    if (cpu_addr_log > 0) {
        // addr for start cpu logging not reached yet.
        // check if reached
        if (cpu_addr_log != PC) {
            // not yet reached -> return without logging
            return; 
        }
        // logging add reached. Signal it
        cpu_addr_log = -cpu_addr_log; 
    }

    char sLog[250], sInstr[50];
    int b0, b1, b2, b3, mode, len, n; 
    char *mne; 
    char c; 
    b0=memory[PC]; b1=memory[(PC+1) & 0xFFFF]; b2=memory[(PC+2) & 0xFFFF]; b3=memory[(PC+3) & 0xFFFF]; 

    // avoid fill whe log with LDIR execution. Only place first one
    static int RepeatInstrflag=0; 
    if ((b0==0xed) && (b1==0xb0)) {
        // is LDIR instr
        if (RepeatInstrflag!=1) { RepeatInstrflag=1; /* first LDIR instr */ } 
        else return; 
    } else {
        RepeatInstrflag=0; // no repeat instr
    }

    len=1; mne = "???"; 
    if (b0==0xed) {
        mode=OpCodeTabED[b1].mode; // get mode for first opcode byte
        mne=OpCodeTabED[b1].mne;
        len=2; // instr length
    } else if (b0==0xcb) {
        mode=OpCodeTabCB[b1].mode; // get mode for first opcode byte
        mne=OpCodeTabCB[b1].mne;
        len=2; 
    } else if (b0==0xdd) {
        if (b1==0xcb) {
            mode=OpCodeTabDDCB[b3].mode; // get mode for first opcode byte
            mne=OpCodeTabDDCB[b3].mne;
            len=4; 
        } else {
            mode=OpCodeTabDD[b1].mode; 
            mne=OpCodeTabDD[b1].mne;
            len=2; 
        }
    } else if (b0==0xfd) {
        if (b1==0xcb) {
            mode=OpCodeTabFDCB[b3].mode; // get mode for first opcode byte
            mne=OpCodeTabFDCB[b3].mne;
            len=4; 
        } else {
            mode=OpCodeTabFD[b1].mode; // get mode for first opcode byte
            mne=OpCodeTabFD[b1].mne;
            len=2; 
        }
    } else {
        mode=OpCodeTab[b0].mode; // get mode for first opcode byte
        mne=OpCodeTab[b0].mne;
    }

    int op1, op2, b16bits, bSigned; 

    op1=op2=0; b16bits=bSigned=0;
    if (mode==1) {
        // mode 1 -> 1 byte opcode, no operand. 
        len=1;
    } else if (mode==2) {
        // mode 2 -> 1 byte opcode, 1 byte operand
        len=2; op1=b1; 
    } else if (mode==16) {
        // mode 16 -> 1 byte opcode, 1 byte PC-relative operand $+2
        len=2; op1=OpPC + 2 + (int8) b1; 
        b16bits=1; // operand is show as 16bit value with destination address
    } else if (mode==8) {
        // mode 8 -> 1 byte opcode, 2 byte operand
        len=3; op1=b1 + 256*b2;
        b16bits=1; // operand is show as 16bit value 
    } else if ((mode==3) || (mode==9) || (mode==11) || (mode==15)) {
        // mode 3 -> 2 byte opcode (fd nn), no operand
        // mode 9 -> 2 byte opcode (ed nn), no operand
        // mode 11 -> 2 byte opcode (dd nn), no operand
        // mode 15 -> 2 byte opcode (cd nn), no operand
        len=2; 
    } else if ((mode==5) || (mode==13)) {
        // mode 5 -> 2 byte opcode (fd nn), 1 byte operand (xx)
        // mode 13 -> 2 byte opcode (dd nn), 1 byte operand (xx)
        len=3; op1=b2; 
    } else if (mode==6) {
        // mode 6 -> 2 byte opcode (dd/fd nn xx xx), two 1 byte operand (xx xx), fist operane signed
        len=4; op1=b2; op2=b3; 
        if (op1>=128) op1=op1-256; 
        bSigned=1; 
    } else if ((mode==7) || (mode==10) || (mode==14)) {
        // mode 7 -> 2 byte opcode (fd nn xx xx), 2 byte operand (xx xx)
        // mode 10 -> 2 byte opcode (ed nn xx xx), 2 byte operand (xx xx)
        // mode 14 -> 2 byte opcode (dd nn), 2 byte operand (xx xx)
        len=4; op1=b2 + 256*b3;
        b16bits=1; // operand is show as 16bit value 
    } else if ((mode==4) || (mode==12)) {
        // mode 4 -> 3 byte opcode (fd cb xx nn), 1 byte operand (xx)
        // mode 12 -> 3 byte opcode (dd cb xx nn), 1 byte operand (xx)
        len=4; op1=b2; 
    } else {
        // mode not defined -> undefined instr
        mne = "???"; 
    }

    // prepare the instr string using menmonic + operand actual values
    n=0; 
    for (int i=0;;i++) {
        c=sInstr[n++]=mne[i];
        if (c==0) break; 
        if (c=='*') { // add 8/16 bit operand (and shift to next operand)
            if (bSigned) {
                if (op1 >= 0) {
                    sprintf_s(sInstr + n-2, 10, "+%02x", op1); 
                } else {
                    sprintf_s(sInstr + n-2, 10, "-%02x", -op1); 
                }
                bSigned=0; 
            } else {
                sprintf_s(sInstr + n-1, 10, (b16bits) ? "%04x":"%02x", op1); 
            }
            op1=op2; 
            n=strlen(sInstr); 
        }
    }

    // longest instr is: ld (iy+ff),ff 
    if (len==1) {
        sprintf_s(sLog, "%04x %02x          %-18s", PC, b0, sInstr); 
    } else if (len==2) {
        sprintf_s(sLog, "%04x %02x %02x       %-18s", PC, b0, b1, sInstr); 
    } else if (len==3) {
            sprintf_s(sLog, "%04x %02x %02x %02x    %-18s", PC, b0, b1, b2, sInstr); 
    } else {
            sprintf_s(sLog, "%04x %02x %02x %02x %02x %-18s", PC, b0, b1, b2, b3, sInstr); 
    }

    // registers with value BEFORE instr execution
    sprintf_s(sLog+strlen(sLog), 100, "AF=%04x BC=%04x DE=%04x HL=%04x IX=%04x IY=%04x SP=%04x ", 
                                       AF, BC, DE, HL, IX, IY, SP);	

    int ch_bc, ch_de, ch_hl; 
    ch_bc=memory[BC]; 
    ch_de=memory[DE]; 
    ch_hl=memory[HL]; 
    sprintf_s(sLog+strlen(sLog), 100, "[BC]=%02x '%c' [DE]=%02x '%c' [HL]=%02x '%c' \r\n", 
                                       ch_bc, ch_bc < 32 ? 32:ch_bc, 
                                       ch_de, ch_de < 32 ? 32:ch_de, 
                                       ch_hl, ch_hl < 32 ? 32:ch_hl);                                         
	cpm->PrtLog(sLog);	

}



// poner cpm_log flag
// visicalc hp125
// h89 graviton 

