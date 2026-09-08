#ifndef BOARD_H
#define	BOARD_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <pin_manager.h>
#include <system.h>

#define LED_1    RB10
#define LED_2    RB11
#define LED_3    RB12    
    

#define IO(x, y, z)   x ## y ## z
#define IO_TOGGLE(n)  IO(IO_, n, _Toggle())
#define IO_SET(n)     IO(IO_, n, _SetHigh())
#define IO_CLEAR(n)   IO(IO_, n, _SetLow())

#ifdef	__cplusplus
}
#endif

#endif	/* BOARD_H */

