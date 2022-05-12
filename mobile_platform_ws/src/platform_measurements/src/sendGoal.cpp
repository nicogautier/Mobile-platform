/*===================== sendGoal.cpp ====================
This program allows to send a goal position to the platform:

subscriber topic:
	/cmd_goal (vector3) : send a goal to the navigation node (x,y,th) 

===============================================================*/


#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <geometry_msgs/Vector3.h>

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;



void callback_receive_goal(const geometry_msgs::Vector3& v){
    static MoveBaseClient ac("move_base", true);
    move_base_msgs::MoveBaseGoal goal;
    
    goal.target_pose.header.frame_id = "base_link";
    goal.target_pose.header.stamp = ros::Time::now();

    goal.target_pose.pose.position.x = v.x;
    goal.target_pose.pose.position.y = v.y;
    goal.target_pose.pose.orientation.z = -1 * sin(v.z/2);
	  goal.target_pose.pose.orientation.w = cos(v.z/2);

    ac.sendGoal(goal);

}



int main(int argc, char** argv){
  ros::init(argc, argv, "send_goal");
  ros::NodeHandle nh;
  ros::Subscriber sub_ISPG = nh.subscribe("/cmd_goal", 1000, callback_receive_goal);
  ros::spin();

}