// Auto-generated. Do not edit!

// (in-package learning_tf.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Num {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.encl = null;
      this.eclr = null;
      this.vl = null;
      this.vr = null;
      this.angle = null;
    }
    else {
      if (initObj.hasOwnProperty('encl')) {
        this.encl = initObj.encl
      }
      else {
        this.encl = 0.0;
      }
      if (initObj.hasOwnProperty('eclr')) {
        this.eclr = initObj.eclr
      }
      else {
        this.eclr = 0.0;
      }
      if (initObj.hasOwnProperty('vl')) {
        this.vl = initObj.vl
      }
      else {
        this.vl = 0.0;
      }
      if (initObj.hasOwnProperty('vr')) {
        this.vr = initObj.vr
      }
      else {
        this.vr = 0.0;
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Num
    // Serialize message field [encl]
    bufferOffset = _serializer.float32(obj.encl, buffer, bufferOffset);
    // Serialize message field [eclr]
    bufferOffset = _serializer.float32(obj.eclr, buffer, bufferOffset);
    // Serialize message field [vl]
    bufferOffset = _serializer.float32(obj.vl, buffer, bufferOffset);
    // Serialize message field [vr]
    bufferOffset = _serializer.float32(obj.vr, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float32(obj.angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Num
    let len;
    let data = new Num(null);
    // Deserialize message field [encl]
    data.encl = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [eclr]
    data.eclr = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vl]
    data.vl = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vr]
    data.vr = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'learning_tf/Num';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cd8c1b28c2ce359c8b3645a5240d4d70';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 encl
    float32 eclr
    float32 vl
    float32 vr
    float32 angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Num(null);
    if (msg.encl !== undefined) {
      resolved.encl = msg.encl;
    }
    else {
      resolved.encl = 0.0
    }

    if (msg.eclr !== undefined) {
      resolved.eclr = msg.eclr;
    }
    else {
      resolved.eclr = 0.0
    }

    if (msg.vl !== undefined) {
      resolved.vl = msg.vl;
    }
    else {
      resolved.vl = 0.0
    }

    if (msg.vr !== undefined) {
      resolved.vr = msg.vr;
    }
    else {
      resolved.vr = 0.0
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    return resolved;
    }
};

module.exports = Num;
