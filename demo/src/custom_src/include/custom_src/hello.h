/* 
使用自定义源文件本质上就是 在使用自定义头文件的基础上 将
    hello.cpp 里的main 和具体实现拆开


    流程:
        编写头文件；
        编写源文件；
        编写可执行文件；
        编辑配置文件并执行。

    
 */

#ifndef _HELLO_H
#define _HELLO_H

/* 
声明 namespace
        \-- class
            \-- run

 */

namespace hello_ns {
    class MyHello {
        public:
            void run();
    };
}

#endif

/* 
remember to include the header file into includePath in c_cpp_properties
 */

