# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

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

# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_SOURCE_DIR = /root/qq_test/light-shot

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/qq_test/light-shot/build/Desktop_Qt_6_7_1-Debug

# Utility rule file for applight-shot_qmllint.

# Include any custom commands dependencies for this target.
include CMakeFiles/applight-shot_qmllint.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/applight-shot_qmllint.dir/progress.make

CMakeFiles/applight-shot_qmllint: /opt/Qt/6.7.1/gcc_64/bin/qmllint
CMakeFiles/applight-shot_qmllint: /root/qq_test/light-shot/MainWindow.qml
CMakeFiles/applight-shot_qmllint: /root/qq_test/light-shot/MainButtons.qml
CMakeFiles/applight-shot_qmllint: /root/qq_test/light-shot/MainActions.qml
CMakeFiles/applight-shot_qmllint: /root/qq_test/light-shot/CaptureWindow.qml
CMakeFiles/applight-shot_qmllint: /root/qq_test/light-shot/SelectionRect.qml
CMakeFiles/applight-shot_qmllint: /root/qq_test/light-shot/SelectAreaButtons.qml
CMakeFiles/applight-shot_qmllint: /root/qq_test/light-shot/lightshot.js
CMakeFiles/applight-shot_qmllint: /root/qq_test/light-shot/SelectionActions.qml
CMakeFiles/applight-shot_qmllint: /root/qq_test/light-shot/Windowundercursor_.qml
CMakeFiles/applight-shot_qmllint: .rcc/qmllint/applight-shot.rsp
	cd /root/qq_test/light-shot && /opt/Qt/6.7.1/gcc_64/bin/qmllint @/root/qq_test/light-shot/build/Desktop_Qt_6_7_1-Debug/.rcc/qmllint/applight-shot.rsp

applight-shot_qmllint: CMakeFiles/applight-shot_qmllint
applight-shot_qmllint: CMakeFiles/applight-shot_qmllint.dir/build.make
.PHONY : applight-shot_qmllint

# Rule to build all files generated by this target.
CMakeFiles/applight-shot_qmllint.dir/build: applight-shot_qmllint
.PHONY : CMakeFiles/applight-shot_qmllint.dir/build

CMakeFiles/applight-shot_qmllint.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/applight-shot_qmllint.dir/cmake_clean.cmake
.PHONY : CMakeFiles/applight-shot_qmllint.dir/clean

CMakeFiles/applight-shot_qmllint.dir/depend:
	cd /root/qq_test/light-shot/build/Desktop_Qt_6_7_1-Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/qq_test/light-shot /root/qq_test/light-shot /root/qq_test/light-shot/build/Desktop_Qt_6_7_1-Debug /root/qq_test/light-shot/build/Desktop_Qt_6_7_1-Debug /root/qq_test/light-shot/build/Desktop_Qt_6_7_1-Debug/CMakeFiles/applight-shot_qmllint.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/applight-shot_qmllint.dir/depend

