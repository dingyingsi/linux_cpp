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
include CMakeFiles/addr.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/addr.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/addr.dir/flags.make

CMakeFiles/addr.dir/addr/addr.c.o: CMakeFiles/addr.dir/flags.make
CMakeFiles/addr.dir/addr/addr.c.o: ../addr/addr.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/CLionProjects/tcp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/addr.dir/addr/addr.c.o"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/addr.dir/addr/addr.c.o   -c /root/CLionProjects/tcp/addr/addr.c

CMakeFiles/addr.dir/addr/addr.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/addr.dir/addr/addr.c.i"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/CLionProjects/tcp/addr/addr.c > CMakeFiles/addr.dir/addr/addr.c.i

CMakeFiles/addr.dir/addr/addr.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/addr.dir/addr/addr.c.s"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/CLionProjects/tcp/addr/addr.c -o CMakeFiles/addr.dir/addr/addr.c.s

# Object files for target addr
addr_OBJECTS = \
"CMakeFiles/addr.dir/addr/addr.c.o"

# External object files for target addr
addr_EXTERNAL_OBJECTS =

addr: CMakeFiles/addr.dir/addr/addr.c.o
addr: CMakeFiles/addr.dir/build.make
addr: CMakeFiles/addr.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/CLionProjects/tcp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable addr"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/addr.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/addr.dir/build: addr

.PHONY : CMakeFiles/addr.dir/build

CMakeFiles/addr.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/addr.dir/cmake_clean.cmake
.PHONY : CMakeFiles/addr.dir/clean

CMakeFiles/addr.dir/depend:
	cd /root/CLionProjects/tcp/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/CLionProjects/tcp /root/CLionProjects/tcp /root/CLionProjects/tcp/cmake-build-debug /root/CLionProjects/tcp/cmake-build-debug /root/CLionProjects/tcp/cmake-build-debug/CMakeFiles/addr.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/addr.dir/depend

