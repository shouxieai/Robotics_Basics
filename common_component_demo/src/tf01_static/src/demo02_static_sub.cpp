#include "ros/ros.h" 
#include "tf2_ros/transform_listener.h" // subscriber
#include "tf2_ros/buffer.h" // the received data will be be stored in buffer.
#include "geometry_msgs/PointStamped.h" // the info of the point
#include "tf2_geometry_msgs/tf2_geometry_msgs.h" // the info of the transformation

/*  
    订阅： 输入坐标系信息和一系列的坐标，转换成父级坐标系中的坐标点（相对于主体的坐标）
        最终得到的结果 ：
            e.g.
            [ INFO] [1638949943.027544672]: the points transformed : (2.20, 3.00, 5.50), referenced frame-id: base_link

    实现流程:
        1.包含头文件
        2.初始化 ROS 节点
        3.创建 TF 订阅节点
        4.生成一个坐标点(相对于子级坐标系) 比如：相对于雷达坐标
        5.转换坐标点(相对于父级坐标系)   比如：相对于地盘坐标
        6.spin()
*/
int main(int argc, char* argv[])
{   
    ros::init(argc, argv, "tf_sub");
    ros::NodeHandle nh;

    tf2_ros::Buffer buffer;
    tf2_ros::TransformListener listener(buffer); // put the data received into buffer

    // make point to be transformed
    geometry_msgs::PointStamped ps;
    ps.header.frame_id = "laser";
    ps.header.stamp = ros::Time::now();
    ps.point.x = 2.0;
    ps.point.y = 3.0;
    ps.point.z = 5.0;

    // 方法1    
    // ros::Duration(2).sleep(); // 方法1  让订阅者 等 发布者先发布
    // ros::Rate rate(10);

    // while(ros::ok()){
    //     // 核心代码 : 将ps 转换成相对于base_link 的坐标点
    //     /* 调用了buffer的转换函数transform
    //         参数1:被转换的坐标点
    //         参数2:目标坐标系
    //         返回值:输出的坐标点
    //             PS1:调用时必须包含头文件  tf2 geometry msgs/tf2 geometrymsgs.h
    //             PS2 :运行时存在的问题:抛出一个异常base Link不存在
    //                 原因:订阅数据是一个耗时操作,可能在调用transform转换函数时,坐标系的相对关系还没有订阅到,因此出现异常
    //                     解决:
    //                     方案1:在调用转换函数前,执行休眠
    //                     方案2:进行异常处理 
    //     */
    //     geometry_msgs::PointStamped ps_out;
    //     ps_out = buffer.transform(ps, "base_link");

    //     // output
    //     ROS_INFO("the points transformed : (%.2f, %.2f, %.2f), referenced frame-id: %s",
    //                ps_out.point.x,
    //                ps_out.point.y,
    //                ps_out.point.z,
    //                ps_out.header.frame_id.c_str()
    //             );
    //     rate.sleep(); // 方法1
    //     ros::spinOnce(); // spoin调用了就一直卡在这里了，spinOnce 调用后继续回来继续走 ref: https://www.cnblogs.com/tanshengjiang/p/15179656.html
    // }

    // 方法2
    ros::Rate rate(10);

    while(ros::ok()){
        try{
            geometry_msgs::PointStamped ps_out;
            ps_out = buffer.transform(ps, "base_link");

            // output
            ROS_INFO("the points transformed : (%.2f, %.2f, %.2f), referenced frame-id: %s",
                    ps_out.point.x,
                    ps_out.point.y,
                    ps_out.point.z,
                    ps_out.header.frame_id.c_str()
                    );

        }
        catch(const std::exception& e)
        {
            ROS_INFO("EXCEPTION: %s", e.what());
        }
        
        ros::spinOnce(); // spoin调用了就一直卡在这里了，spinOnce 调用后继续回来继续走 ref: https://www.cnblogs.com/tanshengjiang/p/15179656.html
    }
    

    return 0;
}