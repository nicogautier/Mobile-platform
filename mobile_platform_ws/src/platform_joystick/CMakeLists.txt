cmake_minimum_required(VERSION 3.0.2)
project(platform_joystick)

find_package(catkin REQUIRED COMPONENTS
  roscpp
)

catkin_package(

)


include_directories(

  ${catkin_INCLUDE_DIRS}
)


add_executable(joystickCmdVel src/joystickCmdVel.cpp)
target_link_libraries(joystickCmdVel ${catkin_LIBRARIES})