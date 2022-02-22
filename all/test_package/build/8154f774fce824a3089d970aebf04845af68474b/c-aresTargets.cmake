

if(NOT TARGET c-ares::cares)
    add_library(c-ares::cares INTERFACE IMPORTED)
endif()

if(NOT TARGET c-ares::c-ares)
    add_library(c-ares::c-ares INTERFACE IMPORTED)
endif()

# Load the debug and release library finders
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB CONFIG_FILES "${_DIR}/c-aresTarget-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()

if(c-ares_FIND_COMPONENTS)
    foreach(_FIND_COMPONENT ${c-ares_FIND_COMPONENTS})
        list(FIND c-ares_COMPONENTS_RELEASE "c-ares::${_FIND_COMPONENT}" _index)
        if(${_index} EQUAL -1)
            conan_message(FATAL_ERROR "Conan: Component '${_FIND_COMPONENT}' NOT found in package 'c-ares'")
        else()
            conan_message(STATUS "Conan: Component '${_FIND_COMPONENT}' found in package 'c-ares'")
        endif()
    endforeach()
endif()