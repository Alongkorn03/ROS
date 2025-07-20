#include "ros/ros.h"
#include "test1/messages.h"

void clbk(const test1::messages::ConstPtr& msg) {
    ROS_INFO("%d", msg->another_field);
    ROS_INFO("first point: x=%.2f, y=%.2f", msg->points[0].x, msg->points[0].y);
}

int main(int argc, char **argv)
{
  // ROS objects
  ros::init(argc, argv, "my_subscriber");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("my_topic", 1, clbk);

  ros::spin();

}
