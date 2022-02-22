########## MACROS ###########################################################################
#############################################################################################


macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS FRAMEWORKS_DIRS)
    if(APPLE)
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${FRAMEWORKS_DIRS} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${FRAMEWORKS_DIRS}")
            endif()
        endforeach()
    endif()
endmacro()


function(conan_package_library_targets libraries package_libdir deps out_libraries out_libraries_target build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            list(APPEND _out_libraries ${CONAN_FOUND_LIBRARY})
            if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
                # Create a micro-target for each lib/a found
                string(REGEX REPLACE "[^A-Za-z0-9.+_-]" "_" _LIBRARY_NAME ${_LIBRARY_NAME})
                set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
                if(NOT TARGET ${_LIB_NAME})
                    # Create a micro-target for each lib/a found
                    add_library(${_LIB_NAME} UNKNOWN IMPORTED)
                    set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
                    set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
                else()
                    conan_message(STATUS "Skipping already existing target: ${_LIB_NAME}")
                endif()
                list(APPEND _out_libraries_target ${_LIB_NAME})
            endif()
            conan_message(STATUS "Found: ${CONAN_FOUND_LIBRARY}")
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            list(APPEND _out_libraries_target ${_LIBRARY_NAME})
            list(APPEND _out_libraries ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
        # Add all dependencies to all targets
        string(REPLACE " " ";" deps_list "${deps}")
        foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
            set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
        endforeach()
    endif()

    set(${out_libraries} ${_out_libraries} PARENT_SCOPE)
    set(${out_libraries_target} ${_out_libraries_target} PARENT_SCOPE)
endfunction()


########### VARIABLES #######################################################################
#############################################################################################


set(gRPC_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_RES_DIRS_RELEASE )
set(gRPC_DEFINITIONS_RELEASE )
set(gRPC_LINKER_FLAGS_RELEASE_LIST
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>"
)
set(gRPC_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_COMPILE_OPTIONS_RELEASE_LIST "" "")
set(gRPC_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_LIBRARIES_TARGETS_RELEASE "") # Will be filled later, if CMake 3
set(gRPC_LIBRARIES_RELEASE "") # Will be filled later
set(gRPC_LIBS_RELEASE "") # Same as gRPC_LIBRARIES
set(gRPC_SYSTEM_LIBS_RELEASE m pthread)
set(gRPC_FRAMEWORK_DIRS_RELEASE )
set(gRPC_FRAMEWORKS_RELEASE CoreFoundation)
set(gRPC_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
set(gRPC_BUILD_MODULES_PATHS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib/cmake/grpc_cpp_plugin.cmake")

conan_find_apple_frameworks(gRPC_FRAMEWORKS_FOUND_RELEASE "${gRPC_FRAMEWORKS_RELEASE}" "${gRPC_FRAMEWORK_DIRS_RELEASE}")

mark_as_advanced(gRPC_INCLUDE_DIRS_RELEASE
                 gRPC_INCLUDE_DIR_RELEASE
                 gRPC_INCLUDES_RELEASE
                 gRPC_DEFINITIONS_RELEASE
                 gRPC_LINKER_FLAGS_RELEASE_LIST
                 gRPC_COMPILE_DEFINITIONS_RELEASE
                 gRPC_COMPILE_OPTIONS_RELEASE_LIST
                 gRPC_LIBRARIES_RELEASE
                 gRPC_LIBS_RELEASE
                 gRPC_LIBRARIES_TARGETS_RELEASE)

# Find the real .lib/.a and add them to gRPC_LIBS and gRPC_LIBRARY_LIST
set(gRPC_LIBRARY_LIST_RELEASE grpc++_alts grpc++_error_details grpc++_reflection grpc++ grpc++_unsecure grpc_unsecure grpcpp_channelz grpc address_sorting gpr upb grpc_plugin_support)
set(gRPC_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")

# Gather all the libraries that should be linked to the targets (do not touch existing variables):
set(_gRPC_DEPENDENCIES_RELEASE "${gRPC_FRAMEWORKS_FOUND_RELEASE} ${gRPC_SYSTEM_LIBS_RELEASE} protobuf::libprotobuf;ZLIB::ZLIB;c-ares::cares;re2::re2;absl::flat_hash_map;absl::inlined_vector;absl::statusor;absl::bind_front;OpenSSL::SSL;OpenSSL::Crypto;absl::base;absl::memory;absl::status;absl::str_format;absl::strings;absl::synchronization;absl::time;absl::optional;protobuf::libprotoc")

conan_package_library_targets("${gRPC_LIBRARY_LIST_RELEASE}"  # libraries
                              "${gRPC_LIB_DIRS_RELEASE}"      # package_libdir
                              "${_gRPC_DEPENDENCIES_RELEASE}"  # deps
                              gRPC_LIBRARIES_RELEASE            # out_libraries
                              gRPC_LIBRARIES_TARGETS_RELEASE    # out_libraries_targets
                              "_RELEASE"                          # build_type
                              "gRPC")                                      # package_name

set(gRPC_LIBS_RELEASE ${gRPC_LIBRARIES_RELEASE})

foreach(_FRAMEWORK ${gRPC_FRAMEWORKS_FOUND_RELEASE})
    list(APPEND gRPC_LIBRARIES_TARGETS_RELEASE ${_FRAMEWORK})
    list(APPEND gRPC_LIBRARIES_RELEASE ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${gRPC_SYSTEM_LIBS_RELEASE})
    list(APPEND gRPC_LIBRARIES_TARGETS_RELEASE ${_SYSTEM_LIB})
    list(APPEND gRPC_LIBRARIES_RELEASE ${_SYSTEM_LIB})
endforeach()

# We need to add our requirements too
set(gRPC_LIBRARIES_TARGETS_RELEASE "${gRPC_LIBRARIES_TARGETS_RELEASE};protobuf::libprotobuf;ZLIB::ZLIB;c-ares::cares;re2::re2;absl::flat_hash_map;absl::inlined_vector;absl::statusor;absl::bind_front;OpenSSL::SSL;OpenSSL::Crypto;absl::base;absl::memory;absl::status;absl::str_format;absl::strings;absl::synchronization;absl::time;absl::optional;protobuf::libprotoc")
set(gRPC_LIBRARIES_RELEASE "${gRPC_LIBRARIES_RELEASE};protobuf::libprotobuf;ZLIB::ZLIB;c-ares::cares;re2::re2;absl::flat_hash_map;absl::inlined_vector;absl::statusor;absl::bind_front;OpenSSL::SSL;OpenSSL::Crypto;absl::base;absl::memory;absl::status;absl::str_format;absl::strings;absl::synchronization;absl::time;absl::optional;protobuf::libprotoc")

set(CMAKE_MODULE_PATH "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/"
			"/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib/cmake" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/"
			"/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib/cmake" ${CMAKE_PREFIX_PATH})

set(gRPC_COMPONENTS_RELEASE gRPC::grpc++_alts gRPC::grpc++_error_details gRPC::grpc++_reflection gRPC::grpc++ gRPC::grpc++_unsecure gRPC::grpc_unsecure gRPC::grpcpp_channelz gRPC::grpc gRPC::address_sorting gRPC::gpr gRPC::upb gRPC::grpc_plugin_support gRPC::execs)

########### COMPONENT execs VARIABLES #############################################

set(gRPC_execs_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_execs_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_execs_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_execs_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")
set(gRPC_execs_RES_DIRS_RELEASE )
set(gRPC_execs_DEFINITIONS_RELEASE )
set(gRPC_execs_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_execs_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_execs_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_execs_LIBS_RELEASE )
set(gRPC_execs_SYSTEM_LIBS_RELEASE )
set(gRPC_execs_FRAMEWORK_DIRS_RELEASE )
set(gRPC_execs_FRAMEWORKS_RELEASE )
set(gRPC_execs_BUILD_MODULES_PATHS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib/cmake/grpc_cpp_plugin.cmake")
set(gRPC_execs_DEPENDENCIES_RELEASE )
set(gRPC_execs_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT execs FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gRPC_execs_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gRPC_execs_FRAMEWORKS_FOUND_RELEASE "${gRPC_execs_FRAMEWORKS_RELEASE}" "${gRPC_execs_FRAMEWORK_DIRS_RELEASE}")

set(gRPC_execs_LIB_TARGETS_RELEASE "")
set(gRPC_execs_NOT_USED_RELEASE "")
set(gRPC_execs_LIBS_FRAMEWORKS_DEPS_RELEASE ${gRPC_execs_FRAMEWORKS_FOUND_RELEASE} ${gRPC_execs_SYSTEM_LIBS_RELEASE} ${gRPC_execs_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gRPC_execs_LIBS_RELEASE}"
                              "${gRPC_execs_LIB_DIRS_RELEASE}"
                              "${gRPC_execs_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gRPC_execs_NOT_USED_RELEASE
                              gRPC_execs_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "gRPC_execs")

set(gRPC_execs_LINK_LIBS_RELEASE ${gRPC_execs_LIB_TARGETS_RELEASE} ${gRPC_execs_LIBS_FRAMEWORKS_DEPS_RELEASE})

########### COMPONENT grpc_plugin_support VARIABLES #############################################

set(gRPC_grpc_plugin_support_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc_plugin_support_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc_plugin_support_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc_plugin_support_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")
set(gRPC_grpc_plugin_support_RES_DIRS_RELEASE )
set(gRPC_grpc_plugin_support_DEFINITIONS_RELEASE )
set(gRPC_grpc_plugin_support_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_grpc_plugin_support_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_grpc_plugin_support_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_grpc_plugin_support_LIBS_RELEASE grpc_plugin_support)
set(gRPC_grpc_plugin_support_SYSTEM_LIBS_RELEASE m pthread)
set(gRPC_grpc_plugin_support_FRAMEWORK_DIRS_RELEASE )
set(gRPC_grpc_plugin_support_FRAMEWORKS_RELEASE )
set(gRPC_grpc_plugin_support_BUILD_MODULES_PATHS_RELEASE )
set(gRPC_grpc_plugin_support_DEPENDENCIES_RELEASE protobuf::libprotoc protobuf::libprotobuf)
set(gRPC_grpc_plugin_support_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT grpc_plugin_support FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gRPC_grpc_plugin_support_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gRPC_grpc_plugin_support_FRAMEWORKS_FOUND_RELEASE "${gRPC_grpc_plugin_support_FRAMEWORKS_RELEASE}" "${gRPC_grpc_plugin_support_FRAMEWORK_DIRS_RELEASE}")

set(gRPC_grpc_plugin_support_LIB_TARGETS_RELEASE "")
set(gRPC_grpc_plugin_support_NOT_USED_RELEASE "")
set(gRPC_grpc_plugin_support_LIBS_FRAMEWORKS_DEPS_RELEASE ${gRPC_grpc_plugin_support_FRAMEWORKS_FOUND_RELEASE} ${gRPC_grpc_plugin_support_SYSTEM_LIBS_RELEASE} ${gRPC_grpc_plugin_support_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gRPC_grpc_plugin_support_LIBS_RELEASE}"
                              "${gRPC_grpc_plugin_support_LIB_DIRS_RELEASE}"
                              "${gRPC_grpc_plugin_support_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gRPC_grpc_plugin_support_NOT_USED_RELEASE
                              gRPC_grpc_plugin_support_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "gRPC_grpc_plugin_support")

set(gRPC_grpc_plugin_support_LINK_LIBS_RELEASE ${gRPC_grpc_plugin_support_LIB_TARGETS_RELEASE} ${gRPC_grpc_plugin_support_LIBS_FRAMEWORKS_DEPS_RELEASE})

########### COMPONENT upb VARIABLES #############################################

set(gRPC_upb_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_upb_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_upb_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_upb_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")
set(gRPC_upb_RES_DIRS_RELEASE )
set(gRPC_upb_DEFINITIONS_RELEASE )
set(gRPC_upb_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_upb_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_upb_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_upb_LIBS_RELEASE upb)
set(gRPC_upb_SYSTEM_LIBS_RELEASE m pthread)
set(gRPC_upb_FRAMEWORK_DIRS_RELEASE )
set(gRPC_upb_FRAMEWORKS_RELEASE )
set(gRPC_upb_BUILD_MODULES_PATHS_RELEASE )
set(gRPC_upb_DEPENDENCIES_RELEASE )
set(gRPC_upb_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT upb FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gRPC_upb_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gRPC_upb_FRAMEWORKS_FOUND_RELEASE "${gRPC_upb_FRAMEWORKS_RELEASE}" "${gRPC_upb_FRAMEWORK_DIRS_RELEASE}")

set(gRPC_upb_LIB_TARGETS_RELEASE "")
set(gRPC_upb_NOT_USED_RELEASE "")
set(gRPC_upb_LIBS_FRAMEWORKS_DEPS_RELEASE ${gRPC_upb_FRAMEWORKS_FOUND_RELEASE} ${gRPC_upb_SYSTEM_LIBS_RELEASE} ${gRPC_upb_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gRPC_upb_LIBS_RELEASE}"
                              "${gRPC_upb_LIB_DIRS_RELEASE}"
                              "${gRPC_upb_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gRPC_upb_NOT_USED_RELEASE
                              gRPC_upb_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "gRPC_upb")

set(gRPC_upb_LINK_LIBS_RELEASE ${gRPC_upb_LIB_TARGETS_RELEASE} ${gRPC_upb_LIBS_FRAMEWORKS_DEPS_RELEASE})

########### COMPONENT gpr VARIABLES #############################################

set(gRPC_gpr_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_gpr_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_gpr_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_gpr_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")
set(gRPC_gpr_RES_DIRS_RELEASE )
set(gRPC_gpr_DEFINITIONS_RELEASE )
set(gRPC_gpr_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_gpr_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_gpr_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_gpr_LIBS_RELEASE gpr)
set(gRPC_gpr_SYSTEM_LIBS_RELEASE m pthread)
set(gRPC_gpr_FRAMEWORK_DIRS_RELEASE )
set(gRPC_gpr_FRAMEWORKS_RELEASE )
set(gRPC_gpr_BUILD_MODULES_PATHS_RELEASE )
set(gRPC_gpr_DEPENDENCIES_RELEASE absl::base absl::memory absl::status absl::str_format absl::strings absl::synchronization absl::time absl::optional)
set(gRPC_gpr_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT gpr FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gRPC_gpr_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gRPC_gpr_FRAMEWORKS_FOUND_RELEASE "${gRPC_gpr_FRAMEWORKS_RELEASE}" "${gRPC_gpr_FRAMEWORK_DIRS_RELEASE}")

set(gRPC_gpr_LIB_TARGETS_RELEASE "")
set(gRPC_gpr_NOT_USED_RELEASE "")
set(gRPC_gpr_LIBS_FRAMEWORKS_DEPS_RELEASE ${gRPC_gpr_FRAMEWORKS_FOUND_RELEASE} ${gRPC_gpr_SYSTEM_LIBS_RELEASE} ${gRPC_gpr_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gRPC_gpr_LIBS_RELEASE}"
                              "${gRPC_gpr_LIB_DIRS_RELEASE}"
                              "${gRPC_gpr_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gRPC_gpr_NOT_USED_RELEASE
                              gRPC_gpr_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "gRPC_gpr")

set(gRPC_gpr_LINK_LIBS_RELEASE ${gRPC_gpr_LIB_TARGETS_RELEASE} ${gRPC_gpr_LIBS_FRAMEWORKS_DEPS_RELEASE})

########### COMPONENT address_sorting VARIABLES #############################################

set(gRPC_address_sorting_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_address_sorting_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_address_sorting_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_address_sorting_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")
set(gRPC_address_sorting_RES_DIRS_RELEASE )
set(gRPC_address_sorting_DEFINITIONS_RELEASE )
set(gRPC_address_sorting_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_address_sorting_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_address_sorting_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_address_sorting_LIBS_RELEASE address_sorting)
set(gRPC_address_sorting_SYSTEM_LIBS_RELEASE m pthread)
set(gRPC_address_sorting_FRAMEWORK_DIRS_RELEASE )
set(gRPC_address_sorting_FRAMEWORKS_RELEASE )
set(gRPC_address_sorting_BUILD_MODULES_PATHS_RELEASE )
set(gRPC_address_sorting_DEPENDENCIES_RELEASE )
set(gRPC_address_sorting_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT address_sorting FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gRPC_address_sorting_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gRPC_address_sorting_FRAMEWORKS_FOUND_RELEASE "${gRPC_address_sorting_FRAMEWORKS_RELEASE}" "${gRPC_address_sorting_FRAMEWORK_DIRS_RELEASE}")

set(gRPC_address_sorting_LIB_TARGETS_RELEASE "")
set(gRPC_address_sorting_NOT_USED_RELEASE "")
set(gRPC_address_sorting_LIBS_FRAMEWORKS_DEPS_RELEASE ${gRPC_address_sorting_FRAMEWORKS_FOUND_RELEASE} ${gRPC_address_sorting_SYSTEM_LIBS_RELEASE} ${gRPC_address_sorting_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gRPC_address_sorting_LIBS_RELEASE}"
                              "${gRPC_address_sorting_LIB_DIRS_RELEASE}"
                              "${gRPC_address_sorting_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gRPC_address_sorting_NOT_USED_RELEASE
                              gRPC_address_sorting_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "gRPC_address_sorting")

set(gRPC_address_sorting_LINK_LIBS_RELEASE ${gRPC_address_sorting_LIB_TARGETS_RELEASE} ${gRPC_address_sorting_LIBS_FRAMEWORKS_DEPS_RELEASE})

########### COMPONENT grpc VARIABLES #############################################

set(gRPC_grpc_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")
set(gRPC_grpc_RES_DIRS_RELEASE )
set(gRPC_grpc_DEFINITIONS_RELEASE )
set(gRPC_grpc_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_grpc_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_grpc_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_grpc_LIBS_RELEASE grpc)
set(gRPC_grpc_SYSTEM_LIBS_RELEASE m pthread)
set(gRPC_grpc_FRAMEWORK_DIRS_RELEASE )
set(gRPC_grpc_FRAMEWORKS_RELEASE CoreFoundation)
set(gRPC_grpc_BUILD_MODULES_PATHS_RELEASE )
set(gRPC_grpc_DEPENDENCIES_RELEASE ZLIB::ZLIB c-ares::cares gRPC::address_sorting re2::re2 gRPC::upb absl::flat_hash_map absl::inlined_vector absl::bind_front absl::statusor gRPC::gpr OpenSSL::SSL OpenSSL::Crypto gRPC::address_sorting gRPC::upb)
set(gRPC_grpc_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT grpc FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gRPC_grpc_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gRPC_grpc_FRAMEWORKS_FOUND_RELEASE "${gRPC_grpc_FRAMEWORKS_RELEASE}" "${gRPC_grpc_FRAMEWORK_DIRS_RELEASE}")

set(gRPC_grpc_LIB_TARGETS_RELEASE "")
set(gRPC_grpc_NOT_USED_RELEASE "")
set(gRPC_grpc_LIBS_FRAMEWORKS_DEPS_RELEASE ${gRPC_grpc_FRAMEWORKS_FOUND_RELEASE} ${gRPC_grpc_SYSTEM_LIBS_RELEASE} ${gRPC_grpc_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gRPC_grpc_LIBS_RELEASE}"
                              "${gRPC_grpc_LIB_DIRS_RELEASE}"
                              "${gRPC_grpc_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gRPC_grpc_NOT_USED_RELEASE
                              gRPC_grpc_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "gRPC_grpc")

set(gRPC_grpc_LINK_LIBS_RELEASE ${gRPC_grpc_LIB_TARGETS_RELEASE} ${gRPC_grpc_LIBS_FRAMEWORKS_DEPS_RELEASE})

########### COMPONENT grpcpp_channelz VARIABLES #############################################

set(gRPC_grpcpp_channelz_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpcpp_channelz_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpcpp_channelz_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpcpp_channelz_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")
set(gRPC_grpcpp_channelz_RES_DIRS_RELEASE )
set(gRPC_grpcpp_channelz_DEFINITIONS_RELEASE )
set(gRPC_grpcpp_channelz_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_grpcpp_channelz_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_grpcpp_channelz_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_grpcpp_channelz_LIBS_RELEASE grpcpp_channelz)
set(gRPC_grpcpp_channelz_SYSTEM_LIBS_RELEASE m pthread)
set(gRPC_grpcpp_channelz_FRAMEWORK_DIRS_RELEASE )
set(gRPC_grpcpp_channelz_FRAMEWORKS_RELEASE )
set(gRPC_grpcpp_channelz_BUILD_MODULES_PATHS_RELEASE )
set(gRPC_grpcpp_channelz_DEPENDENCIES_RELEASE protobuf::libprotobuf gRPC::grpc)
set(gRPC_grpcpp_channelz_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT grpcpp_channelz FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gRPC_grpcpp_channelz_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gRPC_grpcpp_channelz_FRAMEWORKS_FOUND_RELEASE "${gRPC_grpcpp_channelz_FRAMEWORKS_RELEASE}" "${gRPC_grpcpp_channelz_FRAMEWORK_DIRS_RELEASE}")

set(gRPC_grpcpp_channelz_LIB_TARGETS_RELEASE "")
set(gRPC_grpcpp_channelz_NOT_USED_RELEASE "")
set(gRPC_grpcpp_channelz_LIBS_FRAMEWORKS_DEPS_RELEASE ${gRPC_grpcpp_channelz_FRAMEWORKS_FOUND_RELEASE} ${gRPC_grpcpp_channelz_SYSTEM_LIBS_RELEASE} ${gRPC_grpcpp_channelz_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gRPC_grpcpp_channelz_LIBS_RELEASE}"
                              "${gRPC_grpcpp_channelz_LIB_DIRS_RELEASE}"
                              "${gRPC_grpcpp_channelz_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gRPC_grpcpp_channelz_NOT_USED_RELEASE
                              gRPC_grpcpp_channelz_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "gRPC_grpcpp_channelz")

set(gRPC_grpcpp_channelz_LINK_LIBS_RELEASE ${gRPC_grpcpp_channelz_LIB_TARGETS_RELEASE} ${gRPC_grpcpp_channelz_LIBS_FRAMEWORKS_DEPS_RELEASE})

########### COMPONENT grpc_unsecure VARIABLES #############################################

set(gRPC_grpc_unsecure_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc_unsecure_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc_unsecure_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc_unsecure_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")
set(gRPC_grpc_unsecure_RES_DIRS_RELEASE )
set(gRPC_grpc_unsecure_DEFINITIONS_RELEASE )
set(gRPC_grpc_unsecure_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_grpc_unsecure_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_grpc_unsecure_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_grpc_unsecure_LIBS_RELEASE grpc_unsecure)
set(gRPC_grpc_unsecure_SYSTEM_LIBS_RELEASE m pthread)
set(gRPC_grpc_unsecure_FRAMEWORK_DIRS_RELEASE )
set(gRPC_grpc_unsecure_FRAMEWORKS_RELEASE CoreFoundation)
set(gRPC_grpc_unsecure_BUILD_MODULES_PATHS_RELEASE )
set(gRPC_grpc_unsecure_DEPENDENCIES_RELEASE ZLIB::ZLIB c-ares::cares gRPC::address_sorting re2::re2 gRPC::upb absl::flat_hash_map absl::inlined_vector absl::statusor gRPC::gpr gRPC::address_sorting gRPC::upb)
set(gRPC_grpc_unsecure_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT grpc_unsecure FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gRPC_grpc_unsecure_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gRPC_grpc_unsecure_FRAMEWORKS_FOUND_RELEASE "${gRPC_grpc_unsecure_FRAMEWORKS_RELEASE}" "${gRPC_grpc_unsecure_FRAMEWORK_DIRS_RELEASE}")

set(gRPC_grpc_unsecure_LIB_TARGETS_RELEASE "")
set(gRPC_grpc_unsecure_NOT_USED_RELEASE "")
set(gRPC_grpc_unsecure_LIBS_FRAMEWORKS_DEPS_RELEASE ${gRPC_grpc_unsecure_FRAMEWORKS_FOUND_RELEASE} ${gRPC_grpc_unsecure_SYSTEM_LIBS_RELEASE} ${gRPC_grpc_unsecure_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gRPC_grpc_unsecure_LIBS_RELEASE}"
                              "${gRPC_grpc_unsecure_LIB_DIRS_RELEASE}"
                              "${gRPC_grpc_unsecure_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gRPC_grpc_unsecure_NOT_USED_RELEASE
                              gRPC_grpc_unsecure_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "gRPC_grpc_unsecure")

set(gRPC_grpc_unsecure_LINK_LIBS_RELEASE ${gRPC_grpc_unsecure_LIB_TARGETS_RELEASE} ${gRPC_grpc_unsecure_LIBS_FRAMEWORKS_DEPS_RELEASE})

########### COMPONENT grpc++_unsecure VARIABLES #############################################

set(gRPC_grpc++_unsecure_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_unsecure_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_unsecure_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_unsecure_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")
set(gRPC_grpc++_unsecure_RES_DIRS_RELEASE )
set(gRPC_grpc++_unsecure_DEFINITIONS_RELEASE )
set(gRPC_grpc++_unsecure_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_grpc++_unsecure_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_grpc++_unsecure_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_grpc++_unsecure_LIBS_RELEASE grpc++_unsecure)
set(gRPC_grpc++_unsecure_SYSTEM_LIBS_RELEASE m pthread)
set(gRPC_grpc++_unsecure_FRAMEWORK_DIRS_RELEASE )
set(gRPC_grpc++_unsecure_FRAMEWORKS_RELEASE )
set(gRPC_grpc++_unsecure_BUILD_MODULES_PATHS_RELEASE )
set(gRPC_grpc++_unsecure_DEPENDENCIES_RELEASE protobuf::libprotobuf gRPC::grpc_unsecure)
set(gRPC_grpc++_unsecure_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT grpc++_unsecure FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gRPC_grpc++_unsecure_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gRPC_grpc++_unsecure_FRAMEWORKS_FOUND_RELEASE "${gRPC_grpc++_unsecure_FRAMEWORKS_RELEASE}" "${gRPC_grpc++_unsecure_FRAMEWORK_DIRS_RELEASE}")

set(gRPC_grpc++_unsecure_LIB_TARGETS_RELEASE "")
set(gRPC_grpc++_unsecure_NOT_USED_RELEASE "")
set(gRPC_grpc++_unsecure_LIBS_FRAMEWORKS_DEPS_RELEASE ${gRPC_grpc++_unsecure_FRAMEWORKS_FOUND_RELEASE} ${gRPC_grpc++_unsecure_SYSTEM_LIBS_RELEASE} ${gRPC_grpc++_unsecure_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gRPC_grpc++_unsecure_LIBS_RELEASE}"
                              "${gRPC_grpc++_unsecure_LIB_DIRS_RELEASE}"
                              "${gRPC_grpc++_unsecure_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gRPC_grpc++_unsecure_NOT_USED_RELEASE
                              gRPC_grpc++_unsecure_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "gRPC_grpc++_unsecure")

set(gRPC_grpc++_unsecure_LINK_LIBS_RELEASE ${gRPC_grpc++_unsecure_LIB_TARGETS_RELEASE} ${gRPC_grpc++_unsecure_LIBS_FRAMEWORKS_DEPS_RELEASE})

########### COMPONENT grpc++ VARIABLES #############################################

set(gRPC_grpc++_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")
set(gRPC_grpc++_RES_DIRS_RELEASE )
set(gRPC_grpc++_DEFINITIONS_RELEASE )
set(gRPC_grpc++_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_grpc++_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_grpc++_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_grpc++_LIBS_RELEASE grpc++)
set(gRPC_grpc++_SYSTEM_LIBS_RELEASE m pthread)
set(gRPC_grpc++_FRAMEWORK_DIRS_RELEASE )
set(gRPC_grpc++_FRAMEWORKS_RELEASE )
set(gRPC_grpc++_BUILD_MODULES_PATHS_RELEASE )
set(gRPC_grpc++_DEPENDENCIES_RELEASE protobuf::libprotobuf gRPC::grpc)
set(gRPC_grpc++_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT grpc++ FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gRPC_grpc++_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gRPC_grpc++_FRAMEWORKS_FOUND_RELEASE "${gRPC_grpc++_FRAMEWORKS_RELEASE}" "${gRPC_grpc++_FRAMEWORK_DIRS_RELEASE}")

set(gRPC_grpc++_LIB_TARGETS_RELEASE "")
set(gRPC_grpc++_NOT_USED_RELEASE "")
set(gRPC_grpc++_LIBS_FRAMEWORKS_DEPS_RELEASE ${gRPC_grpc++_FRAMEWORKS_FOUND_RELEASE} ${gRPC_grpc++_SYSTEM_LIBS_RELEASE} ${gRPC_grpc++_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gRPC_grpc++_LIBS_RELEASE}"
                              "${gRPC_grpc++_LIB_DIRS_RELEASE}"
                              "${gRPC_grpc++_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gRPC_grpc++_NOT_USED_RELEASE
                              gRPC_grpc++_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "gRPC_grpc++")

set(gRPC_grpc++_LINK_LIBS_RELEASE ${gRPC_grpc++_LIB_TARGETS_RELEASE} ${gRPC_grpc++_LIBS_FRAMEWORKS_DEPS_RELEASE})

########### COMPONENT grpc++_reflection VARIABLES #############################################

set(gRPC_grpc++_reflection_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_reflection_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_reflection_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_reflection_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")
set(gRPC_grpc++_reflection_RES_DIRS_RELEASE )
set(gRPC_grpc++_reflection_DEFINITIONS_RELEASE )
set(gRPC_grpc++_reflection_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_grpc++_reflection_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_grpc++_reflection_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_grpc++_reflection_LIBS_RELEASE grpc++_reflection)
set(gRPC_grpc++_reflection_SYSTEM_LIBS_RELEASE m pthread)
set(gRPC_grpc++_reflection_FRAMEWORK_DIRS_RELEASE )
set(gRPC_grpc++_reflection_FRAMEWORKS_RELEASE )
set(gRPC_grpc++_reflection_BUILD_MODULES_PATHS_RELEASE )
set(gRPC_grpc++_reflection_DEPENDENCIES_RELEASE protobuf::libprotobuf gRPC::grpc++)
set(gRPC_grpc++_reflection_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT grpc++_reflection FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gRPC_grpc++_reflection_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gRPC_grpc++_reflection_FRAMEWORKS_FOUND_RELEASE "${gRPC_grpc++_reflection_FRAMEWORKS_RELEASE}" "${gRPC_grpc++_reflection_FRAMEWORK_DIRS_RELEASE}")

set(gRPC_grpc++_reflection_LIB_TARGETS_RELEASE "")
set(gRPC_grpc++_reflection_NOT_USED_RELEASE "")
set(gRPC_grpc++_reflection_LIBS_FRAMEWORKS_DEPS_RELEASE ${gRPC_grpc++_reflection_FRAMEWORKS_FOUND_RELEASE} ${gRPC_grpc++_reflection_SYSTEM_LIBS_RELEASE} ${gRPC_grpc++_reflection_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gRPC_grpc++_reflection_LIBS_RELEASE}"
                              "${gRPC_grpc++_reflection_LIB_DIRS_RELEASE}"
                              "${gRPC_grpc++_reflection_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gRPC_grpc++_reflection_NOT_USED_RELEASE
                              gRPC_grpc++_reflection_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "gRPC_grpc++_reflection")

set(gRPC_grpc++_reflection_LINK_LIBS_RELEASE ${gRPC_grpc++_reflection_LIB_TARGETS_RELEASE} ${gRPC_grpc++_reflection_LIBS_FRAMEWORKS_DEPS_RELEASE})

########### COMPONENT grpc++_error_details VARIABLES #############################################

set(gRPC_grpc++_error_details_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_error_details_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_error_details_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_error_details_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")
set(gRPC_grpc++_error_details_RES_DIRS_RELEASE )
set(gRPC_grpc++_error_details_DEFINITIONS_RELEASE )
set(gRPC_grpc++_error_details_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_grpc++_error_details_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_grpc++_error_details_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_grpc++_error_details_LIBS_RELEASE grpc++_error_details)
set(gRPC_grpc++_error_details_SYSTEM_LIBS_RELEASE m pthread)
set(gRPC_grpc++_error_details_FRAMEWORK_DIRS_RELEASE )
set(gRPC_grpc++_error_details_FRAMEWORKS_RELEASE )
set(gRPC_grpc++_error_details_BUILD_MODULES_PATHS_RELEASE )
set(gRPC_grpc++_error_details_DEPENDENCIES_RELEASE protobuf::libprotobuf gRPC::grpc++)
set(gRPC_grpc++_error_details_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT grpc++_error_details FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gRPC_grpc++_error_details_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gRPC_grpc++_error_details_FRAMEWORKS_FOUND_RELEASE "${gRPC_grpc++_error_details_FRAMEWORKS_RELEASE}" "${gRPC_grpc++_error_details_FRAMEWORK_DIRS_RELEASE}")

set(gRPC_grpc++_error_details_LIB_TARGETS_RELEASE "")
set(gRPC_grpc++_error_details_NOT_USED_RELEASE "")
set(gRPC_grpc++_error_details_LIBS_FRAMEWORKS_DEPS_RELEASE ${gRPC_grpc++_error_details_FRAMEWORKS_FOUND_RELEASE} ${gRPC_grpc++_error_details_SYSTEM_LIBS_RELEASE} ${gRPC_grpc++_error_details_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gRPC_grpc++_error_details_LIBS_RELEASE}"
                              "${gRPC_grpc++_error_details_LIB_DIRS_RELEASE}"
                              "${gRPC_grpc++_error_details_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gRPC_grpc++_error_details_NOT_USED_RELEASE
                              gRPC_grpc++_error_details_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "gRPC_grpc++_error_details")

set(gRPC_grpc++_error_details_LINK_LIBS_RELEASE ${gRPC_grpc++_error_details_LIB_TARGETS_RELEASE} ${gRPC_grpc++_error_details_LIBS_FRAMEWORKS_DEPS_RELEASE})

########### COMPONENT grpc++_alts VARIABLES #############################################

set(gRPC_grpc++_alts_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_alts_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_alts_INCLUDES_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/include")
set(gRPC_grpc++_alts_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/grpc/1.43.0/aurorasolar/release/package/2eae302c65cf74561d7f822dd9daad99a2e13777/lib")
set(gRPC_grpc++_alts_RES_DIRS_RELEASE )
set(gRPC_grpc++_alts_DEFINITIONS_RELEASE )
set(gRPC_grpc++_alts_COMPILE_DEFINITIONS_RELEASE )
set(gRPC_grpc++_alts_COMPILE_OPTIONS_C_RELEASE "")
set(gRPC_grpc++_alts_COMPILE_OPTIONS_CXX_RELEASE "")
set(gRPC_grpc++_alts_LIBS_RELEASE grpc++_alts)
set(gRPC_grpc++_alts_SYSTEM_LIBS_RELEASE m pthread)
set(gRPC_grpc++_alts_FRAMEWORK_DIRS_RELEASE )
set(gRPC_grpc++_alts_FRAMEWORKS_RELEASE )
set(gRPC_grpc++_alts_BUILD_MODULES_PATHS_RELEASE )
set(gRPC_grpc++_alts_DEPENDENCIES_RELEASE protobuf::libprotobuf gRPC::grpc++)
set(gRPC_grpc++_alts_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT grpc++_alts FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gRPC_grpc++_alts_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gRPC_grpc++_alts_FRAMEWORKS_FOUND_RELEASE "${gRPC_grpc++_alts_FRAMEWORKS_RELEASE}" "${gRPC_grpc++_alts_FRAMEWORK_DIRS_RELEASE}")

set(gRPC_grpc++_alts_LIB_TARGETS_RELEASE "")
set(gRPC_grpc++_alts_NOT_USED_RELEASE "")
set(gRPC_grpc++_alts_LIBS_FRAMEWORKS_DEPS_RELEASE ${gRPC_grpc++_alts_FRAMEWORKS_FOUND_RELEASE} ${gRPC_grpc++_alts_SYSTEM_LIBS_RELEASE} ${gRPC_grpc++_alts_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gRPC_grpc++_alts_LIBS_RELEASE}"
                              "${gRPC_grpc++_alts_LIB_DIRS_RELEASE}"
                              "${gRPC_grpc++_alts_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gRPC_grpc++_alts_NOT_USED_RELEASE
                              gRPC_grpc++_alts_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "gRPC_grpc++_alts")

set(gRPC_grpc++_alts_LINK_LIBS_RELEASE ${gRPC_grpc++_alts_LIB_TARGETS_RELEASE} ${gRPC_grpc++_alts_LIBS_FRAMEWORKS_DEPS_RELEASE})