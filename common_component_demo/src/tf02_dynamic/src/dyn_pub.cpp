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
    /* 
        发布方：需要【订阅】到乌龟的位姿信息，转换成相对于窗体的//todo的坐标关系，
        并【发布】
        准  备
            话题：/turtle1/pose
            消息：/turtlesim/Pose

        流程：
            1.包含头文件
            2.设置编码（如果需要中文）、初始化、NodeHandle
            3.创建订阅对象，订阅 /turtle1/pose;
            4.回调函数处理订阅的消息：将位姿信息转换成坐标相对关系并发布
            5.spin（）处理消息

            话题和消息是怎么知道的？

                    运行一下rosrun tutlesim turtlesim_node

                    发现该进程启动后，出现的话题有

                    /rosout
                    /rosout_agg
                    /turtle1/cmd_vel
                    /turtle1/color_sensor
                    /turtle1/pose

                    由此我们知道我们可以获取到一些话题下特定的信息（通过以下命令）

                    查看话题 /turtle1/pose的信息

                    rostopic info /turtle1/pose
                        会知道话题里传递的信息的类型是
                            - Type: turtlesim/Pose

                    然后我们知道了topic用到的type

                    然后再查这个type  的详细信息   rosmsg info turtlesim/Pose

                    ```
                    (base) root@59b33b7f8ba7:/datav/projects/ROS/common_component_demo# rosmsg info turtlesim/Pose
                    float32 x
                    float32 y
                    float32 theta
                    float32 linear_velocity
                    float32 angular_velocity
                    ```

                    最终我们发现其实这个topic里来往的是这些信息。消息格式是这样的
    
     */
    // 2. 初始化、NodeHandle;
    ros::init(argc, argv, "dynamic_pub");
    ros::NodeHandle nh; // 订阅一定要有
    // 3. 创建订阅对象，订阅 /turtle1/pose;
    ros::Subscriber sub = nh.subscribe("/turtle1/pose", 100, doPose);
    // 4. 回调函数处理订阅的消息：将位姿信息转换成坐标相对关系并发布（重点）
    // 5. 开始处理订阅到的信息
    ros::spin();

    return 0;
}