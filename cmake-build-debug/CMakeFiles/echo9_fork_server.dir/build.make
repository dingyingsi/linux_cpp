# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


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
RM = /root/clion-2020.1/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/CLionProjects/tcp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/CLionProjects/tcp/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/echo9_fork_server.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/echo9_fork_server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/echo9_fork_server.dir/flags.make

CMakeFiles/echo9_fork_server.dir/echo9_fork/echo9_fork_server.c.o: CMakeFiles/echo9_fork_server.dir/flags.make
CMakeFiles/echo9_fork_server.dir/echo9_fork/echo9_fork_server.c.o: ../echo9_fork/echo9_fork_server.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/CLionProjects/tcp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/echo9_fork_server.dir/echo9_fork/echo9_fork_server.c.o"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/echo9_fork_server.dir/echo9_fork/echo9_fork_server.c.o   -c /root/CLionProjects/tcp/echo9_fork/echo9_fork_server.c

CMakeFiles/echo9_fork_server.dir/echo9_fork/echo9_fork_server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/echo9_fork_server.dir/echo9_fork/echo9_fork_server.c.i"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/CLionProjects/tcp/echo9_fork/echo9_fork_server.c > CMakeFiles/echo9_fork_server.dir/echo9_fork/echo9_fork_server.c.i

CMakeFiles/echo9_fork_server.dir/echo9_fork/echo9_fork_server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/echo9_fork_server.dir/echo9_fork/echo9_fork_server.c.s"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/CLionProjects/tcp/echo9_fork/echo9_fork_server.c -o CMakeFiles/echo9_fork_server.dir/echo9_fork/echo9_fork_server.c.s

# Object files for target echo9_fork_server
echo9_fork_server_OBJECTS = \
"CMakeFiles/echo9_fork_server.dir/echo9_fork/echo9_fork_server.c.o"

# External object files for target echo9_fork_server
echo9_fork_server_EXTERNAL_OBJECTS =

echo9_fork_server: CMakeFiles/echo9_fork_server.dir/echo9_fork/echo9_fork_server.c.o
echo9_fork_server: CMakeFiles/echo9_fork_server.dir/build.make
echo9_fork_server: CMakeFiles/echo9_fork_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/CLionProjects/tcp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable echo9_fork_server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/echo9_fork_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/echo9_fork_server.dir/build: echo9_fork_server

.PHONY : CMakeFiles/echo9_fork_server.dir/build

CMakeFiles/echo9_fork_server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/echo9_fork_server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/echo9_fork_server.dir/clean

CMakeFiles/echo9_fork_server.dir/depend:
	cd /root/CLionProjects/tcp/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/CLionProjects/tcp /root/CLionProjects/tcp /root/CLionProjects/tcp/cmake-build-debug /root/CLionProjects/tcp/cmake-build-debug /root/CLionProjects/tcp/cmake-build-debug/CMakeFiles/echo9_fork_server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/echo9_fork_server.dir/depend

