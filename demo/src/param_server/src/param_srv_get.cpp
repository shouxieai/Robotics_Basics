/*
    需求：演示参数查询
        ros::NodeHandle
            （1）param(key, defaut_value)
                存在，返回对应结果，否则返回默认值

            （2）getParam(key, 存储结果的变量)
                存在，返回true, 且将值赋给参数付给这个变量
                如果key不存在，那么返回的值为false，且不为这个变量赋值
            
            （3）getParamCached ---》提高变量获取效率



*/

#include "ros/ros.h"

int main(int argc, char *argv[]){
    ros::init(argc,argv,"set_and_update_param");
    
    ros::NodeHandle nh;

    // ros::NodeHandle ---------------------------------------------------------------------
    // 1. param
    double radius = nh.param("radius", 0.5);
    ROS_INFO("1.  radius = %.2f", radius);

    // 2. getParam and getParamCached
    double radius2 = 0.0;
    // bool result = nh.getParam("radius", radius2); // 看一下有没有radius，如果有的话直接把radius的值赋给radius2
    bool result = nh.getParamCached("radiusa", radius2); // 看一下有没有radius，如果有的话直接把radius的值赋给radius2
    
    if (result){
        ROS_INFO("2.  radius: %.2f", radius2);
    }else{
        ROS_INFO("key doesn't exist");
    }

    // 3. getParamNames
    std::vector<std::string> names; // create a vector names for name
    nh.getParamNames(names);        // get all names and put them into names
    for (auto&& name : names){      // auto&& name == const auto& name      --->A[abc] or --->B[cde]   but you cannot change the value within A or B 
        ROS_INFO("the element: %s", name.c_str());

    }

    // 4. hasParam
    bool flag1 = nh.hasParam("radius");
    bool flag2 = nh.hasParam("radiusxxxx");
    ROS_INFO("radius exists ?: %d", flag1);
    ROS_INFO("radiusxxxx exists ?: %d", flag2);

    // 5. searchParam
    std::string key;
    nh.searchParam("radius", key); // 搜索是否有“radiusxxx”这个key，如果有的话就直接将这个key的本身赋给key这个变量
    ROS_INFO("searched result: %s", key.c_str());

    // ros::param -------------------------------------------------------------
    double radius_param = ros::param::param("radius", 100.5);
    ROS_INFO("radius_parm : %.2f", radius_param);

    // ros::param::getParamNames() // same as nh.getParamNames(names)

    return 0;

}


/* 
检验是否生效  步骤
    - rosrun param_server param_srv_set
    - rosrun param_server param_srv_get

 */
