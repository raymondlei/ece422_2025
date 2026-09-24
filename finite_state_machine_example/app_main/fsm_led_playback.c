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

void fsm_led_playback(app_model_t model)
{
    switch(_internal_state)
    {
        case eState_entry:
            // Entry actions for LED playback state
            printf("Entering LED playback state\n");
            //NEXT condition
            if( 1 /* some next condition */)
                _internal_state = eState_loop;
            break;
        case eState_loop:
            // Loop actions for LED playback state
            printf("In LED playback state loop\n");

            //EXIT condition
            if( 1 /* some exit condition */)
                _internal_state = eState_exit; // Transition to exit state after loop actions

            //ABORT condition
            if( 0 /* some abort condition */)
                _internal_state = eState_abort; // Transition to abort state if needed
            break;
        case eState_exit:
            // Exit actions for LED playback state
            _exit(eAppState_user_input); // Example: switch to user input state after exit
            break;
        case eState_abort:
            // Abort actions for LED playback state
            _abort(eAppState_exception); // Example: switch to user input state after abort
            break;
        default:
            break;
    }
}
