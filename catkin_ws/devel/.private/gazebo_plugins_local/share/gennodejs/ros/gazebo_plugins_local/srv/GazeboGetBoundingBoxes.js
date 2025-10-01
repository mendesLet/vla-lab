// Auto-generated. Do not edit!

// (in-package gazebo_plugins_local.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let grasp_detection = _finder('grasp_detection');

//-----------------------------------------------------------

class GazeboGetBoundingBoxesRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GazeboGetBoundingBoxesRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GazeboGetBoundingBoxesRequest
    let len;
    let data = new GazeboGetBoundingBoxesRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gazebo_plugins_local/GazeboGetBoundingBoxesRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GazeboGetBoundingBoxesRequest(null);
    return resolved;
    }
};

class GazeboGetBoundingBoxesResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.bboxes_3d = null;
    }
    else {
      if (initObj.hasOwnProperty('bboxes_3d')) {
        this.bboxes_3d = initObj.bboxes_3d
      }
      else {
        this.bboxes_3d = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GazeboGetBoundingBoxesResponse
    // Serialize message field [bboxes_3d]
    // Serialize the length for message field [bboxes_3d]
    bufferOffset = _serializer.uint32(obj.bboxes_3d.length, buffer, bufferOffset);
    obj.bboxes_3d.forEach((val) => {
      bufferOffset = grasp_detection.msg.BoundingBox3D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GazeboGetBoundingBoxesResponse
    let len;
    let data = new GazeboGetBoundingBoxesResponse(null);
    // Deserialize message field [bboxes_3d]
    // Deserialize array length for message field [bboxes_3d]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.bboxes_3d = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.bboxes_3d[i] = grasp_detection.msg.BoundingBox3D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.bboxes_3d.forEach((val) => {
      length += grasp_detection.msg.BoundingBox3D.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gazebo_plugins_local/GazeboGetBoundingBoxesResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4a5148ef6b2e02f98aaa72ae4f26020a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    grasp_detection/BoundingBox3D[] bboxes_3d
    
    
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
    const resolved = new GazeboGetBoundingBoxesResponse(null);
    if (msg.bboxes_3d !== undefined) {
      resolved.bboxes_3d = new Array(msg.bboxes_3d.length);
      for (let i = 0; i < resolved.bboxes_3d.length; ++i) {
        resolved.bboxes_3d[i] = grasp_detection.msg.BoundingBox3D.Resolve(msg.bboxes_3d[i]);
      }
    }
    else {
      resolved.bboxes_3d = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GazeboGetBoundingBoxesRequest,
  Response: GazeboGetBoundingBoxesResponse,
  md5sum() { return '4a5148ef6b2e02f98aaa72ae4f26020a'; },
  datatype() { return 'gazebo_plugins_local/GazeboGetBoundingBoxes'; }
};
