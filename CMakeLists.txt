cmake_minimum_required(VERSION 3.16)
project(linux_cpp C CXX)

set(CMAKE_C_STANDARD 11)

# link_directories(/usr/lib64/mysql)
# link_libraries(mysqlclient)

add_executable(GaussJordanAlgrithmn cpp/code/GaussJordanAlgrithmn.cpp)
add_executable(Complex cpp/code/Complex.cpp)
add_executable(typeid cpp/others/typeid.cpp)
add_executable(T01 cpp/template/T01.cpp)
add_executable(T02 cpp/template/T02.cpp)
add_executable(T02Vector cpp/template/T02Vector.cpp)
