#!/bin/bash

# File    : run.sh
# Author  : lihan
# Version : 1.0
# Company : 
# Contact : 
# Date    : 2015-07-23 13:31:46

[ -f output/bin/PROJECT_XXX ] && output/bin/PROJECT_XXX $@
[ -f output/bin/PROJECT_XXX-service ] && output/bin/PROJECT_XXX-service $@
