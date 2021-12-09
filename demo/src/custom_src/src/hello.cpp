#include "ros/ros.h"
#include "custom_src/hello.h" // prj下的头文件

/* 
 hello.h 的具体实现
 */

namespace hello_ns {
    void MyHello::run(){
        ROS_INFO("run func is executing");
    }
}


