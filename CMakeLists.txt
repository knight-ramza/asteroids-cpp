cmake_minimum_required(VERSION 3.20)

project(asteroids LANGUAGES CXX)

if(NOT CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    message(FATAL_ERROR "This project is configured to build with Clang (clang++).")
endif()

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

file(GLOB_RECURSE ASTEROIDS_SRC_FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)

add_executable(asteroids ${ASTEROIDS_SRC_FILES})
