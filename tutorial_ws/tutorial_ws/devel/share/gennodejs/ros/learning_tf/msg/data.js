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

class data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.encl = null;
    }
    else {
      if (initObj.hasOwnProperty('encl')) {
        this.encl = initObj.encl
      }
      else {
        this.encl = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type data
    // Serialize message field [encl]
    bufferOffset = _serializer.float32(obj.encl, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type data
    let len;
    let data = new data(null);
    // Deserialize message field [encl]
    data.encl = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'learning_tf/data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7df7554d5ca6fa53e385357d20f9e997';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 encl
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new data(null);
    if (msg.encl !== undefined) {
      resolved.encl = msg.encl;
    }
    else {
      resolved.encl = 0.0
    }

    return resolved;
    }
};

module.exports = data;
