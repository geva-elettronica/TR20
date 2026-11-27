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
FINAL_IMAGE=${DISTDIR}/TR20-Test.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/TR20-Test.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=mcc_generated_files/peripheral/src/exint.c mcc_generated_files/spi/src/spi0.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/protected_io.S mcc_generated_files/system/src/cpu.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/cpuint.c mcc_generated_files/system/src/system.c mcc_generated_files/tc16/src/tc1.c mcc_generated_files/tc16/src/tc3.c mcc_generated_files/touch/example/touch_example.c mcc_generated_files/touch/touch.c mcc_generated_files/uart/src/usart0.c main.c ../Library/mfrc630.c ../Library/TR20_hw.c ../Library/Timer.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o ${OBJECTDIR}/mcc_generated_files/touch/touch.o ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o ${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/150355788/mfrc630.o ${OBJECTDIR}/_ext/150355788/TR20_hw.o ${OBJECTDIR}/_ext/150355788/Timer.o
POSSIBLE_DEPFILES=${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d ${OBJECTDIR}/mcc_generated_files/touch/touch.o.d ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/_ext/150355788/mfrc630.o.d ${OBJECTDIR}/_ext/150355788/TR20_hw.o.d ${OBJECTDIR}/_ext/150355788/Timer.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o ${OBJECTDIR}/mcc_generated_files/touch/touch.o ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o ${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/150355788/mfrc630.o ${OBJECTDIR}/_ext/150355788/TR20_hw.o ${OBJECTDIR}/_ext/150355788/Timer.o

# Source Files
SOURCEFILES=mcc_generated_files/peripheral/src/exint.c mcc_generated_files/spi/src/spi0.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/protected_io.S mcc_generated_files/system/src/cpu.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/cpuint.c mcc_generated_files/system/src/system.c mcc_generated_files/tc16/src/tc1.c mcc_generated_files/tc16/src/tc3.c mcc_generated_files/touch/example/touch_example.c mcc_generated_files/touch/touch.c mcc_generated_files/uart/src/usart0.c main.c ../Library/mfrc630.c ../Library/TR20_hw.c ../Library/Timer.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/TR20-Test.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATmega328PB
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o: mcc_generated_files/peripheral/src/exint.c  .generated_files/flags/default/2e6263f32e3846a5cc108f4ff5be5a7751617ead .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/peripheral/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o -o ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o mcc_generated_files/peripheral/src/exint.c 
	
${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o: mcc_generated_files/spi/src/spi0.c  .generated_files/flags/default/2a5f9fcd3d0c26c2b19b07b979c90ae36a83fa2a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/spi/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o -o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o mcc_generated_files/spi/src/spi0.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/68d2d47f57668bc3b552edbc535b32f3ae1da70 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/pins.o -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o mcc_generated_files/system/src/pins.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/cpu.o: mcc_generated_files/system/src/cpu.c  .generated_files/flags/default/51fd70c75a1aa2b97ede704bcadeb3b26c81d7da .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o -o ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o mcc_generated_files/system/src/cpu.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/6ffc21abf16b6f5d6daa3796cba7c1830a4ec0c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o mcc_generated_files/system/src/config_bits.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o: mcc_generated_files/system/src/cpuint.c  .generated_files/flags/default/7c597fed5440fc23023b37ddd16baaf890678238 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o -o ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o mcc_generated_files/system/src/cpuint.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/15c617eb5341c2eb831785feefdd45700229c5aa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/system.o -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o mcc_generated_files/system/src/system.c 
	
${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o: mcc_generated_files/tc16/src/tc1.c  .generated_files/flags/default/8383abebba5f79fe824707b334ca35c5f60b3617 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tc16/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o -o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o mcc_generated_files/tc16/src/tc1.c 
	
${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o: mcc_generated_files/tc16/src/tc3.c  .generated_files/flags/default/1b4f9bad76b0afa73b61fe2e7672a174078b5f91 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tc16/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o -o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o mcc_generated_files/tc16/src/tc3.c 
	
${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o: mcc_generated_files/touch/example/touch_example.c  .generated_files/flags/default/e4bafe40fef9dc38872abc5bb1e574069b35f81f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/touch/example" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d" -MT "${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d" -MT ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o -o ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o mcc_generated_files/touch/example/touch_example.c 
	
${OBJECTDIR}/mcc_generated_files/touch/touch.o: mcc_generated_files/touch/touch.c  .generated_files/flags/default/f65fb3555ec3e0f7667b10b41fa5cf577c8abbec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/touch" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/touch.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/touch.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/touch/touch.o.d" -MT "${OBJECTDIR}/mcc_generated_files/touch/touch.o.d" -MT ${OBJECTDIR}/mcc_generated_files/touch/touch.o -o ${OBJECTDIR}/mcc_generated_files/touch/touch.o mcc_generated_files/touch/touch.c 
	
${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o: mcc_generated_files/uart/src/usart0.c  .generated_files/flags/default/5582b002d6e3fa36b9d38dc898726594cf6fe7d7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o -o ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o mcc_generated_files/uart/src/usart0.c 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/c2c9f6b265d2bb34522b27f531cf3322e2bd2cb2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
${OBJECTDIR}/_ext/150355788/mfrc630.o: ../Library/mfrc630.c  .generated_files/flags/default/63aa9e1ce38a6546097d9ff0a3f7e5b990910952 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/150355788" 
	@${RM} ${OBJECTDIR}/_ext/150355788/mfrc630.o.d 
	@${RM} ${OBJECTDIR}/_ext/150355788/mfrc630.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/150355788/mfrc630.o.d" -MT "${OBJECTDIR}/_ext/150355788/mfrc630.o.d" -MT ${OBJECTDIR}/_ext/150355788/mfrc630.o -o ${OBJECTDIR}/_ext/150355788/mfrc630.o ../Library/mfrc630.c 
	
${OBJECTDIR}/_ext/150355788/TR20_hw.o: ../Library/TR20_hw.c  .generated_files/flags/default/4b82b67b9fa5cbaa3b93d688e54ef19b78c555da .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/150355788" 
	@${RM} ${OBJECTDIR}/_ext/150355788/TR20_hw.o.d 
	@${RM} ${OBJECTDIR}/_ext/150355788/TR20_hw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/150355788/TR20_hw.o.d" -MT "${OBJECTDIR}/_ext/150355788/TR20_hw.o.d" -MT ${OBJECTDIR}/_ext/150355788/TR20_hw.o -o ${OBJECTDIR}/_ext/150355788/TR20_hw.o ../Library/TR20_hw.c 
	
${OBJECTDIR}/_ext/150355788/Timer.o: ../Library/Timer.c  .generated_files/flags/default/c443b8057490c57ffd8bbf53012051ecbf004bc3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/150355788" 
	@${RM} ${OBJECTDIR}/_ext/150355788/Timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/150355788/Timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/150355788/Timer.o.d" -MT "${OBJECTDIR}/_ext/150355788/Timer.o.d" -MT ${OBJECTDIR}/_ext/150355788/Timer.o -o ${OBJECTDIR}/_ext/150355788/Timer.o ../Library/Timer.c 
	
else
${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o: mcc_generated_files/peripheral/src/exint.c  .generated_files/flags/default/1db05a90e741d1c478e5ad630da5ab2cdbb98d0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/peripheral/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o -o ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o mcc_generated_files/peripheral/src/exint.c 
	
${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o: mcc_generated_files/spi/src/spi0.c  .generated_files/flags/default/4e46a6ee18e5a1a8085da3c5de9afd16622e97e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/spi/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o -o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o mcc_generated_files/spi/src/spi0.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/30e7b6682cb94a822dffa23d5b940cf353b2d236 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/pins.o -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o mcc_generated_files/system/src/pins.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/cpu.o: mcc_generated_files/system/src/cpu.c  .generated_files/flags/default/6acf39e0e52b8fa8719b34b763a2c948061da56 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o -o ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o mcc_generated_files/system/src/cpu.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/652cf2b7be9426c91e62fdc56fdf57d036603108 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o mcc_generated_files/system/src/config_bits.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o: mcc_generated_files/system/src/cpuint.c  .generated_files/flags/default/30bd4f1b029db611b57335393d35dd442df4340c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o -o ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o mcc_generated_files/system/src/cpuint.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/92c0730b9928083c6f316200c32cad6e26aa15d5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/system.o -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o mcc_generated_files/system/src/system.c 
	
${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o: mcc_generated_files/tc16/src/tc1.c  .generated_files/flags/default/b191cdff917d214d3a8937fd45e5603ab3fca668 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tc16/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o -o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o mcc_generated_files/tc16/src/tc1.c 
	
${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o: mcc_generated_files/tc16/src/tc3.c  .generated_files/flags/default/ee0dd9d411769750e81e60e21f60b57fc1ac7b6c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tc16/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o -o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o mcc_generated_files/tc16/src/tc3.c 
	
${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o: mcc_generated_files/touch/example/touch_example.c  .generated_files/flags/default/875323076c4c548d870a56d3d475cc1d6e1cb260 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/touch/example" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d" -MT "${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d" -MT ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o -o ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o mcc_generated_files/touch/example/touch_example.c 
	
${OBJECTDIR}/mcc_generated_files/touch/touch.o: mcc_generated_files/touch/touch.c  .generated_files/flags/default/54e218dcd0e6c56f0fd450ff33d6eac4cfd0189a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/touch" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/touch.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/touch.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/touch/touch.o.d" -MT "${OBJECTDIR}/mcc_generated_files/touch/touch.o.d" -MT ${OBJECTDIR}/mcc_generated_files/touch/touch.o -o ${OBJECTDIR}/mcc_generated_files/touch/touch.o mcc_generated_files/touch/touch.c 
	
${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o: mcc_generated_files/uart/src/usart0.c  .generated_files/flags/default/e25a09dbf76288a2b4c3bae85486217beb0e165f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o -o ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o mcc_generated_files/uart/src/usart0.c 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/9bc3ad7d34fcc689fbe34b1b2e9f2b5b14629b2f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
${OBJECTDIR}/_ext/150355788/mfrc630.o: ../Library/mfrc630.c  .generated_files/flags/default/4dc5d16e474450fce45cc1d45ec0337ed862de45 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/150355788" 
	@${RM} ${OBJECTDIR}/_ext/150355788/mfrc630.o.d 
	@${RM} ${OBJECTDIR}/_ext/150355788/mfrc630.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/150355788/mfrc630.o.d" -MT "${OBJECTDIR}/_ext/150355788/mfrc630.o.d" -MT ${OBJECTDIR}/_ext/150355788/mfrc630.o -o ${OBJECTDIR}/_ext/150355788/mfrc630.o ../Library/mfrc630.c 
	
${OBJECTDIR}/_ext/150355788/TR20_hw.o: ../Library/TR20_hw.c  .generated_files/flags/default/54e78b91f03a811ddac9eb24068621999f90c309 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/150355788" 
	@${RM} ${OBJECTDIR}/_ext/150355788/TR20_hw.o.d 
	@${RM} ${OBJECTDIR}/_ext/150355788/TR20_hw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/150355788/TR20_hw.o.d" -MT "${OBJECTDIR}/_ext/150355788/TR20_hw.o.d" -MT ${OBJECTDIR}/_ext/150355788/TR20_hw.o -o ${OBJECTDIR}/_ext/150355788/TR20_hw.o ../Library/TR20_hw.c 
	
${OBJECTDIR}/_ext/150355788/Timer.o: ../Library/Timer.c  .generated_files/flags/default/4cbb1cda02da22eb3fd7035ee0fd0c1a6126d68f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/150355788" 
	@${RM} ${OBJECTDIR}/_ext/150355788/Timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/150355788/Timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/150355788/Timer.o.d" -MT "${OBJECTDIR}/_ext/150355788/Timer.o.d" -MT ${OBJECTDIR}/_ext/150355788/Timer.o -o ${OBJECTDIR}/_ext/150355788/Timer.o ../Library/Timer.c 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o: mcc_generated_files/system/src/protected_io.S  .generated_files/flags/default/9ab43e0f446b7d8aeb8522549ca20ee45417ea06 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  -fno-lto -gdwarf-3 -mno-const-data-in-progmem -Wa,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1 -mconst-data-in-progmem   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o  mcc_generated_files/system/src/protected_io.S 
	
else
${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o: mcc_generated_files/system/src/protected_io.S  .generated_files/flags/default/1a5bebc4799dd37060249071da082a1f150c2ec9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  -fno-lto -gdwarf-3 -mno-const-data-in-progmem -Wa,--defsym=__MPLAB_BUILD=1 -mconst-data-in-progmem   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o  mcc_generated_files/system/src/protected_io.S 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/TR20-Test.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  mcc_generated_files/touch/libraries/libqtm_touch_key_m328pb_0x0002.X.a mcc_generated_files/touch/libraries/libqtm_acq_runtime_m328pb_0x0003.X.a  
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/TR20-Test.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"   -gdwarf-2 -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -fno-lto -gdwarf-3 -mno-const-data-in-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/TR20-Test.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/TR20-Test.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    mcc_generated_files\touch\libraries\libqtm_touch_key_m328pb_0x0002.X.a mcc_generated_files\touch\libraries\libqtm_acq_runtime_m328pb_0x0003.X.a  -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1
	@${RM} ${DISTDIR}/TR20-Test.${IMAGE_TYPE}.hex 
	
	
else
${DISTDIR}/TR20-Test.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  mcc_generated_files/touch/libraries/libqtm_touch_key_m328pb_0x0002.X.a mcc_generated_files/touch/libraries/libqtm_acq_runtime_m328pb_0x0003.X.a 
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/TR20-Test.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -Og -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -fno-lto -gdwarf-3 -mno-const-data-in-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/TR20-Test.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/TR20-Test.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    mcc_generated_files\touch\libraries\libqtm_touch_key_m328pb_0x0002.X.a mcc_generated_files\touch\libraries\libqtm_acq_runtime_m328pb_0x0003.X.a  -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}\\avr-objcopy -O ihex "${DISTDIR}/TR20-Test.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/TR20-Test.${IMAGE_TYPE}.hex"
	
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
