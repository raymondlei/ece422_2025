#include <stdint.h>
#include <stdbool.h>

#include "fsm.h"

// Application model instance
static struct app_model_st _model;

app_model_t AppModel_get(void)
{
    return &_model;
}

void FsmMain_switch_state(app_state_enum new_state)
{
    _model.app_state = new_state;
}

void FsmMain_init(void)
{
    _model.app_state = eAppState_init;
    _model.flags = 0;
    _model.user_input = '\0';
    _model.score = 0;
}

void FsmMain_run(void)
{
    switch(_model.app_state)
    {
        case eAppState_init: fsm_init(&_model); break;
        case eAppState_idle: fsm_idle(&_model); break;
        case eAppState_user_input: fsm_get_user_input(&_model); break;
        case eAppState_led_playback: fsm_led_playback(&_model); break;
        case eAppState_exception: fsm_exception(&_model); break;
        default: break;
    }
}
