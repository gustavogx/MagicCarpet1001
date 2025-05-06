cmake_minimum_required(VERSION 3.10)
project(compare)

# Force Release mode
set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set optimization flags for Release mode
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3")

add_executable(compare compare.cpp)
