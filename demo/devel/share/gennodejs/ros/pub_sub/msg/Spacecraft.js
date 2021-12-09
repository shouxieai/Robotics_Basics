// Auto-generated. Do not edit!

// (in-package pub_sub.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Spacecraft {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.stage = null;
      this.atmosphere_pressure = null;
      this.velocity = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('stage')) {
        this.stage = initObj.stage
      }
      else {
        this.stage = 0;
      }
      if (initObj.hasOwnProperty('atmosphere_pressure')) {
        this.atmosphere_pressure = initObj.atmosphere_pressure
      }
      else {
        this.atmosphere_pressure = 0.0;
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Spacecraft
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [stage]
    bufferOffset = _serializer.int32(obj.stage, buffer, bufferOffset);
    // Serialize message field [atmosphere_pressure]
    bufferOffset = _serializer.float32(obj.atmosphere_pressure, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = _serializer.float32(obj.velocity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Spacecraft
    let len;
    let data = new Spacecraft(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [stage]
    data.stage = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [atmosphere_pressure]
    data.atmosphere_pressure = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pub_sub/Spacecraft';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'db0eadb26c1269c190f69829aca84a1f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    int32 stage
    float32 atmosphere_pressure
    float32 velocity
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Spacecraft(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.stage !== undefined) {
      resolved.stage = msg.stage;
    }
    else {
      resolved.stage = 0
    }

    if (msg.atmosphere_pressure !== undefined) {
      resolved.atmosphere_pressure = msg.atmosphere_pressure;
    }
    else {
      resolved.atmosphere_pressure = 0.0
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = 0.0
    }

    return resolved;
    }
};

module.exports = Spacecraft;
