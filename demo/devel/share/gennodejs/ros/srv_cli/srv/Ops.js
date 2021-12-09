// Auto-generated. Do not edit!

// (in-package srv_cli.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class OpsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.get_linear_velocity = null;
      this.get_radius = null;
    }
    else {
      if (initObj.hasOwnProperty('get_linear_velocity')) {
        this.get_linear_velocity = initObj.get_linear_velocity
      }
      else {
        this.get_linear_velocity = false;
      }
      if (initObj.hasOwnProperty('get_radius')) {
        this.get_radius = initObj.get_radius
      }
      else {
        this.get_radius = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OpsRequest
    // Serialize message field [get_linear_velocity]
    bufferOffset = _serializer.bool(obj.get_linear_velocity, buffer, bufferOffset);
    // Serialize message field [get_radius]
    bufferOffset = _serializer.bool(obj.get_radius, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OpsRequest
    let len;
    let data = new OpsRequest(null);
    // Deserialize message field [get_linear_velocity]
    data.get_linear_velocity = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [get_radius]
    data.get_radius = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'srv_cli/OpsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '91e80058a49cbbc5b04d31bbc564e5fd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # client sending some data
    bool get_linear_velocity
    bool get_radius
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OpsRequest(null);
    if (msg.get_linear_velocity !== undefined) {
      resolved.get_linear_velocity = msg.get_linear_velocity;
    }
    else {
      resolved.get_linear_velocity = false
    }

    if (msg.get_radius !== undefined) {
      resolved.get_radius = msg.get_radius;
    }
    else {
      resolved.get_radius = false
    }

    return resolved;
    }
};

class OpsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.angular_velocity_value = null;
    }
    else {
      if (initObj.hasOwnProperty('angular_velocity_value')) {
        this.angular_velocity_value = initObj.angular_velocity_value
      }
      else {
        this.angular_velocity_value = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OpsResponse
    // Serialize message field [angular_velocity_value]
    bufferOffset = _serializer.float32(obj.angular_velocity_value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OpsResponse
    let len;
    let data = new OpsResponse(null);
    // Deserialize message field [angular_velocity_value]
    data.angular_velocity_value = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'srv_cli/OpsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '91ce252b066a8019bebcd36427611029';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # server sending the result back
    float32 angular_velocity_value
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OpsResponse(null);
    if (msg.angular_velocity_value !== undefined) {
      resolved.angular_velocity_value = msg.angular_velocity_value;
    }
    else {
      resolved.angular_velocity_value = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: OpsRequest,
  Response: OpsResponse,
  md5sum() { return 'debbba91dbbcfc26ea53ae9e87ba85d6'; },
  datatype() { return 'srv_cli/Ops'; }
};
