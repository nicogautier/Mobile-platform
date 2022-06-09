# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "platform_lift: 7 messages, 1 services")

set(MSG_I_FLAGS "-Iplatform_lift:/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(platform_lift_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg" NAME_WE)
add_custom_target(_platform_lift_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "platform_lift" "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg" "actionlib_msgs/GoalID:platform_lift/MoveLiftGoal:std_msgs/Header"
)

get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/srv/PositionLift.srv" NAME_WE)
add_custom_target(_platform_lift_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "platform_lift" "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/srv/PositionLift.srv" ""
)

get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg" NAME_WE)
add_custom_target(_platform_lift_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "platform_lift" "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg" ""
)

get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg" NAME_WE)
add_custom_target(_platform_lift_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "platform_lift" "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg" ""
)

get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg" NAME_WE)
add_custom_target(_platform_lift_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "platform_lift" "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg" ""
)

get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftAction.msg" NAME_WE)
add_custom_target(_platform_lift_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "platform_lift" "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftAction.msg" "actionlib_msgs/GoalID:platform_lift/MoveLiftFeedback:actionlib_msgs/GoalStatus:platform_lift/MoveLiftActionFeedback:platform_lift/MoveLiftActionGoal:platform_lift/MoveLiftActionResult:std_msgs/Header:platform_lift/MoveLiftGoal:platform_lift/MoveLiftResult"
)

get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg" NAME_WE)
add_custom_target(_platform_lift_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "platform_lift" "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg" "actionlib_msgs/GoalID:platform_lift/MoveLiftFeedback:actionlib_msgs/GoalStatus:std_msgs/Header"
)

get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg" NAME_WE)
add_custom_target(_platform_lift_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "platform_lift" "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:platform_lift/MoveLiftResult:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/platform_lift
)
_generate_msg_cpp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/platform_lift
)
_generate_msg_cpp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/platform_lift
)
_generate_msg_cpp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/platform_lift
)
_generate_msg_cpp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/platform_lift
)
_generate_msg_cpp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/platform_lift
)
_generate_msg_cpp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/platform_lift
)

### Generating Services
_generate_srv_cpp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/srv/PositionLift.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/platform_lift
)

### Generating Module File
_generate_module_cpp(platform_lift
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/platform_lift
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(platform_lift_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(platform_lift_generate_messages platform_lift_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_cpp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/srv/PositionLift.srv" NAME_WE)
add_dependencies(platform_lift_generate_messages_cpp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_cpp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_cpp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_cpp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftAction.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_cpp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_cpp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_cpp _platform_lift_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(platform_lift_gencpp)
add_dependencies(platform_lift_gencpp platform_lift_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS platform_lift_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/platform_lift
)
_generate_msg_eus(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/platform_lift
)
_generate_msg_eus(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/platform_lift
)
_generate_msg_eus(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/platform_lift
)
_generate_msg_eus(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/platform_lift
)
_generate_msg_eus(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/platform_lift
)
_generate_msg_eus(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/platform_lift
)

### Generating Services
_generate_srv_eus(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/srv/PositionLift.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/platform_lift
)

### Generating Module File
_generate_module_eus(platform_lift
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/platform_lift
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(platform_lift_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(platform_lift_generate_messages platform_lift_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_eus _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/srv/PositionLift.srv" NAME_WE)
add_dependencies(platform_lift_generate_messages_eus _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_eus _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_eus _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_eus _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftAction.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_eus _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_eus _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_eus _platform_lift_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(platform_lift_geneus)
add_dependencies(platform_lift_geneus platform_lift_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS platform_lift_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/platform_lift
)
_generate_msg_lisp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/platform_lift
)
_generate_msg_lisp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/platform_lift
)
_generate_msg_lisp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/platform_lift
)
_generate_msg_lisp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/platform_lift
)
_generate_msg_lisp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/platform_lift
)
_generate_msg_lisp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/platform_lift
)

### Generating Services
_generate_srv_lisp(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/srv/PositionLift.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/platform_lift
)

### Generating Module File
_generate_module_lisp(platform_lift
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/platform_lift
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(platform_lift_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(platform_lift_generate_messages platform_lift_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_lisp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/srv/PositionLift.srv" NAME_WE)
add_dependencies(platform_lift_generate_messages_lisp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_lisp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_lisp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_lisp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftAction.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_lisp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_lisp _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_lisp _platform_lift_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(platform_lift_genlisp)
add_dependencies(platform_lift_genlisp platform_lift_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS platform_lift_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/platform_lift
)
_generate_msg_nodejs(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/platform_lift
)
_generate_msg_nodejs(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/platform_lift
)
_generate_msg_nodejs(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/platform_lift
)
_generate_msg_nodejs(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/platform_lift
)
_generate_msg_nodejs(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/platform_lift
)
_generate_msg_nodejs(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/platform_lift
)

### Generating Services
_generate_srv_nodejs(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/srv/PositionLift.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/platform_lift
)

### Generating Module File
_generate_module_nodejs(platform_lift
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/platform_lift
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(platform_lift_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(platform_lift_generate_messages platform_lift_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_nodejs _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/srv/PositionLift.srv" NAME_WE)
add_dependencies(platform_lift_generate_messages_nodejs _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_nodejs _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_nodejs _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_nodejs _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftAction.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_nodejs _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_nodejs _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_nodejs _platform_lift_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(platform_lift_gennodejs)
add_dependencies(platform_lift_gennodejs platform_lift_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS platform_lift_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/platform_lift
)
_generate_msg_py(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/platform_lift
)
_generate_msg_py(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/platform_lift
)
_generate_msg_py(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/platform_lift
)
_generate_msg_py(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/platform_lift
)
_generate_msg_py(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/platform_lift
)
_generate_msg_py(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/platform_lift
)

### Generating Services
_generate_srv_py(platform_lift
  "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/srv/PositionLift.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/platform_lift
)

### Generating Module File
_generate_module_py(platform_lift
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/platform_lift
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(platform_lift_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(platform_lift_generate_messages platform_lift_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_py _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/srv/PositionLift.srv" NAME_WE)
add_dependencies(platform_lift_generate_messages_py _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_py _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_py _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_py _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftAction.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_py _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_py _platform_lift_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg" NAME_WE)
add_dependencies(platform_lift_generate_messages_py _platform_lift_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(platform_lift_genpy)
add_dependencies(platform_lift_genpy platform_lift_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS platform_lift_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/platform_lift)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/platform_lift
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(platform_lift_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(platform_lift_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/platform_lift)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/platform_lift
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(platform_lift_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(platform_lift_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/platform_lift)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/platform_lift
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(platform_lift_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(platform_lift_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/platform_lift)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/platform_lift
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(platform_lift_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(platform_lift_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/platform_lift)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/platform_lift\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/platform_lift
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(platform_lift_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(platform_lift_generate_messages_py std_msgs_generate_messages_py)
endif()
