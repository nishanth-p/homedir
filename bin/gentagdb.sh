#!/bin/bash
# Script to generate the cscope database
# 	Expects the settagenv.sh is run first to set up the following:
#	CS_SOURCE_FOLDER, CSCOPE_DIR, CSCOPE_FL, CSCOPE_GEN_TYPE

cs_linux_bin_gen()
{
	cscope -bqk
	ctags -L ${CSCOPE_FL} --extra=+f --fields=+nS
}

cs_general_bin_gen()
{
	cscope -bq
	ctags -L ${CSCOPE_FL} --extra=+fq --fields=+ainS
}

if [ ! -d "${CS_SOURCE_FOLDER}" ]; then
	echo "CS_SOURCE_FOLDER not existing"
	exit 1
fi

if [ ! -d "${CSCOPE_DIR}" ]; then
	echo "CSCOPE_DIR not existing"
	exit 1
fi

if [ ! -e "${CSCOPE_FL}" ]; then
	echo "CSCOPE_FL $CSCOPE_FL not existing"
	exit 1
fi

echo "Generating cscope/ctag files ${CS_SOURCE_FOLDER} in ${CSCOPE_DIR}"

MY_PWD=${PWD}
cd ${CSCOPE_DIR}

if [ "${CS_GEN_TYPE}" = "l" ]; then
	cs_linux_bin_gen
elif [ "${CS_GEN_TYPE}" = "uk" ]; then
	cs_general_bin_gen
else
	cs_general_bin_gen
fi

cd ${MY_PWD}

