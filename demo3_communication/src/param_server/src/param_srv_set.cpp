/*
    需求：
        实现参数的新增与修改需求:
        首先设置机器人的共享参数,
            类型、半径(0.15m)  再修改半径(0.2m)
        
        两种方法：
            nh.setParam("type", "xiaohuang");
            or
            ros::param::set("type_param", "xiaobai");


*/

#include "ros/ros.h"

int main(int argc, char *argv[]){
    ros::init(argc,argv,"set_and_update_param");
    
    ros::NodeHandle nh;

    // add param
    // method 1
    nh.setParam("type", "xiaohuang");
    nh.setParam("radius", 0.15);

    // method 2
    ros::param::set("type_param", "xiaobai");
    ros::param::set("radius_param", 0.15);

    // update param
    // method 1
    nh.setParam("radius", 0.95);
    // method 2
    ros::param::set("radius_param", 0.15);

    return 0;

}

/* 
After coding, build it. Then run it. 
    - rosparam list to check all params
    - rosparam get /${param_name}

 */