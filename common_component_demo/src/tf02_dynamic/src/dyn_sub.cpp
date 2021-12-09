#include "ros/ros.h" 
#include "tf2_ros/transform_listener.h" // subscriber
#include "tf2_ros/buffer.h" // the received data will be be stored in buffer.
#include "geometry_msgs/PointStamped.h" // the info of the point
#include "tf2_geometry_msgs/tf2_geometry_msgs.h" // the info of the transformation

/*  
    订阅： 乌龟一直在动，给定一点在乌龟坐标系的点
            求出这点在世界坐标系的值
        
        最终得到的结果 ：
            e.g. 

*/
int main(int argc, char* argv[])
{   
    ros::init(argc, argv, "dynamic_sub");
    ros::NodeHandle nh;

    tf2_ros::Buffer buffer;
    tf2_ros::TransformListener listener(buffer); // put the data received into buffer

    // make point to be transformed
    geometry_msgs::PointStamped ps;
    ps.header.frame_id = "turtle1"; //!
    ps.header.stamp = ros::Time(0.0); //!
    ps.point.x = 2.0;
    ps.point.y = 3.0;
    ps.point.z = 5.0;

    ros::Rate rate(10);

    while(ros::ok()){
        try{
            geometry_msgs::PointStamped ps_out;
            ps_out = buffer.transform(ps, "world"); //!

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