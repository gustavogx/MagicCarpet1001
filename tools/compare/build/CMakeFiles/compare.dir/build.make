# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

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

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gvaldivi/Games/MagicCarpet1001/tools/compare

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gvaldivi/Games/MagicCarpet1001/tools/compare/build

# Include any dependencies generated for this target.
include CMakeFiles/compare.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/compare.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/compare.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/compare.dir/flags.make

CMakeFiles/compare.dir/compare.cpp.o: CMakeFiles/compare.dir/flags.make
CMakeFiles/compare.dir/compare.cpp.o: /home/gvaldivi/Games/MagicCarpet1001/tools/compare/compare.cpp
CMakeFiles/compare.dir/compare.cpp.o: CMakeFiles/compare.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/gvaldivi/Games/MagicCarpet1001/tools/compare/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/compare.dir/compare.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/compare.dir/compare.cpp.o -MF CMakeFiles/compare.dir/compare.cpp.o.d -o CMakeFiles/compare.dir/compare.cpp.o -c /home/gvaldivi/Games/MagicCarpet1001/tools/compare/compare.cpp

CMakeFiles/compare.dir/compare.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/compare.dir/compare.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gvaldivi/Games/MagicCarpet1001/tools/compare/compare.cpp > CMakeFiles/compare.dir/compare.cpp.i

CMakeFiles/compare.dir/compare.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/compare.dir/compare.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gvaldivi/Games/MagicCarpet1001/tools/compare/compare.cpp -o CMakeFiles/compare.dir/compare.cpp.s

# Object files for target compare
compare_OBJECTS = \
"CMakeFiles/compare.dir/compare.cpp.o"

# External object files for target compare
compare_EXTERNAL_OBJECTS =

compare: CMakeFiles/compare.dir/compare.cpp.o
compare: CMakeFiles/compare.dir/build.make
compare: CMakeFiles/compare.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/gvaldivi/Games/MagicCarpet1001/tools/compare/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable compare"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/compare.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/compare.dir/build: compare
.PHONY : CMakeFiles/compare.dir/build

CMakeFiles/compare.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/compare.dir/cmake_clean.cmake
.PHONY : CMakeFiles/compare.dir/clean

CMakeFiles/compare.dir/depend:
	cd /home/gvaldivi/Games/MagicCarpet1001/tools/compare/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gvaldivi/Games/MagicCarpet1001/tools/compare /home/gvaldivi/Games/MagicCarpet1001/tools/compare /home/gvaldivi/Games/MagicCarpet1001/tools/compare/build /home/gvaldivi/Games/MagicCarpet1001/tools/compare/build /home/gvaldivi/Games/MagicCarpet1001/tools/compare/build/CMakeFiles/compare.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/compare.dir/depend

