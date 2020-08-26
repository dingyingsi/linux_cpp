cmake_minimum_required(VERSION 3.16)
project(linux_cpp C CXX)

set(CMAKE_C_STANDARD 11)

link_directories(/usr/lib64/mysql)
link_libraries(mysqlclient)

add_executable(main main.cpp)

add_executable(mysql_cpp mysql/mysql_cpp.cpp)