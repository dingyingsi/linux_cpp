cmake_minimum_required(VERSION 3.16)
project(tcp C)

set(CMAKE_C_STANDARD 11)

add_executable(main main.c)
add_executable(biglittle biglittle/biglitter.c addr/addr.c)
add_executable(addr addr/addr.c)
add_executable(socket socket/socket.c)
add_executable(select_server select/server.c)
add_executable(select_client select/client.c)