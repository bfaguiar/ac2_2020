#include  <detpic32.h>
#include "../tools/delay.c"

int main ()
{
	LATE = LATE & 0xF0;
	TRISE = TRISE & 0xF0;

	while(1)
	{
		LATE = (LATE + 0x01) & 0x0F;
		//LATE = (LATE + 1) % 16; // alternative way
		delay(2000);
	}
}

 