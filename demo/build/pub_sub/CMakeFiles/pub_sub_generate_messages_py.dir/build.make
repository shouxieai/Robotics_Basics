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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /datav/projects/ROS/demo/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /datav/projects/ROS/demo/build

# Utility rule file for pub_sub_generate_messages_py.

# Include the progress variables for this target.
include pub_sub/CMakeFiles/pub_sub_generate_messages_py.dir/progress.make

pub_sub/CMakeFiles/pub_sub_generate_messages_py: /datav/projects/ROS/demo/devel/lib/python3/dist-packages/pub_sub/msg/_Spacecraft.py
pub_sub/CMakeFiles/pub_sub_generate_messages_py: /datav/projects/ROS/demo/devel/lib/python3/dist-packages/pub_sub/msg/__init__.py


/datav/projects/ROS/demo/devel/lib/python3/dist-packages/pub_sub/msg/_Spacecraft.py: /opt/ros/noetic/lib/genpy/genmsg_py.py
/datav/projects/ROS/demo/devel/lib/python3/dist-packages/pub_sub/msg/_Spacecraft.py: /datav/projects/ROS/demo/src/pub_sub/msg/Spacecraft.msg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/datav/projects/ROS/demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating Python from MSG pub_sub/Spacecraft"
	cd /datav/projects/ROS/demo/build/pub_sub && ../catkin_generated/env_cached.sh /datav/software/anaconda3/bin/python3 /opt/ros/noetic/share/genpy/cmake/../../../lib/genpy/genmsg_py.py /datav/projects/ROS/demo/src/pub_sub/msg/Spacecraft.msg -Ipub_sub:/datav/projects/ROS/demo/src/pub_sub/msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -p pub_sub -o /datav/projects/ROS/demo/devel/lib/python3/dist-packages/pub_sub/msg

/datav/projects/ROS/demo/devel/lib/python3/dist-packages/pub_sub/msg/__init__.py: /opt/ros/noetic/lib/genpy/genmsg_py.py
/datav/projects/ROS/demo/devel/lib/python3/dist-packages/pub_sub/msg/__init__.py: /datav/projects/ROS/demo/devel/lib/python3/dist-packages/pub_sub/msg/_Spacecraft.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/datav/projects/ROS/demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating Python msg __init__.py for pub_sub"
	cd /datav/projects/ROS/demo/build/pub_sub && ../catkin_generated/env_cached.sh /datav/software/anaconda3/bin/python3 /opt/ros/noetic/share/genpy/cmake/../../../lib/genpy/genmsg_py.py -o /datav/projects/ROS/demo/devel/lib/python3/dist-packages/pub_sub/msg --initpy

pub_sub_generate_messages_py: pub_sub/CMakeFiles/pub_sub_generate_messages_py
pub_sub_generate_messages_py: /datav/projects/ROS/demo/devel/lib/python3/dist-packages/pub_sub/msg/_Spacecraft.py
pub_sub_generate_messages_py: /datav/projects/ROS/demo/devel/lib/python3/dist-packages/pub_sub/msg/__init__.py
pub_sub_generate_messages_py: pub_sub/CMakeFiles/pub_sub_generate_messages_py.dir/build.make

.PHONY : pub_sub_generate_messages_py

# Rule to build all files generated by this target.
pub_sub/CMakeFiles/pub_sub_generate_messages_py.dir/build: pub_sub_generate_messages_py

.PHONY : pub_sub/CMakeFiles/pub_sub_generate_messages_py.dir/build

pub_sub/CMakeFiles/pub_sub_generate_messages_py.dir/clean:
	cd /datav/projects/ROS/demo/build/pub_sub && $(CMAKE_COMMAND) -P CMakeFiles/pub_sub_generate_messages_py.dir/cmake_clean.cmake
.PHONY : pub_sub/CMakeFiles/pub_sub_generate_messages_py.dir/clean

pub_sub/CMakeFiles/pub_sub_generate_messages_py.dir/depend:
	cd /datav/projects/ROS/demo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /datav/projects/ROS/demo/src /datav/projects/ROS/demo/src/pub_sub /datav/projects/ROS/demo/build /datav/projects/ROS/demo/build/pub_sub /datav/projects/ROS/demo/build/pub_sub/CMakeFiles/pub_sub_generate_messages_py.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pub_sub/CMakeFiles/pub_sub_generate_messages_py.dir/depend
