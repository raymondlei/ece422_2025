#ifndef BOARD_H
#define	BOARD_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <pin_manager.h>
#include <system.h>

#define LED_2    RB7    
#define LED_3    RB3    
    

#define IO(x, y, z)    x ## y ## z
#define IO_TOGGLE(n)    IO(IO_, n, _Toggle())

#ifdef	__cplusplus
}
#endif

#endif	/* BOARD_H */

