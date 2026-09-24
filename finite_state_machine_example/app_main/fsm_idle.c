#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include "fsm.h"

static internal_state_enum _internal_state;

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

void fsm_idle(app_model_t model)
{
    switch(_internal_state)
    {
        case eState_entry:
            // Entry actions for user input state
            printf("Entering idle state\n");

            //NEXT condition
            if( 1 /* some next condition */)
                _internal_state = eState_loop;
            break;
        case eState_loop:
            // Loop actions for user input state
            printf(".");

            //EXIT condition
            if( 0 /* some exit condition */)
                _internal_state = eState_exit; // Transition to exit state after loop actions
            break;
        case eState_exit:
            // Exit actions for user input state
            _exit(eAppState_led_playback); // Example: switch to LED playback state after exit
            break;
        default:
            break;
    }
}
