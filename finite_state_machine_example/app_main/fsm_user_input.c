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

void fsm_get_user_input(app_model_t model)
{
    switch(_internal_state)
    {
        case eState_entry:
            // Entry actions for user input state
            printf("Entering user input state\n");

            //NEXT condition
            if( 1 /* some next condition */)
                _internal_state = eState_loop;
            break;
        case eState_loop:
            // Loop actions for user input state
            printf("In user input state loop\n");

            //update field in the model
            model->score++;

            //EXIT condition
            if( 1 /* some exit condition */)
                _internal_state = eState_exit; // Transition to exit state after loop actions

            //ABORT condition
            if( 0 /* some abort condition */)
                _internal_state = eState_abort; // Transition to abort state if needed
            break;
        case eState_exit:
            // Exit actions for user input state
            _exit(eAppState_idle); // Example: switch to LED playback state after exit
            break;
        case eState_abort:
            // Abort actions for user input state
            _abort(eAppState_exception); // Example: switch to exception state after abort
            break;
        default:
            break;
    }
}
