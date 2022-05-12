/*===================== simpleTrajectories.cpp ====================
This program allows to create simple trapezoidal trajectory to test displacements.

===============================================================*/

#include <ros/ros.h>
#include <geometry_msgs/Vector3.h>
#include <stdlib.h>
#include <iostream>

//select the test
#define TEST_3

//compute current required speed for the trajectory
void computeSignalValue(double vel, double dist , double t0, double t, double *currentVel,double tAcc=1){
    double t1 = t0 + tAcc;
    double t2 = dist/abs(vel) + t0;
    double t3 = t2 + tAcc;

    if(t<=t0){
        return;
    }
    if(t<=t1){
        *currentVel = vel*(t-t0)/tAcc;
        return; 
    }
    if(t<=t2){
        *currentVel = vel;
        return;
    }
    if(t<=t3){
        *currentVel = vel*(1-(t-t2)/tAcc);
        return;
    }
    else{
        return;
    }
}


int main(int argc, char **argv){
    ros::init(argc, argv, "number_publisher");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<geometry_msgs::Vector3>("/cmd_vel",10);

    double f= 500;
    ros::Rate rate(f);

    geometry_msgs::Vector3 v;
    v.x = 0; v.y = 0; v.z = 0; 

    double t = 0;

    while(ros::ok()){

        //1.5 m in the x direction at 0.1 m/s
        #if defined(TEST_1)

            double v_x = 0.1;
            double dist_x = 1.5;
            double t0_x = 2;

            if(t==0){std::cout << "dir : x , vel : " << v_x << " , dist : " << dist_x << " , t0 : " << t0_x << "\n";}

            computeSignalValue(v_x, dist_x, t0_x, t, &v.x);

        #endif

        //1m in the x direction at 0.2 m/s
        //-0.5m in the y direction at 0.1 m/s 
        #if defined(TEST_2)

            double v_x = 0.2;
            double dist_x = 1;
            double t0_x = 2;

            if(t==0){std::cout << "dir : x , vel : " << v_x << " , dist : " << dist_x << " , t0 : " << t0_x << "\n";}
            computeSignalValue(v_x, dist_x, t0_x, t, &v.x);

            double v_y = -0.1;
            double dist_y = 0.5;
            double t0_y = 4;

            if(t==0){std::cout << "dir : y , vel : " << v_y << " , dist : " << dist_y << " , t0 : " << t0_y << "\n";}
            computeSignalValue(v_y, dist_y, t0_y, t, &v.y);

        #endif



        //0.5m in the x direction at 0.2 m/s
        //turn 90° 
        //0.5m in the x direction at 0.1 m/s
        //0.5m in the y direction at 0.1 m/s
        //-0.5m in the x direction at 0.1 m/s
        //turn -90°

        #if defined(TEST_3)

            double v_x = 0.2;
            double dist_x = 0.5;
            double t0_x = 2;

            if(t==0){std::cout << "dir : x , vel : " << v_x << " , dist : " << dist_x << " , t0 : " << t0_x << "\n";}
            computeSignalValue(v_x, dist_x, t0_x, t, &v.x);

            double v_z = 0.2;
            double dist_z = 3.1415/2;
            double t0_z = 8;

            if(t==0){std::cout << "dir : th , vel : " << v_z << " , dist : " << dist_z << " , t0 : " << t0_z << "\n";}
            computeSignalValue(v_z, dist_z, t0_z, t, &v.z);

            double v_x2 = 0.1;
            double dist_x2 = 0.5;
            double t0_x2 = 16;

            if(t==0){std::cout << "dir : x , vel : " << v_x2 << " , dist : " << dist_x2 << " , t0 : " << t0_x2 << "\n";}
            computeSignalValue(v_x2, dist_x2, t0_x2, t, &v.x);

            double v_y = 0.1;
            double dist_y = 0.5;
            double t0_y = 24;

            if(t==0){std::cout << "dir : y , vel : " << v_y << " , dist : " << dist_y << " , t0 : " << t0_y << "\n";}
            computeSignalValue(v_y, dist_y, t0_y, t, &v.y);

            double v_x3 = -0.1;
            double dist_x3 = 0.5;
            double t0_x3 = 30;

            if(t==0){std::cout << "dir : x , vel : " << v_x3 << " , dist : " << dist_x3 << " , t0 : " << t0_x3 << "\n";}
            computeSignalValue(v_x3, dist_x3, t0_x3, t, &v.x);

            double v_z2 = -0.2;
            double dist_z2 = 3.1415/2;
            double t0_z2 = 36;

            if(t==0){std::cout << "dir : th , vel : " << v_z2 << " , dist : " << dist_z2 << " , t0 : " << t0_z2 << "\n";}
            computeSignalValue(v_z2, dist_z2, t0_z2, t, &v.z);

        #endif

        t+= 1/f;




        pub.publish(v);
        rate.sleep();
    }
}