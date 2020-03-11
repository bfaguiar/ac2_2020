#include <detpic32.h>
#include "../tools/delay.c"

int main() 
{
	LATDbits.LATD0 = 0;
	TRISDbits.TRISD0 = 0;

	while(1)
	{
		LATDbits.LATD0 = !LATDbits.LATD0;
		delay(500);
	}

	return 0;
}

