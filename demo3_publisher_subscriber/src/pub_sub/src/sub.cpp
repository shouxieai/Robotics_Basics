// 1. include header
#include "ros/ros.h"
#include <std_msgs/String.h>

/* 
Subscriber:
    1. include header
        ros string
    2. init node
    3. create node handler
    4. create subscriber instance
    5. process the data subscribed
 */

void doMsg(const std_msgs::String::ConstPtr& msg){
    // get the msg and manipulate it
    ROS_INFO("the data received: %s", msg->data.c_str()); // print in c style
}


int main(int argc, char* argv[]){
    // 2. init node
    ros::init(argc, argv, "node_NASA");
    // 3. create node handler
    ros::NodeHandle nh;
    // 4. create subscriber on the node
    ros::Subscriber sub = nh.subscribe("house", 10, doMsg); // doMsg is a callback function
    // 5. process data
    ros::spin();
    
    return 0;
}