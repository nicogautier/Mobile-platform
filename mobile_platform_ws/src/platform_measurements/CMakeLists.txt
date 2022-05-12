cmake_minimum_required(VERSION 3.0.2)
project(platform_measurements)


find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  tf
  nodelet
)

catkin_package(

)


include_directories(
  ${catkin_INCLUDE_DIRS}
)



add_executable(sendGoal src/sendGoal.cpp)
target_link_libraries(sendGoal ${catkin_LIBRARIES})

add_executable(simpleTrajectories src/simpleTrajectories.cpp)
target_link_libraries(simpleTrajectories ${catkin_LIBRARIES})

add_executable(trajectoryMeasurements src/trajectoryMeasurements.cpp)
target_link_libraries(trajectoryMeasurements ${catkin_LIBRARIES})

