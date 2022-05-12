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

#define PI 3.1416



void waitPermission(){
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    std::cout << "Press Enter to continue ...";
    std::cin.get();
    return;
}

void sendGoal(double x, double y, double z ){
    geometry_msgs::Vector3 v;
    v.x = x; v.y = y; v.z = z;
    pub_cmd_goal.publish(v);
}


int main(int argc, char** argv){
  ros::init(argc, argv, "trajectory_measurements");
  ros::NodeHandle nh;

  pub_cmd_goal = nh.advertise<geometry_msgs::Vector3>("/cmd_goal", 10);
  
  std::string c;
  while(ros::ok()){
    
    std::cout << "\nPlease choose a trajectory (press h for help): ";
    std::cin >> c;

    if(c=="h"){
        std::cout << "h. help\n" << "q. quit \n" << "c. cancel \n"
        << "w. 0.5m in the x direction \n" << "s. 0.5m in the -x direction \n"
        << "d. 0.5m in the y direction \n" << "a. 0.5m in the -y direction \n"
        << "e. rotate +90° \n" << "a. rotate -90° \n"
        << "1. forward and backward \n" << "2. square loop \n"
        << "2. cross loop \n";
    }

    else if(c=="q"){return 0;}

    else if(c=="c"){sendGoal(0,0,0);}

    else if(c=="w"){sendGoal(0.5,0,0);}

    else if(c=="s"){sendGoal(-0.5,0,0);}

    else if(c=="d"){sendGoal(0,0.5,0);}

    else if(c=="a"){sendGoal(0,-0.5,0);}

    else if(c=="e"){sendGoal(0,0,PI/2);}

    else if(c=="r"){sendGoal(0,0,-PI/2);}

    else if(c=="1"){sendGoal(1,0,PI/2);
                    waitPermission();
                    sendGoal(0,-1,-PI/2);
                    }

    else if(c=="2"){sendGoal(1,0,-PI/2);
                    waitPermission();
                    sendGoal(1,0,-PI/2);
                    waitPermission();
                    sendGoal(1,0,-PI/2);
                    waitPermission();
                    sendGoal(1,0,-PI/2);
                    }

    else if(c=="3"){sendGoal(1.5,1,-PI/2);
                    waitPermission();
                    sendGoal(-1,0,0);
                    waitPermission();
                    sendGoal(1,1.5,PI/2);
                    waitPermission();
                    sendGoal(0,-1,0);
                    }

    else{std::cout << "Not a valid trajectory\n";}

    

  }

}