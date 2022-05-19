cmake_minimum_required(VERSION 3.0.2)
project(platform_communication)


add_compile_options(-std=c++11 -pthread)


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



add_executable(ADSCommunication src/ADSCommunication.cpp)
target_link_libraries(ADSCommunication ${catkin_LIBRARIES})

add_executable(UDPCommunication src/UDPCommunication.cpp)
target_link_libraries(UDPCommunication ${catkin_LIBRARIES})





set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
FIND_LIBRARY(AdsLib_LIBRARIES AdsLib AdsLib/)
target_link_libraries(ADSCommunication ${AdsLib_LIBRARIES} Threads::Threads)

