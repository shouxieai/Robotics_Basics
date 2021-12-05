#include "ros/ros.h"
#include "pub_sub/Spacecraft.h" //! notice the c_cpp_properties.json

int main(int argc, char* argv[]){

    ROS_INFO("Apollo is sending data");
    // 2. init the node
    ros::init(argc, argv, "Apollo_v2");
    // 3. create the node handler
    ros::NodeHandle nh;
    // 4. create publisher instance
    ros::Publisher pub = nh.advertise<pub_sub::Spacecraft>("space_data", 10);
    // 5. the logic of publishing
    pub_sub::Spacecraft sp;
    // 5.1 data to be sent
    sp.name = "Apollo_v2.0";
    sp.stage = 3;
    sp.atmosphere_pressure = 2.13;
    sp.velocity = 12.1;

    // 5.2 the frequence to send
    ros::Rate rate(1);
    ros::Duration(2.0).sleep();
    
    // 5.3 start to send
    while(ros::ok()){
        // modify the data
        sp.atmosphere_pressure +=0.1;
        sp.velocity += 0.2;
        
        // publish
        pub.publish(sp);
        ROS_INFO("data from:%s, stage: %d, AP: %f, velocity:%.2f", sp.name.c_str(), sp.stage, sp.atmosphere_pressure, sp.velocity);

        // sleep
        rate.sleep();

        // process the data(recommended)
        ros::spinOnce();

    }



    return 0;
}
