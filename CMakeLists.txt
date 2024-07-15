
cmake_minimum_required(VERSION 3.14)

project(
  openjump
  VERSION 0.1
  DESCRIPTION "openjump game")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(openjump src/main.cpp)
