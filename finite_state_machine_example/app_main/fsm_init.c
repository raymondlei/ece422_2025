#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include "fsm.h"

static internal_state_enum _internal_state;
static uint32_t _loop_counter = 0;


static inline void _exit(app_state_enum dst_state)
{
    _internal_state = eState_entry;
    FsmMain_switch_state(dst_state);
}

static inline void _abort(app_state_enum dst_state)
{
    _internal_state = eState_entry;
    FsmMain_switch_state(dst_state);
}

void fsm_init(app_model_t model)
{
    switch(_internal_state)
    {
        case eState_entry:
            _loop_counter = 0;

            // Entry actions for init state
            printf("Entering init state\n");

            if( 1 /* some next condition */)
                _internal_state = eState_loop;
            break;
        case eState_loop:
            // Loop actions for init state
            printf("In init state loop, loop counter: %u\n", _loop_counter);

            //EXIT condition
            if(  _loop_counter++ > 10 /* some exit condition */)
                _internal_state = eState_exit; // Transition to exit state after loop actions

            //ABORT condition
            if( 0 /* some abort condition */)
                _internal_state = eState_abort; // Transition to abort state if needed
            break;
        case eState_exit:
            // Exit actions for init state
            _exit(eAppState_led_playback); // Example: switch to LED playback state after exit
            break;
        case eState_abort:
            // Abort actions for init state
            _abort(eAppState_exception); // Example: switch to exception state after abort
            break;
        default:
            break;
    }
}
