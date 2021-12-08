#include "ros/ros.h" 
#include "tf2_ros/transform_listener.h"
#include "tf2_ros/buffer.h"
#include "geometry_msgs/PointStamped.h"
#include "tf2_geometry_msgs/tf2_geometry_msgs.h"
#include "geometry_msgs/Twist.h"


/* 
  the template is copied from /datav/projects/ROS/common_component_demo/src/tf03_multi/launch/start_multi_frames.launch

  需求1：换算出turtle1(敌人) 相对于 turtle2(导弹)的关系
  需求2：计算出角速度和线速度并发布


 */


int main(int argc, char* argv[])
{
    // 1.包含头文件;
    // 2,编码、初始化、NodeHandle;
    ros::init(argc, argv,"tracking");
    ros::NodeHandle nh;

    //3,创建订阅对象;
    tf2_ros::Buffer buffer;
    tf2_ros::TransformListener sub(buffer);


    //(A) 创建发布对象
    ros::Publisher pub = nh.advertise<geometry_msgs::Twist>("/turtle2/cmd_vel", 100);

    
    //4,编写解析逻辑;

    ros::Rate rate(10);
    while (ros::ok()){
        // 核心
        try{
            // 需求1：换算出turtle1(敌人) 相对于 turtle2(导弹)的关系
            geometry_msgs::TransformStamped tfs = buffer.lookupTransform("turtle2","turtle1",ros::Time(0.0)); // target is fixed, is the referenced one.
            // ROS_INFO("TRANSFORM:");
            // ROS_INFO("base ID=%s",tfs.header.frame_id.c_str()); // turtle2坐标系
            // ROS_INFO("child ID=%s",tfs.child_frame_id.c_str()); // turtle1
            // ROS_INFO("trt1 away from trt2 =%.2f,y=%.2f,z=%.2f",
            //         tfs.transform.translation.x,
            //         tfs.transform.translation.y,
            //         tfs.transform.translation.z
            //         );
            //(B) 根据相对计算，组织速度消息
            /* 
                组织速度，只需要设置线速度的 x 与角速度 的 z
                x = 系数 * 开方（y^2 + x^2）
                z = 系数 * 反正切（对边，邻边）
            
             */
            geometry_msgs::Twist twist;
            twist.linear.x = 0.5 * sqrt(pow(tfs.transform.translation.x,2) + pow(tfs.transform.translation.y,2));
            twist.angular.z = 4 * atan2(tfs.transform.translation.y,tfs.transform.translation.x);

            //(C) 发布
            pub.publish(twist);

        }
        catch(const std::exception& e){
            ROS_INFO("EXCEPTION: %s", e.what());
        }

        rate.sleep();
        ros::spinOnce();
    }

    return 0;
}