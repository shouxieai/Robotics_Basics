the pub has been executed in launch file way

<launch>
    <!-- 发布 son1相对于 world 以及 son2 相对于 world 的坐标关系 -->
    <node pkg="tf2_ros" type="static_transform_publisher" name="son1" args="5 0 0 0 0 0 /world /son1" output="screen" />
    <node pkg="tf2_ros" type="static_transform_publisher" name="son2" args="3 0 0 0 0 0 /world /son2" output="screen" />
</launch>