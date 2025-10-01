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

class BoundingBox3D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.object_id = null;
      this.center = null;
      this.size = null;
    }
    else {
      if (initObj.hasOwnProperty('object_id')) {
        this.object_id = initObj.object_id
      }
      else {
        this.object_id = '';
      }
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('size')) {
        this.size = initObj.size
      }
      else {
        this.size = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BoundingBox3D
    // Serialize message field [object_id]
    bufferOffset = _serializer.string(obj.object_id, buffer, bufferOffset);
    // Serialize message field [center]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.center, buffer, bufferOffset);
    // Serialize message field [size]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.size, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BoundingBox3D
    let len;
    let data = new BoundingBox3D(null);
    // Deserialize message field [object_id]
    data.object_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [center]
    data.center = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [size]
    data.size = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.object_id);
    return length + 84;
  }

  static datatype() {
    // Returns string type for a message object
    return 'grasp_detection/BoundingBox3D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '268b39b5abde96a8d0270813498c1aa3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new BoundingBox3D(null);
    if (msg.object_id !== undefined) {
      resolved.object_id = msg.object_id;
    }
    else {
      resolved.object_id = ''
    }

    if (msg.center !== undefined) {
      resolved.center = geometry_msgs.msg.Pose.Resolve(msg.center)
    }
    else {
      resolved.center = new geometry_msgs.msg.Pose()
    }

    if (msg.size !== undefined) {
      resolved.size = geometry_msgs.msg.Vector3.Resolve(msg.size)
    }
    else {
      resolved.size = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = BoundingBox3D;
