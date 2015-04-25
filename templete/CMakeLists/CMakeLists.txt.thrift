cmake_minimum_required (VERSION 2.6)
project (PROJECT_XXX)

set(ROOT PROJECT_ROOT_XXX)
set(CMAKE_CXX_FLAGS "-g -pipe -std=c++0x -W -Wall -fPIC")
set(CMAKE_CXX_FLAGS_DEBUG "-O0")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")
set(PROJECT_DIR PROJECT_DIR_XXX)

file(GLOB_RECURSE SERVICE_SOURCES "src/service/*.cpp"
        "src/core/*.cpp")

set(TUTORIAL_THRIFT_MODULE ${PROJECT_DIR}/../tutorial-thrift/)
set(TUTORIAL_THRIFT_MODULE_INCLUDE ${TUTORIAL_THRIFT_MODULE}/output/include)
file(GLOB_RECURSE TUTORIAL_THRIFT_MODULE_LIB "${TUTORIAL_THRIFT_MODULE}/output/lib/*.a")

#set(PROTO_GEN_DIR ${PROJECT_DIR}/src)
#FOREACH(PROTO_FILE ${THIRD_PROTO_FILE})
#    message ("proto file " ${PROTO_FILE})
#    EXECUTE_PROCESS(
#        COMMAND ${PROTO_COMPILER} ${PROTO_FILE} --cpp_out ${PROTO_GEN_DIR} -I${PROTO_GEN_DIR}
#        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
#        )
#ENDFOREACH(PROTO_FILE ${THIRD_PROTO_FILE})

#set(THRIFT_COMPILER ${THRIFT_MODULE}/bin/thrift)
#file(GLOB_RECURSE SERVICE_THRIFT_FILE "*.thrift")
#message ("thrift file" ${SERVICE_THRIFT_FILE})
#
#
#foreach (MY_THRIFT ${SERVICE_THRIFT_FILE})
#    file(RELATIVE_PATH file_name ${PROJECT_DIR} ${MY_THRIFT})
#    execute_process(COMMAND ${THRIFT_COMPILER} --gen cpp -o ${PROJECT_DIR}/output  ${MY_THRIFT})
#    file(GLOB_RECURSE SKELETON_FILE "${PROJECT_DIR}/output/gen-cpp/*.skeleton.cpp")
#    file(REMOVE ${SKELETON_FILE})
#endforeach(MY_THRIFT)

include_directories(
    ${TUTORIAL_THRIFT_MODULE_INCLUDE}
    )

add_executable(PROJECT_XXX-service ${SERVICE_SOURCES})

target_link_libraries(PROJECT_XXX-service
    ${TUTORIAL_THRIFT_MODULE_LIB}
    pthread
    rt)

install(TARGETS PROJECT_XXX-service DESTINATION ${PROJECT_DIR}/output/bin/) 
