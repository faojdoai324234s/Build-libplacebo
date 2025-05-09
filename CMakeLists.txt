cmake_minimum_required( VERSION 3.19 )

set( library_name libplacebo )

project( ${library_name} C )

set( CMAKE_INCLUDE_CURRENT_DIR ON )
#set( CMAKE_CXX_STANDARD 17 )
#set( CMAKE_CXX_STANDARD_REQUIRED ON )
#set( CMAKE_CXX_EXTENSIONS OFF )
set( CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS True )

if(MSVC)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /std:c17 /experimental:c11atomics")
endif()

include_directories(include)

file( GLOB_RECURSE SRC_FILES ${PROJECT_SOURCE_DIR}/src/*.c ${PROJECT_SOURCE_DIR}/src/*.cpp ${PROJECT_SOURCE_DIR}/src/*.h )

set_property( DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${library_name} )

add_library( ${library_name} SHARED ${SRC_FILES} )

target_include_directories( ${library_name} PUBLIC ${PROJECT_SOURCE_DIR}/include )
