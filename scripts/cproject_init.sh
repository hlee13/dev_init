#!/bin/sh

filename="compile_commands.json"

local_path=`pwd`
project_name=${local_path##*/}
project_name=${project_name%%/}

mkdir -p ~/.compile_commands_json/${project_name}

mkdir -p build && cd build && cmake .. -DCMAKE_MACOSX_RPATH=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 && cp ${filename} ~/.compile_commands_json/${project_name}/ && cd -
