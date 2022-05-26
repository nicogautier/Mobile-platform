/*===================== ADSCommunication.cpp ====================
This program allows to control the platform using the joystick (Logitech Extreme 3D PRO)

Publisher topic:
	/cmd_vel (Twist) : pubishes new velocity goal based on joystick values
	
subscriber topic:
	/joy (joy) : get the joysticks position of axes and buttons values

===============================================================*/


#include <ros/ros.h>

#include <geometry_msgs/Twist.h>
#include <sensor_msgs/Joy.h>



//odometry publisher
ros::Publisher pub_cmd_vel;

double SpeedLinearRange = 0.2;
double SpeedAngularRange = 0.4;


//get datas from joystick and send cmd_vel
void callback_receive_joystick_command(const sensor_msgs::Joy& j){

    static int btn2_last = 0;
    static int btn3_last = 0;

    //update speed range only if buttons values changed
    if(j.buttons[2]!=btn2_last || j.buttons[3]!=btn3_last ){
        btn2_last = j.buttons[2];
        btn3_last = j.buttons[3];

        //update speed range
        if(j.buttons[2] && j.buttons[3]){
            //nothing to do if the 2 buttons pressed at the same time
        }
        else if(j.buttons[2] && SpeedLinearRange>0.11){
            SpeedLinearRange -= 0.1;
            SpeedAngularRange -= 0.2;
        }
        else if(j.buttons[3] && SpeedLinearRange<0.49){
            SpeedLinearRange += 0.1;
            SpeedAngularRange += 0.2;
        }
    }

    //compute command velocity and send it
    geometry_msgs::Twist goal;
    goal.linear.x = j.axes[1]*SpeedLinearRange;
    goal.linear.y = -j.axes[0]*SpeedLinearRange;

    //enable rotation only if button 0 not pressed
    if(!j.buttons[0]){
        goal.angular.z = -j.axes[2]*SpeedAngularRange;
    }
    

    pub_cmd_vel.publish(goal);


}


int main(int argc, char **argv){

	//ROS init 
	ros::init(argc, argv, "joystick_cmd_vel");
	ros::NodeHandle nh;

	//subscriber
	ros::Subscriber sub_joy = nh.subscribe("/joy", 1000, callback_receive_joystick_command);

	//publisher
	pub_cmd_vel = nh.advertise<geometry_msgs::Twist>("/cmd_vel", 10);


	ros::spin();

	return 0;
}