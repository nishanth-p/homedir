#!/bin/bash
# Script to generate the cscope filelist
# 	Expects the settagenv.sh is run first to set up the following:
#	CS_SOURCE_FOLDER, CSCOPE_DIR, CSCOPE_FL, CSCOPE_GEN_TYPE

cs_linux_common_src_gen()
{
	find  ${CS_SOURCE_FOLDER}					\
		-path "${CS_SOURCE_FOLDER}/arch/*" -prune -o		\
		-path "${CS_SOURCE_FOLDER}/Documentation*" -prune -o	\
		-path "${CS_SOURCE_FOLDER}/scripts*" -prune -o		\
		-name "*.[chxsS]" -print -o \
		-name "Makefile" -print -o \
		-name "Kconfig" -print \
		> ${CSCOPE_FL}

	find  	"${CS_SOURCE_FOLDER}/arch/arm/include/"		\
		"${CS_SOURCE_FOLDER}/arch/arm/kernel/"		\
		"${CS_SOURCE_FOLDER}/arch/arm/common/"		\
		"${CS_SOURCE_FOLDER}/arch/arm/boot/"		\
		"${CS_SOURCE_FOLDER}/arch/arm/lib/"		\
		"${CS_SOURCE_FOLDER}/arch/arm/mm/"		\
		-name "*.[chxsS]" -print -o \
		-name "Makefile" -print -o \
		-name "Kconfig" -print \
		>> ${CSCOPE_FL}
}

cs_linux_src_gen()
{
	cs_linux_common_src_gen
	find	"${CS_SOURCE_FOLDER}/arch/arm/mach-berlin/"	\
		-name "*.[chxsS]" -print -o \
		-name "Makefile" -print -o \
		-name "Kconfig" -print \
		>> ${CSCOPE_FL}
	echo "Folder assumed as linux source"
}

cs_general_src_gen()
{
	echo "Folder assumed as general C/C++ source"
	find ${CS_SOURCE_FOLDER}  -iname '*.[CH]' \
		-o -name '*.cpp' \
		-o -name '*.cc' \
		-o -name '*.hpp'  \
		> ${CSCOPE_FL}
}

if [ -z "${CS_SOURCE_FOLDER}" ]; then
	echo "CS_SOURCE_FOLDER not set"
	exit 1
fi

if [ -z "${CSCOPE_DIR}" ]; then
	echo "CSCOPE_DIR not set"
	exit 1
fi

echo "Generating cscope filelist for ${CS_SOURCE_FOLDER} in ${CSCOPE_DIR}"

mkdir -p ${CSCOPE_DIR}

MY_PWD=${PWD}
cd /

if [ "${CS_GEN_TYPE}" = "l" ]; then
	cs_linux_src_gen
else
	cs_general_src_gen
fi

cd ${MY_PWD}

