#ifndef STRINGBUILDER_H_
#define STRINGBUILDER_H_

#include <stdint.h>
#include <stdbool.h>

struct strBuilder_st;
typedef struct strBuilder_st* StrBuilder_t;

#ifdef __cplusplus
extern "C"
{
#endif

extern void StrBuilder_init(StrBuilder_t obj, char* buf, uint16_t buf_size);
extern StrBuilder_t StrBuilder_create(char* buf, uint16_t buf_size);
extern void StrBuilder_destroy(StrBuilder_t obj);

extern _Bool StrBuilder_appendChar(StrBuilder_t obj, char c);
extern _Bool StrBuilder_appendString(StrBuilder_t obj, char* buf, uint16_t buf_size);

extern uint16_t StrBuilder_export(StrBuilder_t obj, char* out_buf, uint16_t out_buf_size);

//properties
extern uint16_t StrBuilder_getCurrentSize(StrBuilder_t obj);

#ifdef __cplusplus
}
#endif

#endif /* STRINGBUILDER_H_ */
