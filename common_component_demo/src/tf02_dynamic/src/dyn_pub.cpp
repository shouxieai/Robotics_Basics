
#include "ros/ros.h"
#include "turtlesim/Pose.h" //todo 为什么得导入这个 为了能够能够解析pose 信息体
#include "tf2_ros/transform_broadcaster.h"  // 要发布坐标系的变换信息
#include "geometry_msgs/TransformStamped.h" // 要表示坐标系变换信息
#include "tf2/LinearMath/Quaternion.h"      // 四元数

void doPose(const turtlesim::Pose::ConstPtr& pose){ //消息是这样的type turtlesim::Pose
    // pose是拿到的位姿信息，我们要转换成//todo, 并发布
    // a. 创建TF发布对象
    static tf2_ros::TransformBroadcaster pub; //static 防止每次来了一个pose就要重新创一个pub
    // b. 组织将要被发布的数据
    geometry_msgs::TransformStamped tfs; // 偏移旋转量的msg载体（aka 变换关系）
    tfs.header.frame_id       = "world";
    tfs.header.stamp          = ros::Time::now();
    
    tfs.child_frame_id        = "turtle1"; // 明确这次变换的主和从

    // 坐标系偏移量的设置
    tfs.transform.translation.x = pose->x; // 乌龟pose的坐标已经是相对世界坐标系的了
    tfs.transform.translation.y = pose->y;
    tfs.transform.translation.z = 0;
    // 坐标系四元数
    /* 
        位姿信息中没有四元数，但是有偏航角，又已知乌龟是2D的，没有翻滚和俯仰角，
        所以乌龟的欧拉角是 0 0 theta
     */
    tf2::Quaternion qtn; // 旋转信息的载体
    qtn.setRPY(0,0,pose->theta);

    tfs.transform.rotation.x = qtn.getX();
    tfs.transform.rotation.y = qtn.getY();
    tfs.transform.rotation.z = qtn.getZ();
    tfs.transform.rotation.w = qtn.getW();

    // 到此为止我们可以通过ts知道了此时此刻乌龟坐标和世界坐标系的变换关系
    // c. 发布
    
    
    pub.sendTransform(tfs);

}


int main(int argc, char* argv[])
{
    // 2. 初始化、NodeHandle;
    ros::init(argc, argv, "dynamic_pub");
    ros::NodeHandle nh; // 订阅一定要有, 但这里是发布，不一定需要
    // 3. 创建订阅对象，订阅 /turtle1/pose;
    ros::Subscriber sub = nh.subscribe<turtlesim::Pose>("/turtle1/pose", 100, doPose);
    // 4. 回调函数处理订阅的消息：将位姿信息转换成坐标相对关系并发布（重点）
    // 5. 开始处理订阅到的信息
    ros::spin();

    return 0;
}