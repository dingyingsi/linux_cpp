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
include CMakeFiles/biglittle.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/biglittle.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/biglittle.dir/flags.make

CMakeFiles/biglittle.dir/tcp/biglittle/biglitter.c.o: CMakeFiles/biglittle.dir/flags.make
CMakeFiles/biglittle.dir/tcp/biglittle/biglitter.c.o: ../tcp/biglittle/biglitter.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/CLionProjects/linux_cpp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/biglittle.dir/tcp/biglittle/biglitter.c.o"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/biglittle.dir/tcp/biglittle/biglitter.c.o   -c /root/CLionProjects/linux_cpp/tcp/biglittle/biglitter.c

CMakeFiles/biglittle.dir/tcp/biglittle/biglitter.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/biglittle.dir/tcp/biglittle/biglitter.c.i"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/CLionProjects/linux_cpp/tcp/biglittle/biglitter.c > CMakeFiles/biglittle.dir/tcp/biglittle/biglitter.c.i

CMakeFiles/biglittle.dir/tcp/biglittle/biglitter.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/biglittle.dir/tcp/biglittle/biglitter.c.s"
	/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/CLionProjects/linux_cpp/tcp/biglittle/biglitter.c -o CMakeFiles/biglittle.dir/tcp/biglittle/biglitter.c.s

# Object files for target biglittle
biglittle_OBJECTS = \
"CMakeFiles/biglittle.dir/tcp/biglittle/biglitter.c.o"

# External object files for target biglittle
biglittle_EXTERNAL_OBJECTS =

biglittle: CMakeFiles/biglittle.dir/tcp/biglittle/biglitter.c.o
biglittle: CMakeFiles/biglittle.dir/build.make
biglittle: CMakeFiles/biglittle.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/CLionProjects/linux_cpp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable biglittle"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/biglittle.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/biglittle.dir/build: biglittle

.PHONY : CMakeFiles/biglittle.dir/build

CMakeFiles/biglittle.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/biglittle.dir/cmake_clean.cmake
.PHONY : CMakeFiles/biglittle.dir/clean

CMakeFiles/biglittle.dir/depend:
	cd /root/CLionProjects/linux_cpp/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/CLionProjects/linux_cpp /root/CLionProjects/linux_cpp /root/CLionProjects/linux_cpp/cmake-build-debug /root/CLionProjects/linux_cpp/cmake-build-debug /root/CLionProjects/linux_cpp/cmake-build-debug/CMakeFiles/biglittle.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/biglittle.dir/depend

