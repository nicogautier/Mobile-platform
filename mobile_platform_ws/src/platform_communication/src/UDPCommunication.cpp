/*===================== UDPCommunication.cpp =================================
This program allows the command of the platform using UDP:

UDP port:
    5000: speed x,y,th of the platform 

publisher topic:
    /cmd_vel : transfer values from UDP to ROS

===============================================================*/

#include <ros/ros.h>
#include <geometry_msgs/Vector3.h>

#include <sys/socket.h>
#include <netinet/in.h>
#include <thread>


ros::Publisher pub_speed_platform;


void threadSpeedPlatform(){
    
    int udpSocket = socket(PF_INET, SOCK_DGRAM, 0);
	struct sockaddr_in myAddr; myAddr.sin_family = AF_INET;
    myAddr.sin_port = htons(5000);
    myAddr.sin_addr.s_addr = htonl(INADDR_ANY);
	bind(udpSocket, (const struct sockaddr *)&myAddr, sizeof(myAddr));
	struct sockaddr_in fromAddr; int nb; socklen_t len = sizeof(fromAddr);

    double value[3];
    geometry_msgs::Vector3 recv;

    while(ros::ok()){
        nb = recvfrom(udpSocket, (char *)&value, sizeof(value), 0, (struct sockaddr *)&fromAddr, &len);
        recv.x = value[0]; recv.y = value[1]; recv.z = value[2];
        pub_speed_platform.publish(recv);
    }
}





int main(int argc, char **argv){
    ros::init(argc, argv, "UDP_communication");
    ros::NodeHandle nh;


    pub_speed_platform = nh.advertise<geometry_msgs::Vector3>("/cmd_vel",1000);
    std::thread speedPlatform(threadSpeedPlatform);

    ros::spin();
    return 0;

}