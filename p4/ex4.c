#include <detpic32.h>
#include "../tools/delay.c"

int main() 
{
	LATB = LATB & 0x00FF;
	LATDbits.LATD5 = 1;
	LATDbits.LATD6 = 0;

	TRISB = TRISB & 0x80FF;
	TRISDbits.TRISD5 = 0;
	TRISDbits.TRISD6 = 0;

	while(1)
	{
		LATDbits.LATD5 = !LATDbits.LATD5;
		LATDbits.LATD6 = !LATDbits.LATD6;
		char segment = 1;
		int i;
		for (i = 0; i < 7; i++)
		{
			LATB = (LATB & 0x00FF) | (segment << 8);
			delay(1000);
			segment = segment << 1;
		}
	} return 0;
}

