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


set(c-ares_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/c-ares/1.17.2/_/_/package/2b43ac9f2f2b42510d2425b1d0e91048dcff03aa/include")
set(c-ares_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/c-ares/1.17.2/_/_/package/2b43ac9f2f2b42510d2425b1d0e91048dcff03aa/include")
set(c-ares_INCLUDES_RELEASE "/Users/cyberax/.conan/data/c-ares/1.17.2/_/_/package/2b43ac9f2f2b42510d2425b1d0e91048dcff03aa/include")
set(c-ares_RES_DIRS_RELEASE )
set(c-ares_DEFINITIONS_RELEASE "-DCARES_STATICLIB")
set(c-ares_LINKER_FLAGS_RELEASE_LIST
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>"
)
set(c-ares_COMPILE_DEFINITIONS_RELEASE "CARES_STATICLIB")
set(c-ares_COMPILE_OPTIONS_RELEASE_LIST "" "")
set(c-ares_COMPILE_OPTIONS_C_RELEASE "")
set(c-ares_COMPILE_OPTIONS_CXX_RELEASE "")
set(c-ares_LIBRARIES_TARGETS_RELEASE "") # Will be filled later, if CMake 3
set(c-ares_LIBRARIES_RELEASE "") # Will be filled later
set(c-ares_LIBS_RELEASE "") # Same as c-ares_LIBRARIES
set(c-ares_SYSTEM_LIBS_RELEASE resolv)
set(c-ares_FRAMEWORK_DIRS_RELEASE )
set(c-ares_FRAMEWORKS_RELEASE )
set(c-ares_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
set(c-ares_BUILD_MODULES_PATHS_RELEASE )

conan_find_apple_frameworks(c-ares_FRAMEWORKS_FOUND_RELEASE "${c-ares_FRAMEWORKS_RELEASE}" "${c-ares_FRAMEWORK_DIRS_RELEASE}")

mark_as_advanced(c-ares_INCLUDE_DIRS_RELEASE
                 c-ares_INCLUDE_DIR_RELEASE
                 c-ares_INCLUDES_RELEASE
                 c-ares_DEFINITIONS_RELEASE
                 c-ares_LINKER_FLAGS_RELEASE_LIST
                 c-ares_COMPILE_DEFINITIONS_RELEASE
                 c-ares_COMPILE_OPTIONS_RELEASE_LIST
                 c-ares_LIBRARIES_RELEASE
                 c-ares_LIBS_RELEASE
                 c-ares_LIBRARIES_TARGETS_RELEASE)

# Find the real .lib/.a and add them to c-ares_LIBS and c-ares_LIBRARY_LIST
set(c-ares_LIBRARY_LIST_RELEASE cares)
set(c-ares_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/c-ares/1.17.2/_/_/package/2b43ac9f2f2b42510d2425b1d0e91048dcff03aa/lib")

# Gather all the libraries that should be linked to the targets (do not touch existing variables):
set(_c-ares_DEPENDENCIES_RELEASE "${c-ares_FRAMEWORKS_FOUND_RELEASE} ${c-ares_SYSTEM_LIBS_RELEASE} ")

conan_package_library_targets("${c-ares_LIBRARY_LIST_RELEASE}"  # libraries
                              "${c-ares_LIB_DIRS_RELEASE}"      # package_libdir
                              "${_c-ares_DEPENDENCIES_RELEASE}"  # deps
                              c-ares_LIBRARIES_RELEASE            # out_libraries
                              c-ares_LIBRARIES_TARGETS_RELEASE    # out_libraries_targets
                              "_RELEASE"                          # build_type
                              "c-ares")                                      # package_name

set(c-ares_LIBS_RELEASE ${c-ares_LIBRARIES_RELEASE})

foreach(_FRAMEWORK ${c-ares_FRAMEWORKS_FOUND_RELEASE})
    list(APPEND c-ares_LIBRARIES_TARGETS_RELEASE ${_FRAMEWORK})
    list(APPEND c-ares_LIBRARIES_RELEASE ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${c-ares_SYSTEM_LIBS_RELEASE})
    list(APPEND c-ares_LIBRARIES_TARGETS_RELEASE ${_SYSTEM_LIB})
    list(APPEND c-ares_LIBRARIES_RELEASE ${_SYSTEM_LIB})
endforeach()

# We need to add our requirements too
set(c-ares_LIBRARIES_TARGETS_RELEASE "${c-ares_LIBRARIES_TARGETS_RELEASE};")
set(c-ares_LIBRARIES_RELEASE "${c-ares_LIBRARIES_RELEASE};")

set(CMAKE_MODULE_PATH "/Users/cyberax/.conan/data/c-ares/1.17.2/_/_/package/2b43ac9f2f2b42510d2425b1d0e91048dcff03aa/" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH "/Users/cyberax/.conan/data/c-ares/1.17.2/_/_/package/2b43ac9f2f2b42510d2425b1d0e91048dcff03aa/" ${CMAKE_PREFIX_PATH})

set(c-ares_COMPONENTS_RELEASE c-ares::cares)

########### COMPONENT cares VARIABLES #############################################

set(c-ares_cares_INCLUDE_DIRS_RELEASE "/Users/cyberax/.conan/data/c-ares/1.17.2/_/_/package/2b43ac9f2f2b42510d2425b1d0e91048dcff03aa/include")
set(c-ares_cares_INCLUDE_DIR_RELEASE "/Users/cyberax/.conan/data/c-ares/1.17.2/_/_/package/2b43ac9f2f2b42510d2425b1d0e91048dcff03aa/include")
set(c-ares_cares_INCLUDES_RELEASE "/Users/cyberax/.conan/data/c-ares/1.17.2/_/_/package/2b43ac9f2f2b42510d2425b1d0e91048dcff03aa/include")
set(c-ares_cares_LIB_DIRS_RELEASE "/Users/cyberax/.conan/data/c-ares/1.17.2/_/_/package/2b43ac9f2f2b42510d2425b1d0e91048dcff03aa/lib")
set(c-ares_cares_RES_DIRS_RELEASE )
set(c-ares_cares_DEFINITIONS_RELEASE "-DCARES_STATICLIB")
set(c-ares_cares_COMPILE_DEFINITIONS_RELEASE "CARES_STATICLIB")
set(c-ares_cares_COMPILE_OPTIONS_C_RELEASE "")
set(c-ares_cares_COMPILE_OPTIONS_CXX_RELEASE "")
set(c-ares_cares_LIBS_RELEASE cares)
set(c-ares_cares_SYSTEM_LIBS_RELEASE resolv)
set(c-ares_cares_FRAMEWORK_DIRS_RELEASE )
set(c-ares_cares_FRAMEWORKS_RELEASE )
set(c-ares_cares_BUILD_MODULES_PATHS_RELEASE )
set(c-ares_cares_DEPENDENCIES_RELEASE )
set(c-ares_cares_LINKER_FLAGS_LIST_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>
)

########## COMPONENT cares FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(c-ares_cares_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(c-ares_cares_FRAMEWORKS_FOUND_RELEASE "${c-ares_cares_FRAMEWORKS_RELEASE}" "${c-ares_cares_FRAMEWORK_DIRS_RELEASE}")

set(c-ares_cares_LIB_TARGETS_RELEASE "")
set(c-ares_cares_NOT_USED_RELEASE "")
set(c-ares_cares_LIBS_FRAMEWORKS_DEPS_RELEASE ${c-ares_cares_FRAMEWORKS_FOUND_RELEASE} ${c-ares_cares_SYSTEM_LIBS_RELEASE} ${c-ares_cares_DEPENDENCIES_RELEASE})
conan_package_library_targets("${c-ares_cares_LIBS_RELEASE}"
                              "${c-ares_cares_LIB_DIRS_RELEASE}"
                              "${c-ares_cares_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              c-ares_cares_NOT_USED_RELEASE
                              c-ares_cares_LIB_TARGETS_RELEASE
                              "RELEASE"
                              "c-ares_cares")

set(c-ares_cares_LINK_LIBS_RELEASE ${c-ares_cares_LIB_TARGETS_RELEASE} ${c-ares_cares_LIBS_FRAMEWORKS_DEPS_RELEASE})