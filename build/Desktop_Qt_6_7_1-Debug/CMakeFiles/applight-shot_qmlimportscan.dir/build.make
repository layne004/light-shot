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

# Utility rule file for applight-shot_qmlimportscan.

# Include any custom commands dependencies for this target.
include CMakeFiles/applight-shot_qmlimportscan.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/applight-shot_qmlimportscan.dir/progress.make

CMakeFiles/applight-shot_qmlimportscan: .qt/qml_imports/applight-shot_build.cmake

.qt/qml_imports/applight-shot_build.cmake: /opt/Qt/6.7.1/gcc_64/libexec/qmlimportscanner
.qt/qml_imports/applight-shot_build.cmake: .qt/rcc/qmake_lightshot.qrc
.qt/qml_imports/applight-shot_build.cmake: .qt/rcc/applight-shot_raw_qml_0.qrc
.qt/qml_imports/applight-shot_build.cmake: /root/qq_test/light-shot/MainWindow.qml
.qt/qml_imports/applight-shot_build.cmake: /root/qq_test/light-shot/MainButtons.qml
.qt/qml_imports/applight-shot_build.cmake: /root/qq_test/light-shot/MainActions.qml
.qt/qml_imports/applight-shot_build.cmake: /root/qq_test/light-shot/CaptureWindow.qml
.qt/qml_imports/applight-shot_build.cmake: /root/qq_test/light-shot/SelectionRect.qml
.qt/qml_imports/applight-shot_build.cmake: /root/qq_test/light-shot/SelectAreaButtons.qml
.qt/qml_imports/applight-shot_build.cmake: /root/qq_test/light-shot/lightshot.js
.qt/qml_imports/applight-shot_build.cmake: /root/qq_test/light-shot/SelectionActions.qml
.qt/qml_imports/applight-shot_build.cmake: /root/qq_test/light-shot/Windowundercursor_.qml
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/root/qq_test/light-shot/build/Desktop_Qt_6_7_1-Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running qmlimportscanner for applight-shot"
	cd /root/qq_test/light-shot && /opt/Qt/6.7.1/gcc_64/libexec/qmlimportscanner @/root/qq_test/light-shot/build/Desktop_Qt_6_7_1-Debug/.qt/qml_imports/applight-shot_build.rsp

applight-shot_qmlimportscan: .qt/qml_imports/applight-shot_build.cmake
applight-shot_qmlimportscan: CMakeFiles/applight-shot_qmlimportscan
applight-shot_qmlimportscan: CMakeFiles/applight-shot_qmlimportscan.dir/build.make
.PHONY : applight-shot_qmlimportscan

# Rule to build all files generated by this target.
CMakeFiles/applight-shot_qmlimportscan.dir/build: applight-shot_qmlimportscan
.PHONY : CMakeFiles/applight-shot_qmlimportscan.dir/build

CMakeFiles/applight-shot_qmlimportscan.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/applight-shot_qmlimportscan.dir/cmake_clean.cmake
.PHONY : CMakeFiles/applight-shot_qmlimportscan.dir/clean

CMakeFiles/applight-shot_qmlimportscan.dir/depend:
	cd /root/qq_test/light-shot/build/Desktop_Qt_6_7_1-Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/qq_test/light-shot /root/qq_test/light-shot /root/qq_test/light-shot/build/Desktop_Qt_6_7_1-Debug /root/qq_test/light-shot/build/Desktop_Qt_6_7_1-Debug /root/qq_test/light-shot/build/Desktop_Qt_6_7_1-Debug/CMakeFiles/applight-shot_qmlimportscan.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/applight-shot_qmlimportscan.dir/depend

