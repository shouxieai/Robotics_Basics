#include "ros/ros.h"
/* 
    参数服务器操作之删除_C++实现:

    ros::NodeHandle
        deleteParam("键")
        根据键删除参数，删除成功，返回 true，否则(参数不存在)，返回 false

    ros::param
        del("键")
        根据键删除参数，删除成功，返回 true，否则(参数不存在)，返回 false


*/

int main(int argc, char *argv[])
{   
    ros::init(argc,argv,"delete_param");

    ros::NodeHandle nh;
    bool r1 = nh.deleteParam("radius");
    ROS_INFO("nh delete flag:%d",r1);
   
    bool r2 = ros::param::del("param_int");
    ROS_INFO("param delete flag:%d",r2);

    return 0;
}


