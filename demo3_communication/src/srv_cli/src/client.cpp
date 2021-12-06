/*
    需求: 
        编写两个节点实现服务通信，客户端节点需要提交两个整数到服务器
        服务器需要解析客户端提交的数据，相加后，将结果响应回客户端，
        客户端再解析

    服务器实现:
        1.包含头文件
        2.初始化 ROS 节点
        3.创建 ROS 句柄
        4.创建 客户端 对象
        5.请求服务，接收响应

*/

// 1.包含头文件
#include "ros/ros.h"
#include "srv_cli/AddInts.h"
#include "iostream"

int main(int argc, char* argv[]){
    // 2.初始化 ROS 节点
    ros::init(argc,argv,"NASA_Add_Client");
    // 3.创建 ROS 句柄
    ros::NodeHandle nh;
    // 4.创建 客户端 对象
    ros::ServiceClient client = nh.serviceClient<srv_cli::AddInts>("operations"); // operations is topic. 这个client 只负责AddInts服务
    // 5.提交请求并处理响应
    srv_cli::AddInts ai; // 请求/响应加法的服务的载体  类比于信息的载体 (e.g.简单信息std_msgs::String msg; 复杂信息pub_sub::Spacecraft sp;)
    // 5.1 组织请求
    ai.request.num1 = 400;
    ai.request.num2 = 200;
    // 5.2 处理响应
    bool flag = client.call(ai);
    if (flag)
    {
        ROS_INFO("response success");
        // 获取结果
        ROS_INFO("response result: %d", ai.response.sum);
    }else{
        ROS_INFO("process failure");
    }

    return 0;

}




