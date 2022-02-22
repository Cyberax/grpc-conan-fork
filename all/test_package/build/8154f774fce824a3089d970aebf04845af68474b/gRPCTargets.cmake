

if(NOT TARGET gRPC::execs)
    add_library(gRPC::execs INTERFACE IMPORTED)
endif()

if(NOT TARGET gRPC::grpc_plugin_support)
    add_library(gRPC::grpc_plugin_support INTERFACE IMPORTED)
endif()

if(NOT TARGET gRPC::upb)
    add_library(gRPC::upb INTERFACE IMPORTED)
endif()

if(NOT TARGET gRPC::gpr)
    add_library(gRPC::gpr INTERFACE IMPORTED)
endif()

if(NOT TARGET gRPC::address_sorting)
    add_library(gRPC::address_sorting INTERFACE IMPORTED)
endif()

if(NOT TARGET gRPC::grpc)
    add_library(gRPC::grpc INTERFACE IMPORTED)
endif()

if(NOT TARGET gRPC::grpcpp_channelz)
    add_library(gRPC::grpcpp_channelz INTERFACE IMPORTED)
endif()

if(NOT TARGET gRPC::grpc_unsecure)
    add_library(gRPC::grpc_unsecure INTERFACE IMPORTED)
endif()

if(NOT TARGET gRPC::grpc++_unsecure)
    add_library(gRPC::grpc++_unsecure INTERFACE IMPORTED)
endif()

if(NOT TARGET gRPC::grpc++)
    add_library(gRPC::grpc++ INTERFACE IMPORTED)
endif()

if(NOT TARGET gRPC::grpc++_reflection)
    add_library(gRPC::grpc++_reflection INTERFACE IMPORTED)
endif()

if(NOT TARGET gRPC::grpc++_error_details)
    add_library(gRPC::grpc++_error_details INTERFACE IMPORTED)
endif()

if(NOT TARGET gRPC::grpc++_alts)
    add_library(gRPC::grpc++_alts INTERFACE IMPORTED)
endif()

if(NOT TARGET gRPC::gRPC)
    add_library(gRPC::gRPC INTERFACE IMPORTED)
endif()

# Load the debug and release library finders
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB CONFIG_FILES "${_DIR}/gRPCTarget-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()

if(gRPC_FIND_COMPONENTS)
    foreach(_FIND_COMPONENT ${gRPC_FIND_COMPONENTS})
        list(FIND gRPC_COMPONENTS_RELEASE "gRPC::${_FIND_COMPONENT}" _index)
        if(${_index} EQUAL -1)
            conan_message(FATAL_ERROR "Conan: Component '${_FIND_COMPONENT}' NOT found in package 'gRPC'")
        else()
            conan_message(STATUS "Conan: Component '${_FIND_COMPONENT}' found in package 'gRPC'")
        endif()
    endforeach()
endif()