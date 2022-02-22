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

include(${CMAKE_CURRENT_LIST_DIR}/c-aresTargets.cmake)

########## FIND PACKAGE DEPENDENCY ##########################################################
#############################################################################################

include(CMakeFindDependencyMacro)

########## TARGETS PROPERTIES ###############################################################
#############################################################################################

########## COMPONENT cares TARGET PROPERTIES ######################################

set_property(TARGET c-ares::cares PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${c-ares_cares_LINK_LIBS_DEBUG}
                ${c-ares_cares_LINKER_FLAGS_LIST_DEBUG}>
             $<$<CONFIG:Release>:${c-ares_cares_LINK_LIBS_RELEASE}
                ${c-ares_cares_LINKER_FLAGS_LIST_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${c-ares_cares_LINK_LIBS_RELWITHDEBINFO}
                ${c-ares_cares_LINKER_FLAGS_LIST_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${c-ares_cares_LINK_LIBS_MINSIZEREL}
                ${c-ares_cares_LINKER_FLAGS_LIST_MINSIZEREL}>)
set_property(TARGET c-ares::cares PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Debug>:${c-ares_cares_INCLUDE_DIRS_DEBUG}>
             $<$<CONFIG:Release>:${c-ares_cares_INCLUDE_DIRS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${c-ares_cares_INCLUDE_DIRS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${c-ares_cares_INCLUDE_DIRS_MINSIZEREL}>)
set_property(TARGET c-ares::cares PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Debug>:${c-ares_cares_COMPILE_DEFINITIONS_DEBUG}>
             $<$<CONFIG:Release>:${c-ares_cares_COMPILE_DEFINITIONS_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:${c-ares_cares_COMPILE_DEFINITIONS_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:${c-ares_cares_COMPILE_DEFINITIONS_MINSIZEREL}>)
set_property(TARGET c-ares::cares PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Debug>:
                 ${c-ares_cares_COMPILE_OPTIONS_C_DEBUG}
                 ${c-ares_cares_COMPILE_OPTIONS_CXX_DEBUG}>
             $<$<CONFIG:Release>:
                 ${c-ares_cares_COMPILE_OPTIONS_C_RELEASE}
                 ${c-ares_cares_COMPILE_OPTIONS_CXX_RELEASE}>
             $<$<CONFIG:RelWithDebInfo>:
                 ${c-ares_cares_COMPILE_OPTIONS_C_RELWITHDEBINFO}
                 ${c-ares_cares_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>
             $<$<CONFIG:MinSizeRel>:
                 ${c-ares_cares_COMPILE_OPTIONS_C_MINSIZEREL}
                 ${c-ares_cares_COMPILE_OPTIONS_CXX_MINSIZEREL}>)
set(c-ares_cares_TARGET_PROPERTIES TRUE)

########## GLOBAL TARGET PROPERTIES #########################################################

if(NOT c-ares_c-ares_TARGET_PROPERTIES)
    set_property(TARGET c-ares::c-ares APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${c-ares_COMPONENTS_DEBUG}>
                 $<$<CONFIG:Release>:${c-ares_COMPONENTS_RELEASE}>
                 $<$<CONFIG:RelWithDebInfo>:${c-ares_COMPONENTS_RELWITHDEBINFO}>
                 $<$<CONFIG:MinSizeRel>:${c-ares_COMPONENTS_MINSIZEREL}>)
endif()

########## BUILD MODULES ####################################################################
#############################################################################################

########## COMPONENT cares BUILD MODULES ##########################################

foreach(_BUILD_MODULE_PATH ${c-ares_cares_BUILD_MODULES_PATHS_DEBUG})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${c-ares_cares_BUILD_MODULES_PATHS_RELEASE})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${c-ares_cares_BUILD_MODULES_PATHS_RELWITHDEBINFO})
    include(${_BUILD_MODULE_PATH})
endforeach()

foreach(_BUILD_MODULE_PATH ${c-ares_cares_BUILD_MODULES_PATHS_MINSIZEREL})
    include(${_BUILD_MODULE_PATH})
endforeach()