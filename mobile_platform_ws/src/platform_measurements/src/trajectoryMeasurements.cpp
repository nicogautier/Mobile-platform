/*===================== trajectoryMeasurements.cpp ====================
This program allows to use some positional lenses to measure the accuracy and the behavior of ROS navigation  :
(The tests were performed with Optotrak cameras)

publisher topic:
	/cmd_goal (vector3) : send a goal to the navigation node (x,y,th) 

===============================================================*/

#include <ros/ros.h>
#include <geometry_msgs/Vector3.h>

#include <iostream>
#include <string>

ros::Publisher pub_cmd_goal;

void chooseTrajectory(int n){
    geometry_msgs::Vector3 v;

    switch (n)
    {
    case 11:
        v.x = 1; v.y = 0; v.z = 0;
        break;
    case 12:
        v.x = -1; v.y = 0; v.z = 0;
        break;
    case 21:
        v.x = 0; v.y = 1; v.z = 0;
        break;
    case 22:
        v.x = 0; v.y = -1; v.z = 0;
        break;
    case 31:
        v.x = 0; v.y = 0; v.z = 3.1416/2;
        break;
    case 32:
        v.x = 0; v.y = 0; v.z = -3.1416/2;
        break;
    case 41:
        v.x = 2; v.y = 0; v.z = 3.1416/2;
        break;
    case 42:
        v.x = -2; v.y = 0; v.z = 3.1416*3/2;
        break;
    case 51:
        v.x = 2; v.y = -1; v.z = -3.1416/2;
        break;
    case 52:
        v.x = 0; v.y = 1; v.z = 0;
        break;
    case 53:
        v.x = -2; v.y = -1; v.z = 3.1416/2;
        break;
    case 54:
        v.x = 0; v.y = 1; v.z = 0;
        break;
    default:
        v.x = 0; v.y = 0; v.z = 0; 
        break;
    }

    pub_cmd_goal.publish(v);
}


void waitPermission(){
    
    std::cout << "Press Enter to continue ...";
    std::cin.get();
    return;
}




int main(int argc, char** argv){
  ros::init(argc, argv, "test_goal");
  ros::NodeHandle nh;

  pub_cmd_goal = nh.advertise<geometry_msgs::Vector3>("/cmd_goal", 10);
  
  int i;
  while(ros::ok()){
    
    std::cout << "\nPlease choose a trajectory (press 0 to see all the trajectories or 9 to quit): ";
    std::cin >> i;
    std::cin.clear();
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');


    
    switch (i)
    {
    case 9:
        return 0;
    case 0:
        std::cout << "1. 1m in  the x direction\n"
        << "2. 1m in the y direction \n"
        << "3. rotate 90° \n"
        << "4. round trip \n"
        << "5. cross loop \n";
        break;

    
    case 1:
        chooseTrajectory(11);
        waitPermission();
        chooseTrajectory(12);
        break;
    
    case 2:
        chooseTrajectory(21);
        waitPermission();
        chooseTrajectory(22);
        break;

    case 3:
        chooseTrajectory(31);
        waitPermission();
        chooseTrajectory(32);
        break;

    case 4:
        chooseTrajectory(41);
        waitPermission();
        chooseTrajectory(42);
        break;

    case 5:
        chooseTrajectory(51);
        waitPermission();
        chooseTrajectory(52);
        waitPermission();
        chooseTrajectory(53);
        waitPermission();
        chooseTrajectory(54);
        break;
    
    default:
        std::cout << "Not a valid trajectory\n";
        break;
    }
  }

}