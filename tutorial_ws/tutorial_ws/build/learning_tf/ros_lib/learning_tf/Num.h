#ifndef _ROS_learning_tf_Num_h
#define _ROS_learning_tf_Num_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace learning_tf
{

  class Num : public ros::Msg
  {
    public:
      typedef float _encl_type;
      _encl_type encl;
      typedef float _eclr_type;
      _eclr_type eclr;
      typedef float _vl_type;
      _vl_type vl;
      typedef float _vr_type;
      _vr_type vr;
      typedef float _angle_type;
      _angle_type angle;

    Num():
      encl(0),
      eclr(0),
      vl(0),
      vr(0),
      angle(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_encl;
      u_encl.real = this->encl;
      *(outbuffer + offset + 0) = (u_encl.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_encl.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_encl.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_encl.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->encl);
      union {
        float real;
        uint32_t base;
      } u_eclr;
      u_eclr.real = this->eclr;
      *(outbuffer + offset + 0) = (u_eclr.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_eclr.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_eclr.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_eclr.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->eclr);
      union {
        float real;
        uint32_t base;
      } u_vl;
      u_vl.real = this->vl;
      *(outbuffer + offset + 0) = (u_vl.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_vl.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_vl.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_vl.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->vl);
      union {
        float real;
        uint32_t base;
      } u_vr;
      u_vr.real = this->vr;
      *(outbuffer + offset + 0) = (u_vr.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_vr.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_vr.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_vr.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->vr);
      union {
        float real;
        uint32_t base;
      } u_angle;
      u_angle.real = this->angle;
      *(outbuffer + offset + 0) = (u_angle.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_angle.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_angle.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_angle.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->angle);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_encl;
      u_encl.base = 0;
      u_encl.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_encl.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_encl.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_encl.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->encl = u_encl.real;
      offset += sizeof(this->encl);
      union {
        float real;
        uint32_t base;
      } u_eclr;
      u_eclr.base = 0;
      u_eclr.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_eclr.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_eclr.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_eclr.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->eclr = u_eclr.real;
      offset += sizeof(this->eclr);
      union {
        float real;
        uint32_t base;
      } u_vl;
      u_vl.base = 0;
      u_vl.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_vl.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_vl.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_vl.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->vl = u_vl.real;
      offset += sizeof(this->vl);
      union {
        float real;
        uint32_t base;
      } u_vr;
      u_vr.base = 0;
      u_vr.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_vr.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_vr.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_vr.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->vr = u_vr.real;
      offset += sizeof(this->vr);
      union {
        float real;
        uint32_t base;
      } u_angle;
      u_angle.base = 0;
      u_angle.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_angle.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_angle.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_angle.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->angle = u_angle.real;
      offset += sizeof(this->angle);
     return offset;
    }

    virtual const char * getType() override { return "learning_tf/Num"; };
    virtual const char * getMD5() override { return "cd8c1b28c2ce359c8b3645a5240d4d70"; };

  };

}
#endif
