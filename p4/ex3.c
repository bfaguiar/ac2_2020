#include <detpic32.h>

int main()
{
	LATB = LATB & 0x00FF;
	LATDbits.LATD5 = 0;
	LATDbits.LATD6 = 1;

	TRISB = TRISB & 0x00FF;
	TRISDbits.TRISD5 = 0;
	TRISDbits.TRISD6 = 0;

	while(1)
	{
		char c = getChar();
		putChar(c);
		LATB = LATB & 0x00FF;
		switch(c)
		{
			case 'a':
				LATB = 0x0100;
				break;
			case 'b':
				LATB = 0x0200;
				break;
			case 'c':
				LATB = 0x0400;
				break;
			case 'd':
				LATB = 0x0800;
				break;
			case 'e':
				LATB = 0x1000;
				break;
			case 'f':
				LATB = 0x2000;
				break;
			case 'g':
				LATB = 0x4000;
				break;
			case '.':
				LATB = 0x8000;
		}
	}
}