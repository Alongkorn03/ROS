// Generated by gencpp from file ethzasl_icp_mapper/CorrectPoseRequest.msg
// DO NOT EDIT!


#ifndef ETHZASL_ICP_MAPPER_MESSAGE_CORRECTPOSEREQUEST_H
#define ETHZASL_ICP_MAPPER_MESSAGE_CORRECTPOSEREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <nav_msgs/Odometry.h>

namespace ethzasl_icp_mapper
{
template <class ContainerAllocator>
struct CorrectPoseRequest_
{
  typedef CorrectPoseRequest_<ContainerAllocator> Type;

  CorrectPoseRequest_()
    : odom()  {
    }
  CorrectPoseRequest_(const ContainerAllocator& _alloc)
    : odom(_alloc)  {
  (void)_alloc;
    }



   typedef  ::nav_msgs::Odometry_<ContainerAllocator>  _odom_type;
  _odom_type odom;





  typedef boost::shared_ptr< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> const> ConstPtr;

}; // struct CorrectPoseRequest_

typedef ::ethzasl_icp_mapper::CorrectPoseRequest_<std::allocator<void> > CorrectPoseRequest;

typedef boost::shared_ptr< ::ethzasl_icp_mapper::CorrectPoseRequest > CorrectPoseRequestPtr;
typedef boost::shared_ptr< ::ethzasl_icp_mapper::CorrectPoseRequest const> CorrectPoseRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator1> & lhs, const ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator2> & rhs)
{
  return lhs.odom == rhs.odom;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator1> & lhs, const ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ethzasl_icp_mapper

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "75d9701e058ed9a7608ba3dbc16b5b7e";
  }

  static const char* value(const ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x75d9701e058ed9a7ULL;
  static const uint64_t static_value2 = 0x608ba3dbc16b5b7eULL;
};

template<class ContainerAllocator>
struct DataType< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ethzasl_icp_mapper/CorrectPoseRequest";
  }

  static const char* value(const ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nav_msgs/Odometry odom\n"
"\n"
"================================================================================\n"
"MSG: nav_msgs/Odometry\n"
"# This represents an estimate of a position and velocity in free space.  \n"
"# The pose in this message should be specified in the coordinate frame given by header.frame_id.\n"
"# The twist in this message should be specified in the coordinate frame given by the child_frame_id\n"
"Header header\n"
"string child_frame_id\n"
"geometry_msgs/PoseWithCovariance pose\n"
"geometry_msgs/TwistWithCovariance twist\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/PoseWithCovariance\n"
"# This represents a pose in free space with uncertainty.\n"
"\n"
"Pose pose\n"
"\n"
"# Row-major representation of the 6x6 covariance matrix\n"
"# The orientation parameters use a fixed-axis representation.\n"
"# In order, the parameters are:\n"
"# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)\n"
"float64[36] covariance\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/TwistWithCovariance\n"
"# This expresses velocity in free space with uncertainty.\n"
"\n"
"Twist twist\n"
"\n"
"# Row-major representation of the 6x6 covariance matrix\n"
"# The orientation parameters use a fixed-axis representation.\n"
"# In order, the parameters are:\n"
"# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)\n"
"float64[36] covariance\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Twist\n"
"# This expresses velocity in free space broken into its linear and angular parts.\n"
"Vector3  linear\n"
"Vector3  angular\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.odom);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CorrectPoseRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ethzasl_icp_mapper::CorrectPoseRequest_<ContainerAllocator>& v)
  {
    s << indent << "odom: ";
    s << std::endl;
    Printer< ::nav_msgs::Odometry_<ContainerAllocator> >::stream(s, indent + "  ", v.odom);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ETHZASL_ICP_MAPPER_MESSAGE_CORRECTPOSEREQUEST_H
