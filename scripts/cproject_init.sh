#!/bin/sh

filename="compile_commands.json"

local_path=`pwd`
project_name=${local_path##*/}
project_name=${project_name%%/}

mkdir -p ~/.compile_commands_json/${project_name}

cmake . -DCMAKE_EXPORT_COMPILE_COMMANDS=1
mv ${filename} ~/.compile_commands_json/${project_name}/
