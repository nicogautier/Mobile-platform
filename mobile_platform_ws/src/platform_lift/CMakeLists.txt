cmake_minimum_required(VERSION 3.0.2)
project(platform_lift)





find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  actionlib_msgs
  actionlib                
  std_msgs
  genmsg                      
  message_generation  
)

add_action_files(DIRECTORY action
  FILES
  MoveLift.action
)

add_service_files(
  FILES
  PositionLift.srv
  
)

generate_messages(
  DEPENDENCIES
  actionlib_msgs
  std_msgs
)


catkin_package(
  CATKIN_DEPENDS actionlib_msgs std_msgs message_runtime

)

include_directories(
  ${catkin_INCLUDE_DIRS}
)


include_directories(

  ${catkin_INCLUDE_DIRS}
)

