# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /root/clion-2020.1/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /root/clion-2020.1/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/CLionProjects/linux_cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/CLionProjects/linux_cpp/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/echo5_fork_server.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/echo5_fork_server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/echo5_fork_server.dir/flags.make

CMakeFiles/echo5_fork_server.dir/tcp/echo5_fork/echo5_fork_server.c.o: CMakeFiles/echo5_fork_server.dir/flags.make
CMakeFiles/echo5_fork_server.dir/tcp/echo5_fork/echo5_fork_server.c.o: ../tcp/echo5_fork/echo5_fork_server.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/CLionProjects/linux_cpp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/echo5_fork_server.dir/tcp/echo5_fork/echo5_fork_server.c.o"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/echo5_fork_server.dir/tcp/echo5_fork/echo5_fork_server.c.o   -c /root/CLionProjects/linux_cpp/tcp/echo5_fork/echo5_fork_server.c

CMakeFiles/echo5_fork_server.dir/tcp/echo5_fork/echo5_fork_server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/echo5_fork_server.dir/tcp/echo5_fork/echo5_fork_server.c.i"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/CLionProjects/linux_cpp/tcp/echo5_fork/echo5_fork_server.c > CMakeFiles/echo5_fork_server.dir/tcp/echo5_fork/echo5_fork_server.c.i

CMakeFiles/echo5_fork_server.dir/tcp/echo5_fork/echo5_fork_server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/echo5_fork_server.dir/tcp/echo5_fork/echo5_fork_server.c.s"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/CLionProjects/linux_cpp/tcp/echo5_fork/echo5_fork_server.c -o CMakeFiles/echo5_fork_server.dir/tcp/echo5_fork/echo5_fork_server.c.s

# Object files for target echo5_fork_server
echo5_fork_server_OBJECTS = \
"CMakeFiles/echo5_fork_server.dir/tcp/echo5_fork/echo5_fork_server.c.o"

# External object files for target echo5_fork_server
echo5_fork_server_EXTERNAL_OBJECTS =

echo5_fork_server: CMakeFiles/echo5_fork_server.dir/tcp/echo5_fork/echo5_fork_server.c.o
echo5_fork_server: CMakeFiles/echo5_fork_server.dir/build.make
echo5_fork_server: CMakeFiles/echo5_fork_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/CLionProjects/linux_cpp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable echo5_fork_server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/echo5_fork_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/echo5_fork_server.dir/build: echo5_fork_server

.PHONY : CMakeFiles/echo5_fork_server.dir/build

CMakeFiles/echo5_fork_server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/echo5_fork_server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/echo5_fork_server.dir/clean

CMakeFiles/echo5_fork_server.dir/depend:
	cd /root/CLionProjects/linux_cpp/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/CLionProjects/linux_cpp /root/CLionProjects/linux_cpp /root/CLionProjects/linux_cpp/cmake-build-debug /root/CLionProjects/linux_cpp/cmake-build-debug /root/CLionProjects/linux_cpp/cmake-build-debug/CMakeFiles/echo5_fork_server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/echo5_fork_server.dir/depend

