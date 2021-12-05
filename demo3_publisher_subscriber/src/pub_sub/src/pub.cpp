// 1. include headers
#include "ros/ros.h"
#include "std_msgs/String.h" // std_msgs::String msg;
#include <sstream>      // std::stringstream

/* 
        消息发布方:
        循环发布信息:HelloWorld 后缀数字编号

    实现流程:
        1.包含头文件 
        2.初始化 ROS 节点:命名(唯一)
        3.实例化 ROS 句柄
        4.实例化 发布者 对象
        5.组织被发布的数据，并编写逻辑发布数据
 
 */

int main(int argc, char* argv[]){
    // 2. init a ROS node
    ros::init(argc, argv,"node_Apollo");
    // 3. create a node handle (a ptr pointing to the current node)
    ros::NodeHandle nh;
    // 4. create publisher instance on the node
    ros::Publisher pub = nh.advertise<std_msgs::String>("house", 10); // only receive the latest 10 messasges from publisher.
    /* 
        10 here: the size of the outgoing message queue. If you are publishing the messages faster than the roscpp can send
        over the wire. The roscpp will drop the old messages and only take the newer ones.
     */
    std_msgs::String msg; // data carrier 
    ros::Rate rate(10);  // 10 Hz  (e.g. 0.5 hz ---> 0.5s/cycle)
    /* 
            Hertz	Per	Cycle       Per Second
            1 hz	1 second	    1 cycle/sec
            2 hz	0.5 seconds	    2 cycles/sec
            3 hz	0.3333 seconds	3 cycles/sec
    
     */
    int count = 0;
    ros::Duration(2.0).sleep();

    // 5. for loop to publish data
    while (ros::ok()){
        // init
        count ++;
        std::stringstream ss;

        // manipulate and publish
        ss << "hello ---> " << count; // concat the string
        msg.data = ss.str();
        pub.publish(msg);

        // log
        ROS_INFO("publish data: %s", ss.str().c_str()); //@notice this way: c_str()

        // before next run
        rate.sleep(); // sleep until we achieve the 10 Hz.
        ros::spinOnce(); // officially rocommend
    }
    return 0;
}

/*
remember to build it before run it after modify it
 */