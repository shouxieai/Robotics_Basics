#include "ros/ros.h"
#include "std_msgs/String.h"
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
    ros::init(argc, argv, "node_A");
    // 3. create a node handle (a ptr pointing to the current node)
    ros::NodeHandle nh;
    // 4. create publisher instance on the node
    ros::Publisher pub = nh.advertise<std_msgs::String>("house", 10);
    std_msgs::String msg;

    // 5. for loop to publish data
    while (ros::ok()){
        msg.data = "hello~~";
        pub.publish(msg);
    }
    return 0;
}

/* 
 */