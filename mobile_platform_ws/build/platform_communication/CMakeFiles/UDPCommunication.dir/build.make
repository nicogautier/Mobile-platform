# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/student/Mobile-platform/mobile_platform_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/student/Mobile-platform/mobile_platform_ws/build

# Include any dependencies generated for this target.
include platform_communication/CMakeFiles/UDPCommunication.dir/depend.make

# Include the progress variables for this target.
include platform_communication/CMakeFiles/UDPCommunication.dir/progress.make

# Include the compile flags for this target's objects.
include platform_communication/CMakeFiles/UDPCommunication.dir/flags.make

platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o: platform_communication/CMakeFiles/UDPCommunication.dir/flags.make
platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o: /home/student/Mobile-platform/mobile_platform_ws/src/platform_communication/src/UDPCommunication.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/student/Mobile-platform/mobile_platform_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o"
	cd /home/student/Mobile-platform/mobile_platform_ws/build/platform_communication && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o -c /home/student/Mobile-platform/mobile_platform_ws/src/platform_communication/src/UDPCommunication.cpp

platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.i"
	cd /home/student/Mobile-platform/mobile_platform_ws/build/platform_communication && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/student/Mobile-platform/mobile_platform_ws/src/platform_communication/src/UDPCommunication.cpp > CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.i

platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.s"
	cd /home/student/Mobile-platform/mobile_platform_ws/build/platform_communication && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/student/Mobile-platform/mobile_platform_ws/src/platform_communication/src/UDPCommunication.cpp -o CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.s

platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o.requires:

.PHONY : platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o.requires

platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o.provides: platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o.requires
	$(MAKE) -f platform_communication/CMakeFiles/UDPCommunication.dir/build.make platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o.provides.build
.PHONY : platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o.provides

platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o.provides.build: platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o


# Object files for target UDPCommunication
UDPCommunication_OBJECTS = \
"CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o"

# External object files for target UDPCommunication
UDPCommunication_EXTERNAL_OBJECTS =

/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: platform_communication/CMakeFiles/UDPCommunication.dir/build.make
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/libtf.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/libtf2_ros.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/libactionlib.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/libmessage_filters.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/libtf2.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/libnodeletlib.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/libbondcpp.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libuuid.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/libclass_loader.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/libPocoFoundation.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libdl.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/libroslib.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/librospack.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libpython2.7.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/libroscpp.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/librosconsole.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/librostime.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /opt/ros/melodic/lib/libcpp_common.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication: platform_communication/CMakeFiles/UDPCommunication.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/student/Mobile-platform/mobile_platform_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication"
	cd /home/student/Mobile-platform/mobile_platform_ws/build/platform_communication && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/UDPCommunication.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
platform_communication/CMakeFiles/UDPCommunication.dir/build: /home/student/Mobile-platform/mobile_platform_ws/devel/lib/platform_communication/UDPCommunication

.PHONY : platform_communication/CMakeFiles/UDPCommunication.dir/build

platform_communication/CMakeFiles/UDPCommunication.dir/requires: platform_communication/CMakeFiles/UDPCommunication.dir/src/UDPCommunication.cpp.o.requires

.PHONY : platform_communication/CMakeFiles/UDPCommunication.dir/requires

platform_communication/CMakeFiles/UDPCommunication.dir/clean:
	cd /home/student/Mobile-platform/mobile_platform_ws/build/platform_communication && $(CMAKE_COMMAND) -P CMakeFiles/UDPCommunication.dir/cmake_clean.cmake
.PHONY : platform_communication/CMakeFiles/UDPCommunication.dir/clean

platform_communication/CMakeFiles/UDPCommunication.dir/depend:
	cd /home/student/Mobile-platform/mobile_platform_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/student/Mobile-platform/mobile_platform_ws/src /home/student/Mobile-platform/mobile_platform_ws/src/platform_communication /home/student/Mobile-platform/mobile_platform_ws/build /home/student/Mobile-platform/mobile_platform_ws/build/platform_communication /home/student/Mobile-platform/mobile_platform_ws/build/platform_communication/CMakeFiles/UDPCommunication.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : platform_communication/CMakeFiles/UDPCommunication.dir/depend

