/*
    需求: 
        编写两个节点实现服务通信，客户端节点需要提交两个整数到服务器
        服务器需要解析客户端提交的数据，相加后，将结果响应回客户端，
        客户端再解析

    服务器实现:
        1.包含头文件
        2.初始化 ROS 节点
        3.创建 ROS 句柄
        4.创建 服务 对象
        5.回调函数处理请求并产生响应
        6.由于请求有多个，需要调用 ros::spin()

*/

#include "ros/ros.h"
#include "srv_cli/AddInts.h"
bool doReq(srv_cli::AddInts::Request& req,
           srv_cli::AddInts::Response& resp){
    int num1 = req.num1;
    int num2 = req.num2;

    ROS_INFO("the data received:num1 = %d, num2 = %d",num1, num2);

    //逻辑处理
    if (num1 < 0 || num2 < 0)
    {
        ROS_ERROR("ERROR, num cannot be non-postive");
        return false;
    }

    //如果没有异常，那么相加并将结果赋值给 resp
    resp.sum = num1 + num2;
    return true;

}



int main(int argc, char* argv[]){

    // init node
    ros::init(argc, argv,"Apollo_Add_Server");
    // node handler
    ros::NodeHandle nh;
    // server instance
    ros::ServiceServer server = nh.advertiseService("operations", doReq);
    ROS_INFO("Console Starts");
    // process the req and reponse
    // spin()
    ros::spin();
    return 0;
}

/* 
rosrun srv_cli server

rosservice call operations tab auto-complete

 */