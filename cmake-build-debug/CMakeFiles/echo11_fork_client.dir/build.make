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
CMAKE_COMMAND = /home/dingyingsi/clion-2020.1.1/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/dingyingsi/clion-2020.1.1/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/dingyingsi/CLionProjects/tcp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dingyingsi/CLionProjects/tcp/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/echo11_fork_client.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/echo11_fork_client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/echo11_fork_client.dir/flags.make

CMakeFiles/echo11_fork_client.dir/echo11_fork/echo11_fork_client.c.o: CMakeFiles/echo11_fork_client.dir/flags.make
CMakeFiles/echo11_fork_client.dir/echo11_fork/echo11_fork_client.c.o: ../echo11_fork/echo11_fork_client.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dingyingsi/CLionProjects/tcp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/echo11_fork_client.dir/echo11_fork/echo11_fork_client.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/echo11_fork_client.dir/echo11_fork/echo11_fork_client.c.o   -c /home/dingyingsi/CLionProjects/tcp/echo11_fork/echo11_fork_client.c

CMakeFiles/echo11_fork_client.dir/echo11_fork/echo11_fork_client.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/echo11_fork_client.dir/echo11_fork/echo11_fork_client.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/dingyingsi/CLionProjects/tcp/echo11_fork/echo11_fork_client.c > CMakeFiles/echo11_fork_client.dir/echo11_fork/echo11_fork_client.c.i

CMakeFiles/echo11_fork_client.dir/echo11_fork/echo11_fork_client.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/echo11_fork_client.dir/echo11_fork/echo11_fork_client.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/dingyingsi/CLionProjects/tcp/echo11_fork/echo11_fork_client.c -o CMakeFiles/echo11_fork_client.dir/echo11_fork/echo11_fork_client.c.s

# Object files for target echo11_fork_client
echo11_fork_client_OBJECTS = \
"CMakeFiles/echo11_fork_client.dir/echo11_fork/echo11_fork_client.c.o"

# External object files for target echo11_fork_client
echo11_fork_client_EXTERNAL_OBJECTS =

echo11_fork_client: CMakeFiles/echo11_fork_client.dir/echo11_fork/echo11_fork_client.c.o
echo11_fork_client: CMakeFiles/echo11_fork_client.dir/build.make
echo11_fork_client: CMakeFiles/echo11_fork_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dingyingsi/CLionProjects/tcp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable echo11_fork_client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/echo11_fork_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/echo11_fork_client.dir/build: echo11_fork_client

.PHONY : CMakeFiles/echo11_fork_client.dir/build

CMakeFiles/echo11_fork_client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/echo11_fork_client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/echo11_fork_client.dir/clean

CMakeFiles/echo11_fork_client.dir/depend:
	cd /home/dingyingsi/CLionProjects/tcp/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dingyingsi/CLionProjects/tcp /home/dingyingsi/CLionProjects/tcp /home/dingyingsi/CLionProjects/tcp/cmake-build-debug /home/dingyingsi/CLionProjects/tcp/cmake-build-debug /home/dingyingsi/CLionProjects/tcp/cmake-build-debug/CMakeFiles/echo11_fork_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/echo11_fork_client.dir/depend
