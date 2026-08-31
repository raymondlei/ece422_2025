#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/rtos_ga702.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/rtos_ga702.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=src/app/taskBlinky.c src/app/taskSerial.c FreeRTOS/Source/croutine.c FreeRTOS/Source/event_groups.c FreeRTOS/Source/list.c FreeRTOS/Source/queue.c FreeRTOS/Source/stream_buffer.c FreeRTOS/Source/tasks.c FreeRTOS/Source/timers.c FreeRTOS/Source/portable/GCC/MemMang/heap_4.c FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.c FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S mcc_generated_files/system.c mcc_generated_files/traps.c mcc_generated_files/mcc.c mcc_generated_files/interrupt_manager.c mcc_generated_files/pin_manager.c mcc_generated_files/clock.c mcc_generated_files/uart1.c mcc_generated_files/oc3.c mcc_generated_files/oc2.c mcc_generated_files/oc1.c mcc_generated_files/tmr2.c src/main.c src/rtos_hooks.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/app/taskBlinky.o ${OBJECTDIR}/src/app/taskSerial.o ${OBJECTDIR}/FreeRTOS/Source/croutine.o ${OBJECTDIR}/FreeRTOS/Source/event_groups.o ${OBJECTDIR}/FreeRTOS/Source/list.o ${OBJECTDIR}/FreeRTOS/Source/queue.o ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o ${OBJECTDIR}/FreeRTOS/Source/tasks.o ${OBJECTDIR}/FreeRTOS/Source/timers.o ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/oc3.o ${OBJECTDIR}/mcc_generated_files/oc2.o ${OBJECTDIR}/mcc_generated_files/oc1.o ${OBJECTDIR}/mcc_generated_files/tmr2.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/rtos_hooks.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/app/taskBlinky.o.d ${OBJECTDIR}/src/app/taskSerial.o.d ${OBJECTDIR}/FreeRTOS/Source/croutine.o.d ${OBJECTDIR}/FreeRTOS/Source/event_groups.o.d ${OBJECTDIR}/FreeRTOS/Source/list.o.d ${OBJECTDIR}/FreeRTOS/Source/queue.o.d ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o.d ${OBJECTDIR}/FreeRTOS/Source/tasks.o.d ${OBJECTDIR}/FreeRTOS/Source/timers.o.d ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o.d ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o.d ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/traps.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d ${OBJECTDIR}/mcc_generated_files/uart1.o.d ${OBJECTDIR}/mcc_generated_files/oc3.o.d ${OBJECTDIR}/mcc_generated_files/oc2.o.d ${OBJECTDIR}/mcc_generated_files/oc1.o.d ${OBJECTDIR}/mcc_generated_files/tmr2.o.d ${OBJECTDIR}/src/main.o.d ${OBJECTDIR}/src/rtos_hooks.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/app/taskBlinky.o ${OBJECTDIR}/src/app/taskSerial.o ${OBJECTDIR}/FreeRTOS/Source/croutine.o ${OBJECTDIR}/FreeRTOS/Source/event_groups.o ${OBJECTDIR}/FreeRTOS/Source/list.o ${OBJECTDIR}/FreeRTOS/Source/queue.o ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o ${OBJECTDIR}/FreeRTOS/Source/tasks.o ${OBJECTDIR}/FreeRTOS/Source/timers.o ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/oc3.o ${OBJECTDIR}/mcc_generated_files/oc2.o ${OBJECTDIR}/mcc_generated_files/oc1.o ${OBJECTDIR}/mcc_generated_files/tmr2.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/rtos_hooks.o

# Source Files
SOURCEFILES=src/app/taskBlinky.c src/app/taskSerial.c FreeRTOS/Source/croutine.c FreeRTOS/Source/event_groups.c FreeRTOS/Source/list.c FreeRTOS/Source/queue.c FreeRTOS/Source/stream_buffer.c FreeRTOS/Source/tasks.c FreeRTOS/Source/timers.c FreeRTOS/Source/portable/GCC/MemMang/heap_4.c FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.c FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S mcc_generated_files/system.c mcc_generated_files/traps.c mcc_generated_files/mcc.c mcc_generated_files/interrupt_manager.c mcc_generated_files/pin_manager.c mcc_generated_files/clock.c mcc_generated_files/uart1.c mcc_generated_files/oc3.c mcc_generated_files/oc2.c mcc_generated_files/oc1.c mcc_generated_files/tmr2.c src/main.c src/rtos_hooks.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/rtos_ga702.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ256GA702
MP_LINKER_FILE_OPTION=,--script=p24FJ256GA702.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/app/taskBlinky.o: src/app/taskBlinky.c  .generated_files/flags/default/3ca1ff4aa2cbcba388277914b55dfedfcda40857 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/app" 
	@${RM} ${OBJECTDIR}/src/app/taskBlinky.o.d 
	@${RM} ${OBJECTDIR}/src/app/taskBlinky.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/app/taskBlinky.c  -o ${OBJECTDIR}/src/app/taskBlinky.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/app/taskBlinky.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/app/taskSerial.o: src/app/taskSerial.c  .generated_files/flags/default/2002438576c653f130fc49b6060561fcd8c6bda2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/app" 
	@${RM} ${OBJECTDIR}/src/app/taskSerial.o.d 
	@${RM} ${OBJECTDIR}/src/app/taskSerial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/app/taskSerial.c  -o ${OBJECTDIR}/src/app/taskSerial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/app/taskSerial.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/croutine.o: FreeRTOS/Source/croutine.c  .generated_files/flags/default/72eedf7c7ac4e5812f675d8b5d9a7f519b68fb92 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/croutine.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/croutine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/croutine.c  -o ${OBJECTDIR}/FreeRTOS/Source/croutine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/croutine.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/event_groups.o: FreeRTOS/Source/event_groups.c  .generated_files/flags/default/60eddb339cb4c68901498ee3415d8be6b7e0befc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/event_groups.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/event_groups.c  -o ${OBJECTDIR}/FreeRTOS/Source/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/event_groups.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/list.o: FreeRTOS/Source/list.c  .generated_files/flags/default/ffb4c9fc532cf1a4508aa10082aec6e1e2f9efd9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/list.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/list.c  -o ${OBJECTDIR}/FreeRTOS/Source/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/list.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/queue.o: FreeRTOS/Source/queue.c  .generated_files/flags/default/beb1c02d185ef83373880f0e5851c278595d0cb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/queue.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/queue.c  -o ${OBJECTDIR}/FreeRTOS/Source/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/queue.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o: FreeRTOS/Source/stream_buffer.c  .generated_files/flags/default/2bffdc7105f383b784cfe70f467664c500505e2e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/stream_buffer.c  -o ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/tasks.o: FreeRTOS/Source/tasks.c  .generated_files/flags/default/5c75e4b993233a84114615184f23a36fb7e5ad0d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/tasks.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/tasks.c  -o ${OBJECTDIR}/FreeRTOS/Source/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/tasks.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/timers.o: FreeRTOS/Source/timers.c  .generated_files/flags/default/8ad95b7d7418ce6f345831bb444f6ee89eb0f044 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/timers.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/timers.c  -o ${OBJECTDIR}/FreeRTOS/Source/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/timers.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o: FreeRTOS/Source/portable/GCC/MemMang/heap_4.c  .generated_files/flags/default/eceb59928866de6aa082a7b74707bc75cde2660c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/portable/GCC/MemMang/heap_4.c  -o ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o: FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.c  .generated_files/flags/default/18c7ba6b366d35d5690ea53e410b4c23dc565fe5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/2296621c1e55adb771842e3d718f849ef8c465e3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/c61fb78a6577dd16a22f8e4f9c668b148777406b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/e241e44fed7c3a201bf08b35091fc05e6fd7b46 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/3e6592ad8df94d4920c730c7f002814698a15793 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/5056df40091e65ff6921bb57e08ac20268ebbd5a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/35c2f86e80a87f028212fa70acaba2bc1a2f23b6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/default/6c15485cd89a131e8cce6cc49b07c97e722add82 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/oc3.o: mcc_generated_files/oc3.c  .generated_files/flags/default/ec2a91772833773aee5dd53190ee1b4e13b4ac9e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/oc3.c  -o ${OBJECTDIR}/mcc_generated_files/oc3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/oc3.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/oc2.o: mcc_generated_files/oc2.c  .generated_files/flags/default/20ac6d524ffdb457bf7c2e17b20563124e0744c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/oc2.c  -o ${OBJECTDIR}/mcc_generated_files/oc2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/oc2.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/oc1.o: mcc_generated_files/oc1.c  .generated_files/flags/default/34287e6332204d77c8e007002c88928281bd1281 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/oc1.c  -o ${OBJECTDIR}/mcc_generated_files/oc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/oc1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/tmr2.o: mcc_generated_files/tmr2.c  .generated_files/flags/default/e0fa3222c2d9ccb768fb0d7b7efa258370e1486e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr2.c  -o ${OBJECTDIR}/mcc_generated_files/tmr2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr2.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/default/fb79f061ed3aafce3b8c0b1cba028dc15f0c48a6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/rtos_hooks.o: src/rtos_hooks.c  .generated_files/flags/default/70ef6970d898de07bccda6baa2fb61925ccace2f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/rtos_hooks.o.d 
	@${RM} ${OBJECTDIR}/src/rtos_hooks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/rtos_hooks.c  -o ${OBJECTDIR}/src/rtos_hooks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/rtos_hooks.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/src/app/taskBlinky.o: src/app/taskBlinky.c  .generated_files/flags/default/6ad8cc5a27ce33a1c1b090a2f8a993a1f3b30184 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/app" 
	@${RM} ${OBJECTDIR}/src/app/taskBlinky.o.d 
	@${RM} ${OBJECTDIR}/src/app/taskBlinky.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/app/taskBlinky.c  -o ${OBJECTDIR}/src/app/taskBlinky.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/app/taskBlinky.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/app/taskSerial.o: src/app/taskSerial.c  .generated_files/flags/default/a34cca8e7bbdd0ebdd5fd50498cdbfc25d107b14 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/app" 
	@${RM} ${OBJECTDIR}/src/app/taskSerial.o.d 
	@${RM} ${OBJECTDIR}/src/app/taskSerial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/app/taskSerial.c  -o ${OBJECTDIR}/src/app/taskSerial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/app/taskSerial.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/croutine.o: FreeRTOS/Source/croutine.c  .generated_files/flags/default/8c5a66d1d00d05bfd707c3540b9ab5f56b63248c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/croutine.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/croutine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/croutine.c  -o ${OBJECTDIR}/FreeRTOS/Source/croutine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/croutine.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/event_groups.o: FreeRTOS/Source/event_groups.c  .generated_files/flags/default/bc9f8d2cc27ab1d785e1e0452f0c270138f53e99 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/event_groups.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/event_groups.c  -o ${OBJECTDIR}/FreeRTOS/Source/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/event_groups.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/list.o: FreeRTOS/Source/list.c  .generated_files/flags/default/e5be8397bebf9a11765f867a69c2af2000ec274b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/list.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/list.c  -o ${OBJECTDIR}/FreeRTOS/Source/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/list.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/queue.o: FreeRTOS/Source/queue.c  .generated_files/flags/default/86c41f4149b5d7113e6e07c13ff882f21bb8607f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/queue.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/queue.c  -o ${OBJECTDIR}/FreeRTOS/Source/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/queue.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o: FreeRTOS/Source/stream_buffer.c  .generated_files/flags/default/8875a8b71133e7470a086831c379f3c5b66bc806 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/stream_buffer.c  -o ${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/stream_buffer.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/tasks.o: FreeRTOS/Source/tasks.c  .generated_files/flags/default/54bff5ca043f63fa2b88baec9dc1f283ee43786d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/tasks.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/tasks.c  -o ${OBJECTDIR}/FreeRTOS/Source/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/tasks.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/timers.o: FreeRTOS/Source/timers.c  .generated_files/flags/default/7893ffab36c4a735edf6f4bc564116c91d992052 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/timers.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/timers.c  -o ${OBJECTDIR}/FreeRTOS/Source/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/timers.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o: FreeRTOS/Source/portable/GCC/MemMang/heap_4.c  .generated_files/flags/default/798fb7087f24d95c6dd29351df1e927b30bb9261 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/portable/GCC/MemMang/heap_4.c  -o ${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/GCC/MemMang/heap_4.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o: FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.c  .generated_files/flags/default/b2a43bd6b1fb7381911d160b7ee9a1f545cd1dae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/port.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/f57860bf28497c84e61352e167bfe89724ba76a3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/1331b13376c2e59f57a286e2bbaf8af6a0c69149 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/c769542074b5513c51793b08754a633eb695864e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/c38e2d4eaf39b466819437f98665de59b8264541 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/d8c83bb68d817671e815e856af724d6784265330 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/e5a0a489c2ee6dab2ba83697da4e1fb4e9d78438 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/default/ad0b0ae443718b44695f9f57e33f0d6e1f93b272 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/oc3.o: mcc_generated_files/oc3.c  .generated_files/flags/default/62195af4064fc7e4aed2f7b48384566706f3724a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/oc3.c  -o ${OBJECTDIR}/mcc_generated_files/oc3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/oc3.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/oc2.o: mcc_generated_files/oc2.c  .generated_files/flags/default/bbf465c5dc9bdf62e68da35a2dfea84dddb60233 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/oc2.c  -o ${OBJECTDIR}/mcc_generated_files/oc2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/oc2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/oc1.o: mcc_generated_files/oc1.c  .generated_files/flags/default/aa28e29a8ab16e52bba8c2de79e6caaf2ac0599e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/oc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/oc1.c  -o ${OBJECTDIR}/mcc_generated_files/oc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/oc1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/tmr2.o: mcc_generated_files/tmr2.c  .generated_files/flags/default/45562acd04efda15fd8b1c472c5a28d62917d4af .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr2.c  -o ${OBJECTDIR}/mcc_generated_files/tmr2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/default/c6a858fb5ccd6b969b00f53411c65e1c89bd37cc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/rtos_hooks.o: src/rtos_hooks.c  .generated_files/flags/default/ae1a756c9c8cd43f63ebd018ba3260c20e5de7ca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/rtos_hooks.o.d 
	@${RM} ${OBJECTDIR}/src/rtos_hooks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/rtos_hooks.c  -o ${OBJECTDIR}/src/rtos_hooks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/rtos_hooks.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -mlarge-code -msmall-data -O0 -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o: FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S  .generated_files/flags/default/d9ea4155e576e15c5020425d3061fe183c6433ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d"  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -Wa,-MD,"${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o: FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  .generated_files/flags/default/7e35ea84e731c557379f18544b815820d1d32119 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.d"  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -Wa,-MD,"${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o: FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S  .generated_files/flags/default/f9d51644488356c90b2d3d1efc07226b56814895 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -Wa,-MD,"${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o: FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  .generated_files/flags/default/6e0da5a5cf0ad9684d9a53310d6ae52c0847f35f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  -o ${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -Wa,-MD,"${OBJECTDIR}/FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/rtos_ga702.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/rtos_ga702.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app"     -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/rtos_ga702.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/rtos_ga702.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"src/config" -I"FreeRTOS/Source/include" -I"FreeRTOS/Source/portable/MPLAB/PIC24_dsPIC" -I"src/app" -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/rtos_ga702.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
