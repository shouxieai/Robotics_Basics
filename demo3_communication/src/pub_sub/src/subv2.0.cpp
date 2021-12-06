#include "ros/ros.h"
#include "pub_sub/Spacecraft.h"

void process_data(const pub_sub::Spacecraft::ConstPtr& sp){
    ROS_INFO("data from %s, stage: %d, AP: %.2f, velocity: %.2f",
            sp->name.c_str(),
            sp->stage,
            sp->atmosphere_pressure,
            sp->velocity);
}

int main(int argc, char* argv[]){
    ROS_INFO("NASA is receiving data");
    // 2. init the node
    ros::init(argc, argv, "NASA_v2");
    // 3. create the node handler
    ros::NodeHandle nh;
    // 4. create a subscriber instance
    ros::Subscriber sub = nh.subscribe("space_data", 10, process_data);
    // 5. process the data subscribed
    // 6. spin
    ros::spin();

    return 0;


}