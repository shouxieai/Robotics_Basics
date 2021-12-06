#include "ros/ros.h"
#include "custom_head/hello.h" //!

/* 
 hello.h 的具体实现
 */

namespace hello_ns {
    void MyHello::run(){
        ROS_INFO("run func is executing");
    }
}


int main(int argc, char* argv[]){
    ros::init(argc, argv, "custom_hello_head");
    // 函数调用
    hello_ns::MyHello my_hello; // 类的实例化
    my_hello.run();

    return 0;

}

/* 
去 CMakeList.txt 除了常规 add_execute   target_link
还有 include_directories()
and 
   xxxx same as
add_dependencies(hello ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

e.g. 
include_directories(
include  <=====将这个uncomment 掉
  ${catkin_INCLUDE_DIRS}
)



 */
