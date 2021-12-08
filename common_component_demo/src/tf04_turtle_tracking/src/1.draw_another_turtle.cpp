#include "ros/ros.h"
#include "turtlesim/Spawn.h"

// review: /datav/projects/ROS/demo/src/srv_cli/src/client.cpp

int main(int argc, char* argv[])
{   
    //执行初始化
    ros::init(argc,argv,"create_turtle");
    //创建节点
    ros::NodeHandle nh;
    //创建服务客户端
    ros::ServiceClient client = nh.serviceClient<turtlesim::Spawn>("/spawn");
    ros::service::waitForService("/spawn"); //! keep in mind that wait for the server.

    // 服务器端这边要造数据了    
    turtlesim::Spawn spawn; // 乌龟的信息载体（用来生成乌龟的服务器 和 用来显示乌龟的客户端之间流通的信息）
    spawn.request.name = "turtle2";
    spawn.request.x = 3.0;
    spawn.request.y = 6.0;
    spawn.request.theta = 3.12415926;

    bool flag = client.call(spawn);

    if (flag)
    {
        ROS_INFO("turtle%s Done!",spawn.response.name.c_str());
    }
    else
    {
        ROS_INFO("turtle2 is not done!");
    }

    ros::spin();


    return 0;
}