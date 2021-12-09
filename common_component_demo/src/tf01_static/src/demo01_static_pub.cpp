#include "ros/ros.h" 
#include "tf2_ros/static_transform_broadcaster.h"
#include "geometry_msgs/TransformStamped.h" // 要发布坐标系关系信息
#include "tf2/LinearMath/Quaternion.h" // 四元数




/* 
    静态坐标变换发布方:
        发布关于 laser 坐标系的位置信息 
            e.g. 信息形式
        
                transforms: 
                - 
                    header: 
                    seq: 0
                    stamp: 
                        secs: 1638949753
                        nsecs: 815968918
                    frame_id: "base_link"
                    child_frame_id: "laser"
                    transform: 
                    translation: 
                        x: 0.2
                        y: 0.0
                        z: 0.5
                    rotation: 
                        x: 0.0
                        y: 0.0
                        z: 0.0
                        w: 1.0
                ---


    实现流程:
        1.包含头文件
        2.初始化 ROS 节点
        3.创建静态坐标转换广播器
        4.创建坐标系信息
        5.广播器发布坐标系信息
        6.spin()

    已知雷达原点相对于主体原点位移关系如下： x 0.2  y 0.0   z 0.5
 */
int main(int argc, char* argv[])
{
    ros::init(argc, argv, "static_pub");
    ros::NodeHandle nh; // 非必须

    // 3. 创建发布对象
    tf2_ros::StaticTransformBroadcaster pub;
    // 4. 组织被发布的信息
    geometry_msgs::TransformStamped tfs;
    tfs.header.stamp = ros::Time::now();
    tfs.header.frame_id = "base_link"; // 被参考的那个坐标系
    tfs.child_frame_id  = "laser";
    tfs.transform.translation.x = 0.2;
    tfs.transform.translation.y = 0.0;
    tfs.transform.translation.z = 0.5;

    // 需要根据欧拉角转换
    tf2::Quaternion qtn; // 创建四元数 对象
    // 向这个对象设置欧拉角， 这个对象可以将欧拉角转换为四元数
    qtn.setRPY(0,0,0); // 该案例中没有俯仰角 和 旋转

    tfs.transform.rotation.x = qtn.getX();
    tfs.transform.rotation.y = qtn.getY();
    tfs.transform.rotation.z = qtn.getZ();
    tfs.transform.rotation.w = qtn.getW();

    // 5. 发布数据
    pub.sendTransform(tfs);

    // 6. spin()
    ros::spin(); //todo 
    return 0;
}