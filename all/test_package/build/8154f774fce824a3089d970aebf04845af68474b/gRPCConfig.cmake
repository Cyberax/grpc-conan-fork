########## MACROS ###########################################################################
#############################################################################################

function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


# Requires CMake > 3.0
if(${CMAKE_VERSION} VERSION_LESS "3.0")
    message(FATAL_ERROR "The 'cmake_find_package_multi' generator only works with CMake > 3.0")
endif()

include(${CMAKE_CURRENT_LIST_DIR}/gRPCTargets.cmake)

########## FIND PACKAGE DEPENDENCY ##########################################################
#############################################################################################

include(CMakeFindDependencyMacro)

if(NOT protobuf_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(protobuf REQUIRED NO_MODULE)
    else()
        find_dependency(protobuf REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency protobuf already found")
endif()

if(NOT ZLIB_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(ZLIB REQUIRED NO_MODULE)
    else()
        find_dependency(ZLIB REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency ZLIB already found")
endif()

if(NOT c-ares_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(c-ares REQUIRED NO_MODULE)
    else()
        find_dependency(c-ares REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency c-ares already found")
endif()

if(NOT re2_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(re2 REQUIRED NO_MODULE)
    else()
        find_dependency(re2 REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency re2 already found")
endif()

if(NOT absl_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(absl REQUIRED NO_MODULE)
    else()
        find_dependency(absl REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency absl already found")
endif()

if(NOT absl_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(absl REQUIRED NO_MODULE)
    else()
        find_dependency(absl REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency absl already found")
endif()

if(NOT absl_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(absl REQUIRED NO_MODULE)
    else()
        find_dependency(absl REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency absl already found")
endif()

if(NOT absl_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(absl REQUIRED NO_MODULE)
    else()
        find_dependency(absl REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency absl already found")
endif()

if(NOT OpenSSL_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(OpenSSL REQUIRED NO_MODULE)
    else()
        find_dependency(OpenSSL REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency OpenSSL already found")
endif()

if(NOT OpenSSL_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(OpenSSL REQUIRED NO_MODULE)
    else()
        find_dependency(OpenSSL REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency OpenSSL already found")
endif()

if(NOT absl_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(absl REQUIRED NO_MODULE)
    else()
        find_dependency(absl REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency absl already found")
endif()

if(NOT absl_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(absl REQUIRED NO_MODULE)
    else()
        find_dependency(absl REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency absl already found")
endif()

if(NOT absl_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(absl REQUIRED NO_MODULE)
    else()
        find_dependency(absl REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency absl already found")
endif()

if(NOT absl_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(absl REQUIRED NO_MODULE)
    else()
        find_dependency(absl REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency absl already found")
endif()

if(NOT absl_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(absl REQUIRED NO_MODULE)
    else()
        find_dependency(absl REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency absl already found")
endif()

if(NOT absl_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(absl REQUIRED NO_MODULE)
    else()
        find_dependency(absl REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency absl already found")
endif()

if(NOT absl_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(absl REQUIRED NO_MODULE)
    else()
        find_dependency(absl REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency absl already found")
endif()

if(NOT absl_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(absl REQUIRED NO_MODULE)
    else()
        find_dependency(absl REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency absl already found")
endif()

if(NOT protobuf_FOUND)
    if(${CMAKE_VERSION} VERSION_LESS "3.9.0")
        find_package(protobuf REQUIRED NO_MODULE)
    else()
        find_dependency(protobuf REQUIRED NO_MODULE)
    endif()
else()
    message(STATUS "Dependency protobuf already found")
endif()

########## TARGETS PROPERTIES ###############################################################
#############################################################################################

########## COMPONENT execs TARGET PROPERTIES ######################################

set_property(TARGET gRPC::execs PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${gRPC_execs_LINK_LIBS_DEBUG}
                ${gRPC_execs_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_execs_LINK_LIBS_RELEASE}
                ${gRPC_execs_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_execs_LINK_LIBS_RELWITHDEBINFO}
                ${gRPC_execs_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_execs_LINK_LIBS_MINSIZEREL}
                ${gRPC_execs_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET gRPC::execs PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${gRPC_execs_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_execs_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_execs_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_execs_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET gRPC::execs PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${gRPC_execs_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_execs_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_execs_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_execs_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET gRPC::execs PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${gRPC_execs_COMPILE_OPTIONS_C_DEBUG}
                 ${gRPC_execs_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${gRPC_execs_COMPILE_OPTIONS_C_RELEASE}
                 ${gRPC_execs_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${gRPC_execs_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${gRPC_execs_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${gRPC_execs_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${gRPC_execs_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(gRPC_execs_TARGET_PROPERTIES TRUE)

########## COMPONENT grpc_plugin_support TARGET PROPERTIES ######################################

set_property(TARGET gRPC::grpc_plugin_support PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${gRPC_grpc_plugin_support_LINK_LIBS_DEBUG}
                ${gRPC_grpc_plugin_support_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc_plugin_support_LINK_LIBS_RELEASE}
                ${gRPC_grpc_plugin_support_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc_plugin_support_LINK_LIBS_RELWITHDEBINFO}
                ${gRPC_grpc_plugin_support_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc_plugin_support_LINK_LIBS_MINSIZEREL}
                ${gRPC_grpc_plugin_support_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET gRPC::grpc_plugin_support PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${gRPC_grpc_plugin_support_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc_plugin_support_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc_plugin_support_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc_plugin_support_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc_plugin_support PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${gRPC_grpc_plugin_support_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc_plugin_support_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc_plugin_support_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc_plugin_support_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc_plugin_support PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${gRPC_grpc_plugin_support_COMPILE_OPTIONS_C_DEBUG}
                 ${gRPC_grpc_plugin_support_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${gRPC_grpc_plugin_support_COMPILE_OPTIONS_C_RELEASE}
                 ${gRPC_grpc_plugin_support_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${gRPC_grpc_plugin_support_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${gRPC_grpc_plugin_support_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${gRPC_grpc_plugin_support_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${gRPC_grpc_plugin_support_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(gRPC_grpc_plugin_support_TARGET_PROPERTIES TRUE)

########## COMPONENT upb TARGET PROPERTIES ######################################

set_property(TARGET gRPC::upb PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${gRPC_upb_LINK_LIBS_DEBUG}
                ${gRPC_upb_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_upb_LINK_LIBS_RELEASE}
                ${gRPC_upb_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_upb_LINK_LIBS_RELWITHDEBINFO}
                ${gRPC_upb_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_upb_LINK_LIBS_MINSIZEREL}
                ${gRPC_upb_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET gRPC::upb PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${gRPC_upb_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_upb_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_upb_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_upb_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET gRPC::upb PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${gRPC_upb_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_upb_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_upb_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_upb_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET gRPC::upb PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${gRPC_upb_COMPILE_OPTIONS_C_DEBUG}
                 ${gRPC_upb_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${gRPC_upb_COMPILE_OPTIONS_C_RELEASE}
                 ${gRPC_upb_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${gRPC_upb_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${gRPC_upb_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${gRPC_upb_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${gRPC_upb_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(gRPC_upb_TARGET_PROPERTIES TRUE)

########## COMPONENT gpr TARGET PROPERTIES ######################################

set_property(TARGET gRPC::gpr PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${gRPC_gpr_LINK_LIBS_DEBUG}
                ${gRPC_gpr_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_gpr_LINK_LIBS_RELEASE}
                ${gRPC_gpr_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_gpr_LINK_LIBS_RELWITHDEBINFO}
                ${gRPC_gpr_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_gpr_LINK_LIBS_MINSIZEREL}
                ${gRPC_gpr_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET gRPC::gpr PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${gRPC_gpr_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_gpr_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_gpr_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_gpr_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET gRPC::gpr PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${gRPC_gpr_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_gpr_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_gpr_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_gpr_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET gRPC::gpr PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${gRPC_gpr_COMPILE_OPTIONS_C_DEBUG}
                 ${gRPC_gpr_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${gRPC_gpr_COMPILE_OPTIONS_C_RELEASE}
                 ${gRPC_gpr_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${gRPC_gpr_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${gRPC_gpr_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${gRPC_gpr_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${gRPC_gpr_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(gRPC_gpr_TARGET_PROPERTIES TRUE)

########## COMPONENT address_sorting TARGET PROPERTIES ######################################

set_property(TARGET gRPC::address_sorting PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${gRPC_address_sorting_LINK_LIBS_DEBUG}
                ${gRPC_address_sorting_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_address_sorting_LINK_LIBS_RELEASE}
                ${gRPC_address_sorting_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_address_sorting_LINK_LIBS_RELWITHDEBINFO}
                ${gRPC_address_sorting_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_address_sorting_LINK_LIBS_MINSIZEREL}
                ${gRPC_address_sorting_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET gRPC::address_sorting PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${gRPC_address_sorting_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_address_sorting_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_address_sorting_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_address_sorting_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET gRPC::address_sorting PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${gRPC_address_sorting_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_address_sorting_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_address_sorting_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_address_sorting_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET gRPC::address_sorting PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${gRPC_address_sorting_COMPILE_OPTIONS_C_DEBUG}
                 ${gRPC_address_sorting_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${gRPC_address_sorting_COMPILE_OPTIONS_C_RELEASE}
                 ${gRPC_address_sorting_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${gRPC_address_sorting_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${gRPC_address_sorting_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${gRPC_address_sorting_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${gRPC_address_sorting_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(gRPC_address_sorting_TARGET_PROPERTIES TRUE)

########## COMPONENT grpc TARGET PROPERTIES ######################################

set_property(TARGET gRPC::grpc PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${gRPC_grpc_LINK_LIBS_DEBUG}
                ${gRPC_grpc_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc_LINK_LIBS_RELEASE}
                ${gRPC_grpc_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc_LINK_LIBS_RELWITHDEBINFO}
                ${gRPC_grpc_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc_LINK_LIBS_MINSIZEREL}
                ${gRPC_grpc_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET gRPC::grpc PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${gRPC_grpc_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${gRPC_grpc_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${gRPC_grpc_COMPILE_OPTIONS_C_DEBUG}
                 ${gRPC_grpc_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${gRPC_grpc_COMPILE_OPTIONS_C_RELEASE}
                 ${gRPC_grpc_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${gRPC_grpc_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${gRPC_grpc_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${gRPC_grpc_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${gRPC_grpc_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(gRPC_grpc_TARGET_PROPERTIES TRUE)

########## COMPONENT grpcpp_channelz TARGET PROPERTIES ######################################

set_property(TARGET gRPC::grpcpp_channelz PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${gRPC_grpcpp_channelz_LINK_LIBS_DEBUG}
                ${gRPC_grpcpp_channelz_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpcpp_channelz_LINK_LIBS_RELEASE}
                ${gRPC_grpcpp_channelz_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpcpp_channelz_LINK_LIBS_RELWITHDEBINFO}
                ${gRPC_grpcpp_channelz_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpcpp_channelz_LINK_LIBS_MINSIZEREL}
                ${gRPC_grpcpp_channelz_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET gRPC::grpcpp_channelz PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${gRPC_grpcpp_channelz_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpcpp_channelz_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpcpp_channelz_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpcpp_channelz_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET gRPC::grpcpp_channelz PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${gRPC_grpcpp_channelz_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpcpp_channelz_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpcpp_channelz_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpcpp_channelz_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET gRPC::grpcpp_channelz PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${gRPC_grpcpp_channelz_COMPILE_OPTIONS_C_DEBUG}
                 ${gRPC_grpcpp_channelz_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${gRPC_grpcpp_channelz_COMPILE_OPTIONS_C_RELEASE}
                 ${gRPC_grpcpp_channelz_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${gRPC_grpcpp_channelz_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${gRPC_grpcpp_channelz_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${gRPC_grpcpp_channelz_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${gRPC_grpcpp_channelz_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(gRPC_grpcpp_channelz_TARGET_PROPERTIES TRUE)

########## COMPONENT grpc_unsecure TARGET PROPERTIES ######################################

set_property(TARGET gRPC::grpc_unsecure PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${gRPC_grpc_unsecure_LINK_LIBS_DEBUG}
                ${gRPC_grpc_unsecure_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc_unsecure_LINK_LIBS_RELEASE}
                ${gRPC_grpc_unsecure_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc_unsecure_LINK_LIBS_RELWITHDEBINFO}
                ${gRPC_grpc_unsecure_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc_unsecure_LINK_LIBS_MINSIZEREL}
                ${gRPC_grpc_unsecure_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET gRPC::grpc_unsecure PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${gRPC_grpc_unsecure_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc_unsecure_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc_unsecure_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc_unsecure_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc_unsecure PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${gRPC_grpc_unsecure_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc_unsecure_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc_unsecure_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc_unsecure_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc_unsecure PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${gRPC_grpc_unsecure_COMPILE_OPTIONS_C_DEBUG}
                 ${gRPC_grpc_unsecure_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${gRPC_grpc_unsecure_COMPILE_OPTIONS_C_RELEASE}
                 ${gRPC_grpc_unsecure_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${gRPC_grpc_unsecure_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${gRPC_grpc_unsecure_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${gRPC_grpc_unsecure_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${gRPC_grpc_unsecure_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(gRPC_grpc_unsecure_TARGET_PROPERTIES TRUE)

########## COMPONENT grpc++_unsecure TARGET PROPERTIES ######################################

set_property(TARGET gRPC::grpc++_unsecure PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${gRPC_grpc++_unsecure_LINK_LIBS_DEBUG}
                ${gRPC_grpc++_unsecure_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_unsecure_LINK_LIBS_RELEASE}
                ${gRPC_grpc++_unsecure_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_unsecure_LINK_LIBS_RELWITHDEBINFO}
                ${gRPC_grpc++_unsecure_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_unsecure_LINK_LIBS_MINSIZEREL}
                ${gRPC_grpc++_unsecure_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++_unsecure PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${gRPC_grpc++_unsecure_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_unsecure_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_unsecure_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_unsecure_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++_unsecure PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${gRPC_grpc++_unsecure_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_unsecure_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_unsecure_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_unsecure_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++_unsecure PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${gRPC_grpc++_unsecure_COMPILE_OPTIONS_C_DEBUG}
                 ${gRPC_grpc++_unsecure_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${gRPC_grpc++_unsecure_COMPILE_OPTIONS_C_RELEASE}
                 ${gRPC_grpc++_unsecure_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${gRPC_grpc++_unsecure_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${gRPC_grpc++_unsecure_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${gRPC_grpc++_unsecure_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${gRPC_grpc++_unsecure_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(gRPC_grpc++_unsecure_TARGET_PROPERTIES TRUE)

########## COMPONENT grpc++ TARGET PROPERTIES ######################################

set_property(TARGET gRPC::grpc++ PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${gRPC_grpc++_LINK_LIBS_DEBUG}
                ${gRPC_grpc++_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_LINK_LIBS_RELEASE}
                ${gRPC_grpc++_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_LINK_LIBS_RELWITHDEBINFO}
                ${gRPC_grpc++_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_LINK_LIBS_MINSIZEREL}
                ${gRPC_grpc++_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++ PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${gRPC_grpc++_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++ PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${gRPC_grpc++_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++ PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${gRPC_grpc++_COMPILE_OPTIONS_C_DEBUG}
                 ${gRPC_grpc++_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${gRPC_grpc++_COMPILE_OPTIONS_C_RELEASE}
                 ${gRPC_grpc++_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${gRPC_grpc++_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${gRPC_grpc++_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${gRPC_grpc++_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${gRPC_grpc++_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(gRPC_grpc++_TARGET_PROPERTIES TRUE)

########## COMPONENT grpc++_reflection TARGET PROPERTIES ######################################

set_property(TARGET gRPC::grpc++_reflection PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${gRPC_grpc++_reflection_LINK_LIBS_DEBUG}
                ${gRPC_grpc++_reflection_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_reflection_LINK_LIBS_RELEASE}
                ${gRPC_grpc++_reflection_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_reflection_LINK_LIBS_RELWITHDEBINFO}
                ${gRPC_grpc++_reflection_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_reflection_LINK_LIBS_MINSIZEREL}
                ${gRPC_grpc++_reflection_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++_reflection PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${gRPC_grpc++_reflection_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_reflection_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_reflection_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_reflection_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++_reflection PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${gRPC_grpc++_reflection_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_reflection_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_reflection_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_reflection_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++_reflection PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${gRPC_grpc++_reflection_COMPILE_OPTIONS_C_DEBUG}
                 ${gRPC_grpc++_reflection_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${gRPC_grpc++_reflection_COMPILE_OPTIONS_C_RELEASE}
                 ${gRPC_grpc++_reflection_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${gRPC_grpc++_reflection_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${gRPC_grpc++_reflection_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${gRPC_grpc++_reflection_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${gRPC_grpc++_reflection_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(gRPC_grpc++_reflection_TARGET_PROPERTIES TRUE)

########## COMPONENT grpc++_error_details TARGET PROPERTIES ######################################

set_property(TARGET gRPC::grpc++_error_details PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${gRPC_grpc++_error_details_LINK_LIBS_DEBUG}
                ${gRPC_grpc++_error_details_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_error_details_LINK_LIBS_RELEASE}
                ${gRPC_grpc++_error_details_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_error_details_LINK_LIBS_RELWITHDEBINFO}
                ${gRPC_grpc++_error_details_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_error_details_LINK_LIBS_MINSIZEREL}
                ${gRPC_grpc++_error_details_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++_error_details PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${gRPC_grpc++_error_details_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_error_details_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_error_details_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_error_details_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++_error_details PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${gRPC_grpc++_error_details_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_error_details_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_error_details_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_error_details_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++_error_details PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${gRPC_grpc++_error_details_COMPILE_OPTIONS_C_DEBUG}
                 ${gRPC_grpc++_error_details_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${gRPC_grpc++_error_details_COMPILE_OPTIONS_C_RELEASE}
                 ${gRPC_grpc++_error_details_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${gRPC_grpc++_error_details_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${gRPC_grpc++_error_details_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${gRPC_grpc++_error_details_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${gRPC_grpc++_error_details_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(gRPC_grpc++_error_details_TARGET_PROPERTIES TRUE)

########## COMPONENT grpc++_alts TARGET PROPERTIES ######################################

set_property(TARGET gRPC::grpc++_alts PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${gRPC_grpc++_alts_LINK_LIBS_DEBUG}
                ${gRPC_grpc++_alts_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_alts_LINK_LIBS_RELEASE}
                ${gRPC_grpc++_alts_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_alts_LINK_LIBS_RELWITHDEBINFO}
                ${gRPC_grpc++_alts_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_alts_LINK_LIBS_MINSIZEREL}
                ${gRPC_grpc++_alts_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++_alts PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${gRPC_grpc++_alts_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_alts_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_alts_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_alts_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++_alts PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${gRPC_grpc++_alts_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${gRPC_grpc++_alts_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${gRPC_grpc++_alts_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${gRPC_grpc++_alts_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET gRPC::grpc++_alts PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${gRPC_grpc++_alts_COMPILE_OPTIONS_C_DEBUG}
                 ${gRPC_grpc++_alts_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${gRPC_grpc++_alts_COMPILE_OPTIONS_C_RELEASE}
                 ${gRPC_grpc++_alts_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${gRPC_grpc++_alts_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${gRPC_grpc++_alts_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${gRPC_grpc++_alts_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${gRPC_grpc++_alts_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(gRPC_grpc++_alts_TARGET_PROPERTIES TRUE)

########## GLOBAL TARGET PROPERTIES #########################################################

if(NOT gRPC_gRPC_TARGET_PROPERTIES)
    set_property(TARGET gRPC::gRPC APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${gRPC_COMPONENTS_DEBUG}>
                 $<$<CONFIG:Release>:${gRPC_COMPONENTS_RELEASE}>
                 $<$<CONFIG:RelWithDebInfo>:${gRPC_COMPONENTS_RELWITHDEBINFO}>
                 $<$<CONFIG:MinSizeRel>:${gRPC_COMPONENTS_MINSIZEREL}>)
endif()

########## BUILD MODULES ####################################################################
#############################################################################################

########## COMPONENT execs BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${gRPC_execs_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_execs_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_execs_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_execs_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()

########## COMPONENT grpc_plugin_support BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${gRPC_grpc_plugin_support_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc_plugin_support_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc_plugin_support_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc_plugin_support_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()

########## COMPONENT upb BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${gRPC_upb_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_upb_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_upb_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_upb_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()

########## COMPONENT gpr BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${gRPC_gpr_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_gpr_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_gpr_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_gpr_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()

########## COMPONENT address_sorting BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${gRPC_address_sorting_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_address_sorting_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_address_sorting_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_address_sorting_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()

########## COMPONENT grpc BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${gRPC_grpc_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()

########## COMPONENT grpcpp_channelz BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${gRPC_grpcpp_channelz_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpcpp_channelz_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpcpp_channelz_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpcpp_channelz_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()

########## COMPONENT grpc_unsecure BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${gRPC_grpc_unsecure_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc_unsecure_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc_unsecure_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc_unsecure_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()

########## COMPONENT grpc++_unsecure BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_unsecure_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_unsecure_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_unsecure_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_unsecure_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()

########## COMPONENT grpc++ BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()

########## COMPONENT grpc++_reflection BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_reflection_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_reflection_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_reflection_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_reflection_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()

########## COMPONENT grpc++_error_details BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_error_details_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_error_details_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_error_details_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_error_details_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()

########## COMPONENT grpc++_alts BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_alts_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_alts_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_alts_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${gRPC_grpc++_alts_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()