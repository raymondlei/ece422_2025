#ifndef FSM_H
#define FSM_H

#include <stdint.h>
#include <stdbool.h>

typedef enum
{
    eAppState_init,
    eAppState_idle,
    eAppState_user_input,
    eAppState_led_playback,
    eAppState_exception,

    eAppState_max  //Maximum number of states

}app_state_enum;

typedef enum
{
    eState_entry,
    eState_loop,
    eState_exit,
    eState_abort,

    eState_max  //Maximum number of internal states
}internal_state_enum;

struct app_model_st
{
    app_state_enum app_state;
    uint32_t flags;
    char user_input;
    uint8_t score;
};
typedef struct app_model_st* app_model_t;

app_model_t AppModel_get(void);
void FsmMain_switch_state(app_state_enum new_state);
void FsmMain_init(void);
void FsmMain_run(void);

void fsm_init(app_model_t model);
void fsm_idle(app_model_t model);
void fsm_get_user_input(app_model_t model);
void fsm_led_playback(app_model_t model);
void fsm_exception(app_model_t model);

#endif // FSM_H
