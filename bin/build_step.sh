#!/bin/bash
#
# @brief   build_step build native App/Tool in steps
# @version ver.1.0
# @date    Wed Jun  7 22:25:23 CEST 2017
# @company None, free software to use 2017
# @author  Vladimir Roncevic <elektron.ronca@gmail.com>
#
UTIL_ROOT=/root/scripts
UTIL_VERSION=ver.1.0
UTIL=${UTIL_ROOT}/sh_util/${UTIL_VERSION}
UTIL_LOG=${UTIL}/log

.    ${UTIL}/bin/devel.sh
.    ${UTIL}/bin/usage.sh
.    ${UTIL}/bin/check_root.sh
.    ${UTIL}/bin/check_tool.sh
.    ${UTIL}/bin/logging.sh
.    ${UTIL}/bin/send_mail.sh
.    ${UTIL}/bin/load_conf.sh
.    ${UTIL}/bin/load_util_conf.sh
.    ${UTIL}/bin/progress_bar.sh

BUILD_STEP_TOOL=build_step
BUILD_STEP_VERSION=ver.1.0
BUILD_STEP_HOME=${UTIL_ROOT}/${BUILD_STEP_TOOL}/${BUILD_STEP_VERSION}
BUILD_STEP_CFG=${BUILD_STEP_HOME}/conf/${BUILD_STEP_TOOL}.cfg
BUILD_STEP_UTIL_CFG=${BUILD_STEP_HOME}/conf/${BUILD_STEP_TOOL}_util.cfg
BUILD_STEP_LOG=${BUILD_STEP_HOME}/log

declare -A BUILD_STEP_USAGE=(
    [USAGE_TOOL]="${BUILD_STEP_TOOL}"
    [USAGE_ARG1]="[SOURCE_FILE] Source code file name"
    [USAGE_ARG2]="[OUTPUT_FILE] Output file name"
    [USAGE_EX_PRE]="# Example build steps for main.c"
    [USAGE_EX]="${BUILD_STEP_TOOL} main.c hello_world"
)

declare -A BUILD_STEP_LOGGING=(
    [LOG_TOOL]="${BUILD_STEP_TOOL}"
    [LOG_FLAG]="info"
    [LOG_PATH]="${BUILD_STEP_LOG}"
    [LOG_MSGE]="None"
)

declare -A PB_STRUCTURE=(
    [BW]=50
    [MP]=100
    [SLEEP]=0.01
)

TOOL_DEBUG="false"
TOOL_LOG="false"
TOOL_NOTIFY="false"

#
# @brief  build_step build native App/Tool in steps
# @params Values required source code file name and output file name
# @retval Function __build_step exit with integer value
#            0   - tool finished with success operation
#            128 - missing argument(s) from cli
#            129 - failed to load tool script configuration from files
#            130 - check input source code file
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
# CF="main.c" OF="hello_world"
# __build_step "$CF" "$OF"
#
function __build_step() {
    local CF=$1 OF=$2
    if [[ -n "${CF}" && -n "${OF}" ]]; then
        local FUNC=${FUNCNAME[0]} MSG="None"
        local STATUS_CONF STATUS_CONF_UTIL STATUS
        MSG="Loading basic and util configuration!"
        info_debug_message "$MSG" "$FUNC" "$BUILD_STEP_TOOL"
        progress_bar PB_STRUCTURE
        declare -A config_build_step=()
        load_conf "$BUILD_STEP_CFG" config_build_step
        STATUS_CONF=$?
        declare -A config_build_step_util=()
        load_util_conf "$BUILD_STEP_UTIL_CFG" config_build_step_util
        STATUS_CONF_UTIL=$?
        declare -A STATUS_STRUCTURE=(
            [1]=$STATUS_CONF [2]=$STATUS_CONF_UTIL
        )
        check_status STATUS_STRUCTURE
        STATUS=$?
        if [ $STATUS -eq $NOT_SUCCESS ]; then
            MSG="Force exit!"
            info_debug_message_end "$MSG" "$FUNC" "$BUILD_STEP_TOOL"
            exit 129
        fi
        TOOL_DEBUG=${config_build_step[DEBUGGING]}
        TOOL_LOG=${config_build_step[LOGGING]}
        TOOL_NOTIFY=${config_build_step[EMAILING]}
        if [ ! -f "${CF}" ]; then
            MSG="Check file [${CF}]"
            info_debug_message_end "$MSG" "$FUNC" "$BUILD_STEP_TOOL"
            exit 130
        fi
        MSG="C preprocessor!"
        info_debug_message "$MSG" "$FUNC" "$BUILD_STEP_TOOL"
        local FILENAME="${CF%.*}"
        cpp ${CF} > ${FILENAME}.i
        MSG="Generating assembly code!"
        info_debug_message "$MSG" "$FUNC" "$BUILD_STEP_TOOL"
        cc -S ${FILENAME}.i
        MSG="Generating object file!"
        info_debug_message "$MSG" "$FUNC" "$BUILD_STEP_TOOL"
        as -o ${FILENAME}.o ${FILENAME}.s
        MSG="Generating ELF file!"
        info_debug_message "$MSG" "$FUNC" "$BUILD_STEP_TOOL"
        local LL C1 CI CB IN CE CN ARGS1 ARGS2 ARGS3
        LL=${config_build_step_util[LD_LINUX]}
        C1=${config_build_step_util[CRT1]}
        CI=${config_build_step_util[CRTI]}
        CB=${config_build_step_util[CRT_BEGIN]}
        IN=${config_build_step_util[INCLUDE]}
        CE=${config_build_step_util[CRT_END]}
        CN=${config_build_step_util[CRTN]}
        ARGS1="-dynamic-linker ${LL}"
        ARGS2="${C1} ${CI} ${CB}"
        ARGS3="-L ${IN} -lc ${CE} ${CN}"
        eval "ld ${ARGS1} -o ${OF} $ARGS2 ${FILENAME}.o ${ARGS3}"
        MSG="Set owner!"
        info_debug_message "$MSG" "$FUNC" "$BUILD_STEP_TOOL"
        local USRID=${config_build_step_util[UID]}
        local GRPID=${config_build_step_util[GID]}
        eval "chown ${USRID}.${GRPID} ${FILENAME}.*"
        eval "chown ${USRID}.${GRPID} ${OF}"
        MSG="Set permission!"
        info_debug_message "$MSG" "$FUNC" "$BUILD_STEP_TOOL"
        eval "chmod 644 ${FILENAME}.*"
        eval "chmod 755 ${OF}"
        info_debug_message_end "Done" "$FUNC" "$BUILD_STEP_TOOL"
        exit 0
    fi
    usage BUILD_STEP_USAGE
    exit 128
}

#
# @brief   Main entry point of script tool
# @params  Values required source code file name and output file name
# @exitval Script tool build_step exit with integer value
#            0   - tool finished with success operation
#            127 - run tool script as root user from cli
#            128 - missing argument(s) from cli
#            129 - failed to load tool script configuration from files
#            130 - check input source code file
#
printf "\n%s\n%s\n\n" "${BUILD_STEP_TOOL} ${BUILD_STEP_VERSION}" "`date`"
check_root
STATUS=$?
if [ $STATUS -eq $SUCCESS ]; then
    __build_step $1 $2
fi

exit 127

