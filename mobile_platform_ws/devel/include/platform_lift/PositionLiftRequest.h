// Generated by gencpp from file platform_lift/PositionLiftRequest.msg
// DO NOT EDIT!


#ifndef PLATFORM_LIFT_MESSAGE_POSITIONLIFTREQUEST_H
#define PLATFORM_LIFT_MESSAGE_POSITIONLIFTREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace platform_lift
{
template <class ContainerAllocator>
struct PositionLiftRequest_
{
  typedef PositionLiftRequest_<ContainerAllocator> Type;

  PositionLiftRequest_()
    {
    }
  PositionLiftRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::platform_lift::PositionLiftRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::platform_lift::PositionLiftRequest_<ContainerAllocator> const> ConstPtr;

}; // struct PositionLiftRequest_

typedef ::platform_lift::PositionLiftRequest_<std::allocator<void> > PositionLiftRequest;

typedef boost::shared_ptr< ::platform_lift::PositionLiftRequest > PositionLiftRequestPtr;
typedef boost::shared_ptr< ::platform_lift::PositionLiftRequest const> PositionLiftRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::platform_lift::PositionLiftRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::platform_lift::PositionLiftRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace platform_lift

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::platform_lift::PositionLiftRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::platform_lift::PositionLiftRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::platform_lift::PositionLiftRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::platform_lift::PositionLiftRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::platform_lift::PositionLiftRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::platform_lift::PositionLiftRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::platform_lift::PositionLiftRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::platform_lift::PositionLiftRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::platform_lift::PositionLiftRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "platform_lift/PositionLiftRequest";
  }

  static const char* value(const ::platform_lift::PositionLiftRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::platform_lift::PositionLiftRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::platform_lift::PositionLiftRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::platform_lift::PositionLiftRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PositionLiftRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::platform_lift::PositionLiftRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::platform_lift::PositionLiftRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // PLATFORM_LIFT_MESSAGE_POSITIONLIFTREQUEST_H
