/*
 * Header file for counter implementation
 */
//Standard includes
#include <stdint.h>
#include <stdbool.h>


//Define enumerated values
typedef enum
{
    eMode_up,
    eMode_down,
    eMode_dual_slope

}CounterMode_enum;

//Define data structure
struct counter_st
{
    CounterMode_enum mode;
    uint16_t prescaler;
    uint16_t top;
    uint16_t match;
    uint16_t step_size;
    uint16_t current_count;
    bool up_counting;
};

typedef struct counter_st* Counter_t;

/*
 * Function Prototypes
 */
void counter_init(Counter_t obj);
void counter_inc(Counter_t obj);
void counter_dec(Counter_t obj);
void counter_run(Counter_t obj);
