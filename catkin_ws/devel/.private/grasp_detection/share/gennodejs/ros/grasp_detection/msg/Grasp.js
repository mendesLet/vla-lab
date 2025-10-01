// Auto-generated. Do not edit!

// (in-package grasp_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Grasp {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.object_id = null;
      this.grasp_pose = null;
      this.grasp_width = null;
      this.grasp_depth = null;
      this.grasp_score = null;
    }
    else {
      if (initObj.hasOwnProperty('object_id')) {
        this.object_id = initObj.object_id
      }
      else {
        this.object_id = '';
      }
      if (initObj.hasOwnProperty('grasp_pose')) {
        this.grasp_pose = initObj.grasp_pose
      }
      else {
        this.grasp_pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('grasp_width')) {
        this.grasp_width = initObj.grasp_width
      }
      else {
        this.grasp_width = 0.0;
      }
      if (initObj.hasOwnProperty('grasp_depth')) {
        this.grasp_depth = initObj.grasp_depth
      }
      else {
        this.grasp_depth = 0.0;
      }
      if (initObj.hasOwnProperty('grasp_score')) {
        this.grasp_score = initObj.grasp_score
      }
      else {
        this.grasp_score = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Grasp
    // Serialize message field [object_id]
    bufferOffset = _serializer.string(obj.object_id, buffer, bufferOffset);
    // Serialize message field [grasp_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.grasp_pose, buffer, bufferOffset);
    // Serialize message field [grasp_width]
    bufferOffset = _serializer.float64(obj.grasp_width, buffer, bufferOffset);
    // Serialize message field [grasp_depth]
    bufferOffset = _serializer.float64(obj.grasp_depth, buffer, bufferOffset);
    // Serialize message field [grasp_score]
    bufferOffset = _serializer.float64(obj.grasp_score, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Grasp
    let len;
    let data = new Grasp(null);
    // Deserialize message field [object_id]
    data.object_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [grasp_pose]
    data.grasp_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [grasp_width]
    data.grasp_width = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [grasp_depth]
    data.grasp_depth = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [grasp_score]
    data.grasp_score = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.object_id);
    return length + 84;
  }

  static datatype() {
    // Returns string type for a message object
    return 'grasp_detection/Grasp';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '93b875bae0cc2881618b2d917c5f5523';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message defines the grasp detection results from the models 
    # TODO: consider all other possible information that can be useful for manipulation
    
    string object_id 
    
    # The grasp pose 
    geometry_msgs/Pose grasp_pose
    
    # The grasp width
    float64 grasp_width 
    
    # The grasp depth 
    float64 grasp_depth
    
    # The score of the grasp, which is the probability of the grasp being successful
    float64 grasp_score
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Grasp(null);
    if (msg.object_id !== undefined) {
      resolved.object_id = msg.object_id;
    }
    else {
      resolved.object_id = ''
    }

    if (msg.grasp_pose !== undefined) {
      resolved.grasp_pose = geometry_msgs.msg.Pose.Resolve(msg.grasp_pose)
    }
    else {
      resolved.grasp_pose = new geometry_msgs.msg.Pose()
    }

    if (msg.grasp_width !== undefined) {
      resolved.grasp_width = msg.grasp_width;
    }
    else {
      resolved.grasp_width = 0.0
    }

    if (msg.grasp_depth !== undefined) {
      resolved.grasp_depth = msg.grasp_depth;
    }
    else {
      resolved.grasp_depth = 0.0
    }

    if (msg.grasp_score !== undefined) {
      resolved.grasp_score = msg.grasp_score;
    }
    else {
      resolved.grasp_score = 0.0
    }

    return resolved;
    }
};

module.exports = Grasp;
