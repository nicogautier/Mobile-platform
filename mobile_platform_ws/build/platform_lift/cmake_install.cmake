# Install script for directory: /home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/student/Desktop/Mobile-platform/mobile_platform_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/platform_lift/action" TYPE FILE FILES "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/action/MoveLift.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/platform_lift/msg" TYPE FILE FILES
    "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftAction.msg"
    "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionGoal.msg"
    "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionResult.msg"
    "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftActionFeedback.msg"
    "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftGoal.msg"
    "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftResult.msg"
    "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/platform_lift/msg/MoveLiftFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/platform_lift/cmake" TYPE FILE FILES "/home/student/Desktop/Mobile-platform/mobile_platform_ws/build/platform_lift/catkin_generated/installspace/platform_lift-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/include/platform_lift")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/roseus/ros/platform_lift")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/common-lisp/ros/platform_lift")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/share/gennodejs/ros/platform_lift")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/lib/python2.7/dist-packages/platform_lift")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/student/Desktop/Mobile-platform/mobile_platform_ws/devel/lib/python2.7/dist-packages/platform_lift")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/student/Desktop/Mobile-platform/mobile_platform_ws/build/platform_lift/catkin_generated/installspace/platform_lift.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/platform_lift/cmake" TYPE FILE FILES "/home/student/Desktop/Mobile-platform/mobile_platform_ws/build/platform_lift/catkin_generated/installspace/platform_lift-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/platform_lift/cmake" TYPE FILE FILES
    "/home/student/Desktop/Mobile-platform/mobile_platform_ws/build/platform_lift/catkin_generated/installspace/platform_liftConfig.cmake"
    "/home/student/Desktop/Mobile-platform/mobile_platform_ws/build/platform_lift/catkin_generated/installspace/platform_liftConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/platform_lift" TYPE FILE FILES "/home/student/Desktop/Mobile-platform/mobile_platform_ws/src/platform_lift/package.xml")
endif()

