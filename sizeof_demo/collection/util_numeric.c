
#include "util_numeric.h"

bool Numeric_isInRange(uint16_t input, uint16_t min, uint16_t max)
{
    if(input > min)
    {
        if(input < max)
            return true;
    }

    return false;
}
