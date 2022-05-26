/*===================== ADSCommunication.cpp ====================
This program allows the communication with the PLC through ADS:

Publisher topic:
	/odom (Odometry) : pubishes odometry of the platform  at 1kHz
	
subscriber topic:
	/cmd_vel (Twist) : updates velocity variables of the PLC ((lin.x, lin.y, lin.z), (ang.x, ang.y, ang.z))

server service:
	/changeModeJoystick (SetInt) : update joystick mode (joystick, autonomous or stop)

===============================================================*/


#include <ros/ros.h>
#include <std_msgs/Header.h>
#include <std_msgs/String.h>
#include <std_msgs/Header.h>
#include <std_msgs/Bool.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/PoseWithCovariance.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/TwistWithCovariance.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/Vector3.h>
#include <tf/transform_broadcaster.h>

#include <cob_srvs/SetInt.h>


#include <chrono>
#include <stdint.h>
#include <math.h>  
#include <thread>

#include "../AdsLib/AdsLib.h"
#include "../AdsLib/AdsVariable.h"
#include "../AdsLib/AdsNotificationOOI.h"

const double timeSlice = 0.05;

//create route to the PLC
static const AmsNetId remoteNetId{ 5, 51, 149, 114, 1, 1 };
static const char remoteIpV4[] = "192.168.3.1";
AdsDevice route{ remoteIpV4, remoteNetId, AMSPORT_R0_PLC_TC3 };


//init PLC variables (velocity stream)
AdsVariable<std::array<double, 4>> vel_robot{ route, "ControlGVL.vel_robot" };

//odometry publisher
ros::Publisher pub_odom;

//use of joystick or autonomous
int joystickMode = 0;




//service to enable use of joystick or autonomous
bool serviceJoystick(cob_srvs::SetInt::Request  &req, cob_srvs::SetInt::Response &res){
	joystickMode = req.data;
	//if stop mode reset speed
	if(req.data==2){
		vel_robot = { 0, 0, 0 };
	}
	res.success = true;
	return true;
}



//get speeds from publisher and send it to the PLC 
void callback_receive_speed_command(const geometry_msgs::Twist& t){
	if(joystickMode==0){	
		vel_robot = { t.linear.x, t.linear.y, t.angular.z };
	}
	
}

//get speeds from publisher (joystick) and send it to the PLC 
void callback_receive_speed_command_joystick(const geometry_msgs::Twist& t){
	if(joystickMode==1){	
		vel_robot = { t.linear.x, t.linear.y, t.angular.z };
	}
}




//create odometry to publish
nav_msgs::Odometry createOdom(const double robot_odom[]){


	static tf::TransformBroadcaster br;
  	tf::Transform transform;
	transform.setOrigin( tf::Vector3(robot_odom[0], robot_odom[1], 0));
	tf::Quaternion q;
    q.setRPY(0, 0, robot_odom[2]);
  	transform.setRotation(q);
	br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "odom", "base_link"));


	static uint32_t  seq = 0;
	nav_msgs::Odometry odom;

	//header
	std_msgs::Header header;
	header.seq = seq;
	int64_t s = std::chrono::duration_cast<std::chrono::seconds>(std::chrono::system_clock::now().time_since_epoch()).count();
	int64_t ns = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::system_clock::now().time_since_epoch()).count() - s * 1000000000;
	header.stamp.sec = s;
	header.stamp.nsec = ns;
	header.frame_id = "odom";
	odom.header = header;

	//frame_id
	odom.child_frame_id = "base_link";

	//pose
	geometry_msgs::PoseWithCovariance poseWC;
	geometry_msgs::Pose pose;

	geometry_msgs::Point position;
	position.x = robot_odom[0];
	position.y = robot_odom[1];
	position.z = 0;
	pose.position = position;

	geometry_msgs::Quaternion orientation;
	orientation.x = 0;
	orientation.y = 0;
	orientation.z = -1 * sin(robot_odom[2] / 2);
	orientation.w = cos(robot_odom[2] / 2);
	pose.orientation = orientation;
	poseWC.pose = pose;

	poseWC.covariance = { 0.003, 0, 0, 0, 0, 0,
		0, 0.003, 0, 0, 0, 0,
		0, 0, 0.003, 0, 0, 0,
		0, 0, 0, 0.003, 0, 0,
		0, 0, 0, 0, 0.003, 0,
		0, 0, 0, 0, 0, 0.003 };

	odom.pose = poseWC;

	//twist
	geometry_msgs::TwistWithCovariance twistWC;
	geometry_msgs::Twist twist;

	geometry_msgs::Vector3 linear;
	linear.x = robot_odom[3];
	linear.y = robot_odom[4];
	linear.z = 0;
	twist.linear = linear;

	geometry_msgs::Vector3 angular;
	angular.x = 0;
	angular.y = 0;
	angular.z = robot_odom[5];
	twist.angular = angular;

	twistWC.twist = twist;

	twistWC.covariance = { 0.01, 0, 0, 0, 0, 0,
		0, 0.01, 0, 0, 0, 0,
		0, 0, 0.01, 0, 0, 0,
		0, 0, 0, 0.01, 0, 0,
		0, 0, 0, 0, 0.01, 0,
		0, 0, 0, 0, 0, 0.01 };

	odom.twist = twistWC;
	if ((seq++)>4294967294){ seq = 0; }




	return odom;
}


//notification callback function - odometry create and publish on topic /odom
void odometryCallback(const AmsAddr* pAddr, const AdsNotificationHeader* pNotification, uint32_t hUser){

	const double* data = reinterpret_cast<const double*>(pNotification + 1);
	nav_msgs::Odometry odom = createOdom(data);
	pub_odom.publish(odom);
}





int main(int argc, char **argv){

	//ROS init 
	ros::init(argc, argv, "ads_communication");
	ros::NodeHandle nh;

	//subscribers
	ros::Subscriber sub_cmd_vel = nh.subscribe("/cmd_vel", 1000, callback_receive_speed_command);
	ros::Subscriber sub_cmd_vel_joy = nh.subscribe("/cmd_vel_joy", 1000, callback_receive_speed_command_joystick);

	//publisher
	pub_odom = nh.advertise<nav_msgs::Odometry>("/odom", 10);

	//server
	ros::ServiceServer service = nh.advertiseService("changeModeJoystick", serviceJoystick);


	//notifications
	const AdsNotificationAttrib attrib = { sizeof(double)* 6, ADSTRANS_SERVERCYCLE, 0, { 10000 } };
	AdsNotification notification{ route, "ControlGVL.robot_odom", attrib, &odometryCallback, 0xBEEFDEAD };

	ros::spin();

	return 0;
}