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
FINAL_IMAGE=${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=mcc_generated_files/peripheral/src/exint.c mcc_generated_files/spi/src/spi0.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/protected_io.S mcc_generated_files/system/src/cpu.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/cpuint.c mcc_generated_files/system/src/system.c mcc_generated_files/tc0/src/tc0.c mcc_generated_files/tc16/src/tc1.c mcc_generated_files/tc16/src/tc3.c mcc_generated_files/touch/example/touch_example.c mcc_generated_files/touch/touch.c mcc_generated_files/uart/src/usart0.c main.c ../Library/mfrc630.c ../Library/TR20_hw.c ../Library/Timer.c ../Library/PetitModbus/PetitModbus.c ../Library/PetitModbus/PetitModbusPort.c ../Library/PetitModbus/PetitRegConstant.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o ${OBJECTDIR}/mcc_generated_files/touch/touch.o ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o ${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/150355788/mfrc630.o ${OBJECTDIR}/_ext/150355788/TR20_hw.o ${OBJECTDIR}/_ext/150355788/Timer.o ${OBJECTDIR}/_ext/203071227/PetitModbus.o ${OBJECTDIR}/_ext/203071227/PetitModbusPort.o ${OBJECTDIR}/_ext/203071227/PetitRegConstant.o
POSSIBLE_DEPFILES=${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d ${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o.d ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d ${OBJECTDIR}/mcc_generated_files/touch/touch.o.d ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/_ext/150355788/mfrc630.o.d ${OBJECTDIR}/_ext/150355788/TR20_hw.o.d ${OBJECTDIR}/_ext/150355788/Timer.o.d ${OBJECTDIR}/_ext/203071227/PetitModbus.o.d ${OBJECTDIR}/_ext/203071227/PetitModbusPort.o.d ${OBJECTDIR}/_ext/203071227/PetitRegConstant.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o ${OBJECTDIR}/mcc_generated_files/touch/touch.o ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o ${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/150355788/mfrc630.o ${OBJECTDIR}/_ext/150355788/TR20_hw.o ${OBJECTDIR}/_ext/150355788/Timer.o ${OBJECTDIR}/_ext/203071227/PetitModbus.o ${OBJECTDIR}/_ext/203071227/PetitModbusPort.o ${OBJECTDIR}/_ext/203071227/PetitRegConstant.o

# Source Files
SOURCEFILES=mcc_generated_files/peripheral/src/exint.c mcc_generated_files/spi/src/spi0.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/protected_io.S mcc_generated_files/system/src/cpu.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/cpuint.c mcc_generated_files/system/src/system.c mcc_generated_files/tc0/src/tc0.c mcc_generated_files/tc16/src/tc1.c mcc_generated_files/tc16/src/tc3.c mcc_generated_files/touch/example/touch_example.c mcc_generated_files/touch/touch.c mcc_generated_files/uart/src/usart0.c main.c ../Library/mfrc630.c ../Library/TR20_hw.c ../Library/Timer.c ../Library/PetitModbus/PetitModbus.c ../Library/PetitModbus/PetitModbusPort.c ../Library/PetitModbus/PetitRegConstant.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATmega328PB
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o: mcc_generated_files/peripheral/src/exint.c  .generated_files/flags/default/9df0e450de600643600bda4ed42cbfdd781d00b6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/peripheral/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o -o ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o mcc_generated_files/peripheral/src/exint.c 
	
${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o: mcc_generated_files/spi/src/spi0.c  .generated_files/flags/default/9c73ab31fdf164737ed686b40b95005f5419b409 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/spi/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o -o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o mcc_generated_files/spi/src/spi0.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/32ef5c5cb6400742b66aa8b49018cc83e5657eb8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/pins.o -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o mcc_generated_files/system/src/pins.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/cpu.o: mcc_generated_files/system/src/cpu.c  .generated_files/flags/default/724ce7d563c939117cbe27ae61265eafa1662f7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o -o ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o mcc_generated_files/system/src/cpu.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/f998c7847ba22462889fa2f5fd22487563070ace .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o mcc_generated_files/system/src/config_bits.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o: mcc_generated_files/system/src/cpuint.c  .generated_files/flags/default/318593fe6ebe2585cba349e88095f3c05d0c42bf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o -o ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o mcc_generated_files/system/src/cpuint.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/a1bc1a6b3feed149ab02505738e2d94c27ef1dbd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/system.o -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o mcc_generated_files/system/src/system.c 
	
${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o: mcc_generated_files/tc0/src/tc0.c  .generated_files/flags/default/98119fd91f6c7c803dace5e25fb08ad0ed29809d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tc0/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o -o ${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o mcc_generated_files/tc0/src/tc0.c 
	
${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o: mcc_generated_files/tc16/src/tc1.c  .generated_files/flags/default/a7baa06e251261b4cc241d0c4ee16bb9fae28fa8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tc16/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o -o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o mcc_generated_files/tc16/src/tc1.c 
	
${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o: mcc_generated_files/tc16/src/tc3.c  .generated_files/flags/default/770f88ea11610f1865d80206ee63a8134f1932d2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tc16/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o -o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o mcc_generated_files/tc16/src/tc3.c 
	
${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o: mcc_generated_files/touch/example/touch_example.c  .generated_files/flags/default/2d8346a1558d06f05648bb0ab8ec3a3b37c92ad5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/touch/example" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d" -MT "${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d" -MT ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o -o ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o mcc_generated_files/touch/example/touch_example.c 
	
${OBJECTDIR}/mcc_generated_files/touch/touch.o: mcc_generated_files/touch/touch.c  .generated_files/flags/default/3530d9e529302353a025b15fa6e729db124be886 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/touch" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/touch.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/touch.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/touch/touch.o.d" -MT "${OBJECTDIR}/mcc_generated_files/touch/touch.o.d" -MT ${OBJECTDIR}/mcc_generated_files/touch/touch.o -o ${OBJECTDIR}/mcc_generated_files/touch/touch.o mcc_generated_files/touch/touch.c 
	
${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o: mcc_generated_files/uart/src/usart0.c  .generated_files/flags/default/1b6246c975d637a416b1a6aaf66076a99b6531bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o -o ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o mcc_generated_files/uart/src/usart0.c 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/deed62563b43b7c58926bf7346bdf9f51b936170 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
${OBJECTDIR}/_ext/150355788/mfrc630.o: ../Library/mfrc630.c  .generated_files/flags/default/ed70aa325d9ace3b640609c435f38b3a747de30e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/150355788" 
	@${RM} ${OBJECTDIR}/_ext/150355788/mfrc630.o.d 
	@${RM} ${OBJECTDIR}/_ext/150355788/mfrc630.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/150355788/mfrc630.o.d" -MT "${OBJECTDIR}/_ext/150355788/mfrc630.o.d" -MT ${OBJECTDIR}/_ext/150355788/mfrc630.o -o ${OBJECTDIR}/_ext/150355788/mfrc630.o ../Library/mfrc630.c 
	
${OBJECTDIR}/_ext/150355788/TR20_hw.o: ../Library/TR20_hw.c  .generated_files/flags/default/f23b868c26bf77a74c9dc1bf56b226763136af38 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/150355788" 
	@${RM} ${OBJECTDIR}/_ext/150355788/TR20_hw.o.d 
	@${RM} ${OBJECTDIR}/_ext/150355788/TR20_hw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/150355788/TR20_hw.o.d" -MT "${OBJECTDIR}/_ext/150355788/TR20_hw.o.d" -MT ${OBJECTDIR}/_ext/150355788/TR20_hw.o -o ${OBJECTDIR}/_ext/150355788/TR20_hw.o ../Library/TR20_hw.c 
	
${OBJECTDIR}/_ext/150355788/Timer.o: ../Library/Timer.c  .generated_files/flags/default/f7418d72fa5372b86fa5b6eac4d86dc5ad67d62d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/150355788" 
	@${RM} ${OBJECTDIR}/_ext/150355788/Timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/150355788/Timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/150355788/Timer.o.d" -MT "${OBJECTDIR}/_ext/150355788/Timer.o.d" -MT ${OBJECTDIR}/_ext/150355788/Timer.o -o ${OBJECTDIR}/_ext/150355788/Timer.o ../Library/Timer.c 
	
${OBJECTDIR}/_ext/203071227/PetitModbus.o: ../Library/PetitModbus/PetitModbus.c  .generated_files/flags/default/9a8b57395a060d51e4e9739cfa4fd05f66f8ce8f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/203071227" 
	@${RM} ${OBJECTDIR}/_ext/203071227/PetitModbus.o.d 
	@${RM} ${OBJECTDIR}/_ext/203071227/PetitModbus.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/203071227/PetitModbus.o.d" -MT "${OBJECTDIR}/_ext/203071227/PetitModbus.o.d" -MT ${OBJECTDIR}/_ext/203071227/PetitModbus.o -o ${OBJECTDIR}/_ext/203071227/PetitModbus.o ../Library/PetitModbus/PetitModbus.c 
	
${OBJECTDIR}/_ext/203071227/PetitModbusPort.o: ../Library/PetitModbus/PetitModbusPort.c  .generated_files/flags/default/529d2e329ab12cad2ec6495dfe6a479a6bdce527 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/203071227" 
	@${RM} ${OBJECTDIR}/_ext/203071227/PetitModbusPort.o.d 
	@${RM} ${OBJECTDIR}/_ext/203071227/PetitModbusPort.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/203071227/PetitModbusPort.o.d" -MT "${OBJECTDIR}/_ext/203071227/PetitModbusPort.o.d" -MT ${OBJECTDIR}/_ext/203071227/PetitModbusPort.o -o ${OBJECTDIR}/_ext/203071227/PetitModbusPort.o ../Library/PetitModbus/PetitModbusPort.c 
	
${OBJECTDIR}/_ext/203071227/PetitRegConstant.o: ../Library/PetitModbus/PetitRegConstant.c  .generated_files/flags/default/b982f3744f2424291d3479fd6f80bcdaa5427b8f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/203071227" 
	@${RM} ${OBJECTDIR}/_ext/203071227/PetitRegConstant.o.d 
	@${RM} ${OBJECTDIR}/_ext/203071227/PetitRegConstant.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/203071227/PetitRegConstant.o.d" -MT "${OBJECTDIR}/_ext/203071227/PetitRegConstant.o.d" -MT ${OBJECTDIR}/_ext/203071227/PetitRegConstant.o -o ${OBJECTDIR}/_ext/203071227/PetitRegConstant.o ../Library/PetitModbus/PetitRegConstant.c 
	
else
${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o: mcc_generated_files/peripheral/src/exint.c  .generated_files/flags/default/5e870a5a037f48376be11baa3517bded2a6f0950 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/peripheral/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o -o ${OBJECTDIR}/mcc_generated_files/peripheral/src/exint.o mcc_generated_files/peripheral/src/exint.c 
	
${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o: mcc_generated_files/spi/src/spi0.c  .generated_files/flags/default/67b107dd60016a021bcfd90431674f2183a725f0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/spi/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o -o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o mcc_generated_files/spi/src/spi0.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/19cf1a0efb5e5b48dee9d9d50b427d38b5f37c3f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/pins.o -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o mcc_generated_files/system/src/pins.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/cpu.o: mcc_generated_files/system/src/cpu.c  .generated_files/flags/default/5919167b070095e7a61ee33099acf752a45fcc93 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/cpu.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o -o ${OBJECTDIR}/mcc_generated_files/system/src/cpu.o mcc_generated_files/system/src/cpu.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/2f35f20bd0f8faa2bb6568ab1abbeb03597f8c32 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o mcc_generated_files/system/src/config_bits.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o: mcc_generated_files/system/src/cpuint.c  .generated_files/flags/default/ae3a64de619ca21d73787a7d2eaae16278cfd0cd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o -o ${OBJECTDIR}/mcc_generated_files/system/src/cpuint.o mcc_generated_files/system/src/cpuint.c 
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/94eb98c21743b0d2009b75d1fe7a2c7e07c637df .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/system.o -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o mcc_generated_files/system/src/system.c 
	
${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o: mcc_generated_files/tc0/src/tc0.c  .generated_files/flags/default/d9346653a1f29fbce96a724eadea3664b84cb0d6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tc0/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o -o ${OBJECTDIR}/mcc_generated_files/tc0/src/tc0.o mcc_generated_files/tc0/src/tc0.c 
	
${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o: mcc_generated_files/tc16/src/tc1.c  .generated_files/flags/default/f9a2c0e0b0a5eeb69e6345ec15609fba6a1ed15f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tc16/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o -o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc1.o mcc_generated_files/tc16/src/tc1.c 
	
${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o: mcc_generated_files/tc16/src/tc3.c  .generated_files/flags/default/c7af7c8cdfa68470a5da3eddb32209725d88cde2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/tc16/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d" -MT "${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o.d" -MT ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o -o ${OBJECTDIR}/mcc_generated_files/tc16/src/tc3.o mcc_generated_files/tc16/src/tc3.c 
	
${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o: mcc_generated_files/touch/example/touch_example.c  .generated_files/flags/default/d3544bd006a6af7559a5778d028ae3f465c36978 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/touch/example" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d" -MT "${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o.d" -MT ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o -o ${OBJECTDIR}/mcc_generated_files/touch/example/touch_example.o mcc_generated_files/touch/example/touch_example.c 
	
${OBJECTDIR}/mcc_generated_files/touch/touch.o: mcc_generated_files/touch/touch.c  .generated_files/flags/default/ad1f1c36c566a79632346017d1b2a834f300d1c4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/touch" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/touch.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/touch/touch.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/touch/touch.o.d" -MT "${OBJECTDIR}/mcc_generated_files/touch/touch.o.d" -MT ${OBJECTDIR}/mcc_generated_files/touch/touch.o -o ${OBJECTDIR}/mcc_generated_files/touch/touch.o mcc_generated_files/touch/touch.c 
	
${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o: mcc_generated_files/uart/src/usart0.c  .generated_files/flags/default/3ec676c39c068936795deea84d14ed71f1cdea54 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o -o ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o mcc_generated_files/uart/src/usart0.c 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/22c3d1fe3f47413bdb8423f577f3561b8832c440 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
${OBJECTDIR}/_ext/150355788/mfrc630.o: ../Library/mfrc630.c  .generated_files/flags/default/a2fe5d451559e241fb136c3d57b85777dd1421d8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/150355788" 
	@${RM} ${OBJECTDIR}/_ext/150355788/mfrc630.o.d 
	@${RM} ${OBJECTDIR}/_ext/150355788/mfrc630.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/150355788/mfrc630.o.d" -MT "${OBJECTDIR}/_ext/150355788/mfrc630.o.d" -MT ${OBJECTDIR}/_ext/150355788/mfrc630.o -o ${OBJECTDIR}/_ext/150355788/mfrc630.o ../Library/mfrc630.c 
	
${OBJECTDIR}/_ext/150355788/TR20_hw.o: ../Library/TR20_hw.c  .generated_files/flags/default/fd90d6271356b436669282f518def8ffb7de76e5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/150355788" 
	@${RM} ${OBJECTDIR}/_ext/150355788/TR20_hw.o.d 
	@${RM} ${OBJECTDIR}/_ext/150355788/TR20_hw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/150355788/TR20_hw.o.d" -MT "${OBJECTDIR}/_ext/150355788/TR20_hw.o.d" -MT ${OBJECTDIR}/_ext/150355788/TR20_hw.o -o ${OBJECTDIR}/_ext/150355788/TR20_hw.o ../Library/TR20_hw.c 
	
${OBJECTDIR}/_ext/150355788/Timer.o: ../Library/Timer.c  .generated_files/flags/default/91bde05ebde391f915b542d7e0b69f944e895b71 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/150355788" 
	@${RM} ${OBJECTDIR}/_ext/150355788/Timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/150355788/Timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/150355788/Timer.o.d" -MT "${OBJECTDIR}/_ext/150355788/Timer.o.d" -MT ${OBJECTDIR}/_ext/150355788/Timer.o -o ${OBJECTDIR}/_ext/150355788/Timer.o ../Library/Timer.c 
	
${OBJECTDIR}/_ext/203071227/PetitModbus.o: ../Library/PetitModbus/PetitModbus.c  .generated_files/flags/default/10a4256351c7f0aa589406abff4428f98138c2d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/203071227" 
	@${RM} ${OBJECTDIR}/_ext/203071227/PetitModbus.o.d 
	@${RM} ${OBJECTDIR}/_ext/203071227/PetitModbus.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/203071227/PetitModbus.o.d" -MT "${OBJECTDIR}/_ext/203071227/PetitModbus.o.d" -MT ${OBJECTDIR}/_ext/203071227/PetitModbus.o -o ${OBJECTDIR}/_ext/203071227/PetitModbus.o ../Library/PetitModbus/PetitModbus.c 
	
${OBJECTDIR}/_ext/203071227/PetitModbusPort.o: ../Library/PetitModbus/PetitModbusPort.c  .generated_files/flags/default/b3ba93ab3236abecdaabf761fe6ba297109c9e6b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/203071227" 
	@${RM} ${OBJECTDIR}/_ext/203071227/PetitModbusPort.o.d 
	@${RM} ${OBJECTDIR}/_ext/203071227/PetitModbusPort.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/203071227/PetitModbusPort.o.d" -MT "${OBJECTDIR}/_ext/203071227/PetitModbusPort.o.d" -MT ${OBJECTDIR}/_ext/203071227/PetitModbusPort.o -o ${OBJECTDIR}/_ext/203071227/PetitModbusPort.o ../Library/PetitModbus/PetitModbusPort.c 
	
${OBJECTDIR}/_ext/203071227/PetitRegConstant.o: ../Library/PetitModbus/PetitRegConstant.c  .generated_files/flags/default/398cf5a0b99ee05b0f482b98a59d35008ede7d38 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/203071227" 
	@${RM} ${OBJECTDIR}/_ext/203071227/PetitRegConstant.o.d 
	@${RM} ${OBJECTDIR}/_ext/203071227/PetitRegConstant.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mno-const-data-in-progmem -fno-lto -mconst-data-in-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/203071227/PetitRegConstant.o.d" -MT "${OBJECTDIR}/_ext/203071227/PetitRegConstant.o.d" -MT ${OBJECTDIR}/_ext/203071227/PetitRegConstant.o -o ${OBJECTDIR}/_ext/203071227/PetitRegConstant.o ../Library/PetitModbus/PetitRegConstant.c 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o: mcc_generated_files/system/src/protected_io.S  .generated_files/flags/default/7f50c0ef1b8a877c6e60902cddaf19563c22c6e4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  -fno-lto -gdwarf-3 -mno-const-data-in-progmem -Wa,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1 -mconst-data-in-progmem   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o  mcc_generated_files/system/src/protected_io.S 
	
else
${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o: mcc_generated_files/system/src/protected_io.S  .generated_files/flags/default/3077dee1f4d37dd61152ba9bcca5c3600cee3233 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -DXPRJ_default=$(CND_CONF)  -fno-lto -gdwarf-3 -mno-const-data-in-progmem -Wa,--defsym=__MPLAB_BUILD=1 -mconst-data-in-progmem   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o  mcc_generated_files/system/src/protected_io.S 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  mcc_generated_files/touch/libraries/libqtm_touch_key_m328pb_0x0002.X.a mcc_generated_files/touch/libraries/libqtm_acq_runtime_m328pb_0x0003.X.a  
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"   -gdwarf-2 -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -fno-lto -gdwarf-3 -mno-const-data-in-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    mcc_generated_files\touch\libraries\libqtm_touch_key_m328pb_0x0002.X.a mcc_generated_files\touch\libraries\libqtm_acq_runtime_m328pb_0x0003.X.a  -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1
	@${RM} ${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.hex 
	
	
else
${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  mcc_generated_files/touch/libraries/libqtm_touch_key_m328pb_0x0002.X.a mcc_generated_files/touch/libraries/libqtm_acq_runtime_m328pb_0x0003.X.a 
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -Os -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -I"../Library" -I"mcc_generated_files" -I"." -Wall -fno-lto -gdwarf-3 -mno-const-data-in-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    mcc_generated_files\touch\libraries\libqtm_touch_key_m328pb_0x0002.X.a mcc_generated_files\touch\libraries\libqtm_acq_runtime_m328pb_0x0003.X.a  -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}\\avr-objcopy -O ihex "${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/TR20-Modbus.${IMAGE_TYPE}.hex"
	
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
