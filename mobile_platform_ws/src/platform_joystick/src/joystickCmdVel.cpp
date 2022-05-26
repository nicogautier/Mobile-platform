/*===================== ADSCommunication.cpp ====================
This program allows to control the platform using the joystick (Logitech Extreme 3D PRO)

Publisher topic:
	/cmd_vel_joy (Twist) : pubishes new velocity goal based on joystick values
	
subscriber topic:
	/joy (joy) : get the joysticks position of axes and buttons values

client service:
	/enableJoystick (SetBool) : request change mode use of joystick or autonomous

===============================================================*/


#include <ros/ros.h>

#include <geometry_msgs/Twist.h>
#include <sensor_msgs/Joy.h>

#include <cob_srvs/SetInt.h>

#define MODE_NAVIGATION 0
#define MODE_JOYSTICK 1
#define MODE_STOP 2


ros::Publisher pub_cmd_vel;
ros::ServiceClient client;

double SpeedLinearRange = 0.2;
double SpeedAngularRange = 0.4;


//get datas from joystick and send cmd_vel
void callback_receive_joystick_command(const sensor_msgs::Joy& j){

    static int btn2_last = 0;
    static int btn3_last = 0;
    static int joystickMode = 0;

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


    //enable to switch between joystick mode and autonomous mode
    cob_srvs::SetInt changeMode;

    if(j.axes[3]>0.5 && (joystickMode != MODE_NAVIGATION)){
        joystickMode = MODE_NAVIGATION;
        changeMode.request.data = MODE_NAVIGATION;
        client.call(changeMode);
    } 
    else if(j.axes[3]<-0.5 && (joystickMode != MODE_JOYSTICK)){
        joystickMode = MODE_JOYSTICK;
        changeMode.request.data = MODE_JOYSTICK;
        client.call(changeMode);
    }
    else if (j.axes[3]>-0.5 && j.axes[3]<0.5 &&(joystickMode != MODE_STOP)){
        joystickMode=MODE_STOP;
        changeMode.request.data = MODE_STOP;
        client.call(changeMode);
    }


    if(joystickMode == MODE_JOYSTICK){
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

}


int main(int argc, char **argv){

	//ROS init 
	ros::init(argc, argv, "joystick_cmd_vel");
	ros::NodeHandle nh;

	//subscriber
	ros::Subscriber sub_joy = nh.subscribe("/joy", 1000, callback_receive_joystick_command);

	//publisher and service
	pub_cmd_vel = nh.advertise<geometry_msgs::Twist>("/cmd_vel_joy", 10);
    client = nh.serviceClient<cob_srvs::SetInt>("changeModeJoystick");


	ros::spin();

	return 0;
}