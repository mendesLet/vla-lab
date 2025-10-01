// Auto-generated. Do not edit!

// (in-package gazebo_plugins_local.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

let joint_prediction = _finder('joint_prediction');

//-----------------------------------------------------------

class GazeboGetJointsAxesRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_names = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_names')) {
        this.joint_names = initObj.joint_names
      }
      else {
        this.joint_names = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GazeboGetJointsAxesRequest
    // Serialize message field [joint_names]
    // Serialize the length for message field [joint_names]
    bufferOffset = _serializer.uint32(obj.joint_names.length, buffer, bufferOffset);
    obj.joint_names.forEach((val) => {
      bufferOffset = std_msgs.msg.String.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GazeboGetJointsAxesRequest
    let len;
    let data = new GazeboGetJointsAxesRequest(null);
    // Deserialize message field [joint_names]
    // Deserialize array length for message field [joint_names]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.joint_names = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.joint_names[i] = std_msgs.msg.String.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.joint_names.forEach((val) => {
      length += std_msgs.msg.String.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gazebo_plugins_local/GazeboGetJointsAxesRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '57f478cadc356ab1662772b4712e2e04';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # list of joint names  
    std_msgs/String[] joint_names
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GazeboGetJointsAxesRequest(null);
    if (msg.joint_names !== undefined) {
      resolved.joint_names = new Array(msg.joint_names.length);
      for (let i = 0; i < resolved.joint_names.length; ++i) {
        resolved.joint_names[i] = std_msgs.msg.String.Resolve(msg.joint_names[i]);
      }
    }
    else {
      resolved.joint_names = []
    }

    return resolved;
    }
};

class GazeboGetJointsAxesResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joints_axes = null;
    }
    else {
      if (initObj.hasOwnProperty('joints_axes')) {
        this.joints_axes = initObj.joints_axes
      }
      else {
        this.joints_axes = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GazeboGetJointsAxesResponse
    // Serialize message field [joints_axes]
    // Serialize the length for message field [joints_axes]
    bufferOffset = _serializer.uint32(obj.joints_axes.length, buffer, bufferOffset);
    obj.joints_axes.forEach((val) => {
      bufferOffset = joint_prediction.msg.JointAxis.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GazeboGetJointsAxesResponse
    let len;
    let data = new GazeboGetJointsAxesResponse(null);
    // Deserialize message field [joints_axes]
    // Deserialize array length for message field [joints_axes]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.joints_axes = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.joints_axes[i] = joint_prediction.msg.JointAxis.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.joints_axes.forEach((val) => {
      length += joint_prediction.msg.JointAxis.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gazebo_plugins_local/GazeboGetJointsAxesResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '08b59aae1c5d00eacc50f5ec07cd5065';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # list of joints axes 
    joint_prediction/JointAxis[] joints_axes
    
    ================================================================================
    MSG: joint_prediction/JointAxis
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
    const resolved = new GazeboGetJointsAxesResponse(null);
    if (msg.joints_axes !== undefined) {
      resolved.joints_axes = new Array(msg.joints_axes.length);
      for (let i = 0; i < resolved.joints_axes.length; ++i) {
        resolved.joints_axes[i] = joint_prediction.msg.JointAxis.Resolve(msg.joints_axes[i]);
      }
    }
    else {
      resolved.joints_axes = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GazeboGetJointsAxesRequest,
  Response: GazeboGetJointsAxesResponse,
  md5sum() { return '7e7fae98615461e70f83b405c6a2a27b'; },
  datatype() { return 'gazebo_plugins_local/GazeboGetJointsAxes'; }
};
