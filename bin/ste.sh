#!/bin/bash
# Script to setup the envirnoment for generating cscope, tags
#	and setting up them for vi. Sets the following envirnoment
#	variables.

export CS_GEN_TYPE=
if [ -n "$1" ]; then
	export CS_GEN_TYPE=$1
fi
export CS_SOURCE_FOLDER=${PWD}
export CSCOPE_DIR=/home/nishanth/cscope_files${CS_SOURCE_FOLDER}
export CSCOPE_FL=${CSCOPE_DIR}/cscope.files
export CSCOPE_DB=${CSCOPE_DIR}/cscope.out

if [ "${CS_GEN_TYPE}" = "l" ]; then
	echo "Cscope env for ${CS_SOURCE_FOLDER} as type linux"
elif [ "${CS_GEN_TYPE}" = "uk" ]; then
	echo "Cscope env for ${CS_SOURCE_FOLDER} as type uKernel"
else
	echo "Cscope env for ${CS_SOURCE_FOLDER} as general C/C++"
fi
