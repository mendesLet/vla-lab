// Auto-generated. Do not edit!

// (in-package joint_prediction.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class JointAxis {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_name = null;
      this.axis = null;
      this.origin = null;
      this.type = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_name')) {
        this.joint_name = initObj.joint_name
      }
      else {
        this.joint_name = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('axis')) {
        this.axis = initObj.axis
      }
      else {
        this.axis = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('origin')) {
        this.origin = initObj.origin
      }
      else {
        this.origin = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointAxis
    // Serialize message field [joint_name]
    bufferOffset = std_msgs.msg.String.serialize(obj.joint_name, buffer, bufferOffset);
    // Serialize message field [axis]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.axis, buffer, bufferOffset);
    // Serialize message field [origin]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.origin, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.uint8(obj.type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointAxis
    let len;
    let data = new JointAxis(null);
    // Deserialize message field [joint_name]
    data.joint_name = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [axis]
    data.axis = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [origin]
    data.origin = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.joint_name);
    return length + 49;
  }

  static datatype() {
    // Returns string type for a message object
    return 'joint_prediction/JointAxis';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '27ce3d6dd4986aa57bba5e4b5251e6d3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message defines the joint axes of a robot. 
    
    # The name of the joint
    std_msgs/String joint_name
    # Axis direction
    geometry_msgs/Vector3 axis
    # The origin of axis vector 
    geometry_msgs/Vector3 origin
    # The joint type (same order as defined in Gazebo)
    #   Joint_Type_REVOLUTE = 1,
    #   Joint_Type_REVOLUTE2 = 2,
    #   Joint_Type_PRISMATIC = 3,
    #   Joint_Type_UNIVERSAL = 4,
    #   Joint_Type_BALL = 5,
    #   Joint_Type_SCREW = 6,
    #   Joint_Type_GEARBOX = 7,
    #   Joint_Type_FIXED = 8
    ###########################
    uint8 type 
    
    
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointAxis(null);
    if (msg.joint_name !== undefined) {
      resolved.joint_name = std_msgs.msg.String.Resolve(msg.joint_name)
    }
    else {
      resolved.joint_name = new std_msgs.msg.String()
    }

    if (msg.axis !== undefined) {
      resolved.axis = geometry_msgs.msg.Vector3.Resolve(msg.axis)
    }
    else {
      resolved.axis = new geometry_msgs.msg.Vector3()
    }

    if (msg.origin !== undefined) {
      resolved.origin = geometry_msgs.msg.Vector3.Resolve(msg.origin)
    }
    else {
      resolved.origin = new geometry_msgs.msg.Vector3()
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    return resolved;
    }
};

module.exports = JointAxis;
