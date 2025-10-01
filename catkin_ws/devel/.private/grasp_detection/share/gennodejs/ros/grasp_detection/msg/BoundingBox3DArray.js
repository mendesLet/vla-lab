// Auto-generated. Do not edit!

// (in-package grasp_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BoundingBox3D = require('./BoundingBox3D.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class BoundingBox3DArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.bboxes_3d = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('bboxes_3d')) {
        this.bboxes_3d = initObj.bboxes_3d
      }
      else {
        this.bboxes_3d = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BoundingBox3DArray
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [bboxes_3d]
    // Serialize the length for message field [bboxes_3d]
    bufferOffset = _serializer.uint32(obj.bboxes_3d.length, buffer, bufferOffset);
    obj.bboxes_3d.forEach((val) => {
      bufferOffset = BoundingBox3D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BoundingBox3DArray
    let len;
    let data = new BoundingBox3DArray(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [bboxes_3d]
    // Deserialize array length for message field [bboxes_3d]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.bboxes_3d = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.bboxes_3d[i] = BoundingBox3D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.bboxes_3d.forEach((val) => {
      length += BoundingBox3D.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'grasp_detection/BoundingBox3DArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '972964bfa630ec8002b6b6713451b7e5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message contains array of BoundingBox3D messages 
    
    std_msgs/Header header
    
    BoundingBox3D[] bboxes_3d
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: grasp_detection/BoundingBox3D
    # A 3D bounding box that can be positioned and rotated about its center (6 DOF)
    # Dimensions of this box are in meters
    
    # ID or label of the detected object
    string object_id
    
    # The 3D position and orientation of the bounding box center
    geometry_msgs/Pose center
    
    # The size of the bounding box, in meters, surrounding the object's center
    geometry_msgs/Vector3 size
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
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
    const resolved = new BoundingBox3DArray(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.bboxes_3d !== undefined) {
      resolved.bboxes_3d = new Array(msg.bboxes_3d.length);
      for (let i = 0; i < resolved.bboxes_3d.length; ++i) {
        resolved.bboxes_3d[i] = BoundingBox3D.Resolve(msg.bboxes_3d[i]);
      }
    }
    else {
      resolved.bboxes_3d = []
    }

    return resolved;
    }
};

module.exports = BoundingBox3DArray;
