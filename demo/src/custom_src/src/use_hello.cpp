#include "ros/ros.h"
#include "custom_src/hello.h" //! 注意这里include的是custom_src 而不是 custom_head
/* 
use_hello.cpp 和 hello.cpp 都要include  hello.h
 */

int main(int argc, char* argv[]){
    ros::init(argc, argv, "custom_hello_src");
    // 函数调用
    hello_ns::MyHello my_hello; // 类的实例化
    my_hello.run();

    return 0;

}

/* 
CMakelist.txt 如何配置
    - (1) 头文件与源文件的相关配置
        - include_directories(    //! 要将prj的include路径包括进来
            include <====== 搞出来
            ${catkin_INCLUDE_DIRS}
            )
    
        - //!生成的库叫什么
        add_library(head_src # 最终生成的库的名字，你随意
            include/${PROJECT_NAME}/hello.h    # 头文件    这里的project name 是custom_src
            src/hello.cpp)                     # 源文件

        - //! top-level角度，生成的库和各个targets需要建立依赖 ref: https://cmake.org/cmake/help/v3.0/command/add_dependencies.html
        add_dependencies(head_src ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
                         head_src是库的名字


        - //! Specify libraries or flags to use when linking a given target. 
        target_link_libraries(head_src
            ${catkin_LIBRARIES}
            )

        
    - (2) 可执行文件配置:

        - add_executable(use_head src/use_head.cpp)

        - add_dependencies(use_head ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

        - #此处需要添加之前设置的 head 库
        target_link_libraries(use_head
        head_src <=== head_src没有其他依赖库了， 但是use_head得先有head_src
        ${catkin_LIBRARIES}
        )



 */