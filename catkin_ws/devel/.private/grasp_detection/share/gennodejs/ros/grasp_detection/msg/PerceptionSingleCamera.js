// Auto-generated. Do not edit!

// (in-package grasp_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BoundingBox2D = require('./BoundingBox2D.js');
let geometry_msgs = _finder('geometry_msgs');
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class PerceptionSingleCamera {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.camera_id = null;
      this.rgb_image = null;
      this.rgb_camera_info = null;
      this.rgb_camera_pose = null;
      this.depth_image = null;
      this.depth_camera_info = null;
      this.depth_camera_pose = null;
      this.detections = null;
    }
    else {
      if (initObj.hasOwnProperty('camera_id')) {
        this.camera_id = initObj.camera_id
      }
      else {
        this.camera_id = '';
      }
      if (initObj.hasOwnProperty('rgb_image')) {
        this.rgb_image = initObj.rgb_image
      }
      else {
        this.rgb_image = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('rgb_camera_info')) {
        this.rgb_camera_info = initObj.rgb_camera_info
      }
      else {
        this.rgb_camera_info = new sensor_msgs.msg.CameraInfo();
      }
      if (initObj.hasOwnProperty('rgb_camera_pose')) {
        this.rgb_camera_pose = initObj.rgb_camera_pose
      }
      else {
        this.rgb_camera_pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('depth_image')) {
        this.depth_image = initObj.depth_image
      }
      else {
        this.depth_image = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('depth_camera_info')) {
        this.depth_camera_info = initObj.depth_camera_info
      }
      else {
        this.depth_camera_info = new sensor_msgs.msg.CameraInfo();
      }
      if (initObj.hasOwnProperty('depth_camera_pose')) {
        this.depth_camera_pose = initObj.depth_camera_pose
      }
      else {
        this.depth_camera_pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('detections')) {
        this.detections = initObj.detections
      }
      else {
        this.detections = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PerceptionSingleCamera
    // Serialize message field [camera_id]
    bufferOffset = _serializer.string(obj.camera_id, buffer, bufferOffset);
    // Serialize message field [rgb_image]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.rgb_image, buffer, bufferOffset);
    // Serialize message field [rgb_camera_info]
    bufferOffset = sensor_msgs.msg.CameraInfo.serialize(obj.rgb_camera_info, buffer, bufferOffset);
    // Serialize message field [rgb_camera_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.rgb_camera_pose, buffer, bufferOffset);
    // Serialize message field [depth_image]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.depth_image, buffer, bufferOffset);
    // Serialize message field [depth_camera_info]
    bufferOffset = sensor_msgs.msg.CameraInfo.serialize(obj.depth_camera_info, buffer, bufferOffset);
    // Serialize message field [depth_camera_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.depth_camera_pose, buffer, bufferOffset);
    // Serialize message field [detections]
    // Serialize the length for message field [detections]
    bufferOffset = _serializer.uint32(obj.detections.length, buffer, bufferOffset);
    obj.detections.forEach((val) => {
      bufferOffset = BoundingBox2D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PerceptionSingleCamera
    let len;
    let data = new PerceptionSingleCamera(null);
    // Deserialize message field [camera_id]
    data.camera_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [rgb_image]
    data.rgb_image = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [rgb_camera_info]
    data.rgb_camera_info = sensor_msgs.msg.CameraInfo.deserialize(buffer, bufferOffset);
    // Deserialize message field [rgb_camera_pose]
    data.rgb_camera_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [depth_image]
    data.depth_image = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [depth_camera_info]
    data.depth_camera_info = sensor_msgs.msg.CameraInfo.deserialize(buffer, bufferOffset);
    // Deserialize message field [depth_camera_pose]
    data.depth_camera_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [detections]
    // Deserialize array length for message field [detections]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.detections = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.detections[i] = BoundingBox2D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.camera_id);
    length += sensor_msgs.msg.Image.getMessageSize(object.rgb_image);
    length += sensor_msgs.msg.CameraInfo.getMessageSize(object.rgb_camera_info);
    length += sensor_msgs.msg.Image.getMessageSize(object.depth_image);
    length += sensor_msgs.msg.CameraInfo.getMessageSize(object.depth_camera_info);
    object.detections.forEach((val) => {
      length += BoundingBox2D.getMessageSize(val);
    });
    return length + 120;
  }

  static datatype() {
    // Returns string type for a message object
    return 'grasp_detection/PerceptionSingleCamera';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '75c3908a8ee6afc0997d1becc3195821';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message defines the data of the raw data and perception results of a single cameras
    
    # camera id 
    string camera_id
    
    # RGB image data
    sensor_msgs/Image rgb_image
    # RGB Camera info
    sensor_msgs/CameraInfo rgb_camera_info
    # RGB Camera pose in the world frame
    geometry_msgs/Pose rgb_camera_pose
    
    # Depth image data
    sensor_msgs/Image depth_image
    # Depth Camera info
    sensor_msgs/CameraInfo depth_camera_info
    # Depth Camera pose 
    geometry_msgs/Pose depth_camera_pose
    
    # 2D bounding boxes of the detected objects
    BoundingBox2D[] detections
    ================================================================================
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
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
    MSG: sensor_msgs/CameraInfo
    # This message defines meta information for a camera. It should be in a
    # camera namespace on topic "camera_info" and accompanied by up to five
    # image topics named:
    #
    #   image_raw - raw data from the camera driver, possibly Bayer encoded
    #   image            - monochrome, distorted
    #   image_color      - color, distorted
    #   image_rect       - monochrome, rectified
    #   image_rect_color - color, rectified
    #
    # The image_pipeline contains packages (image_proc, stereo_image_proc)
    # for producing the four processed image topics from image_raw and
    # camera_info. The meaning of the camera parameters are described in
    # detail at http://www.ros.org/wiki/image_pipeline/CameraInfo.
    #
    # The image_geometry package provides a user-friendly interface to
    # common operations using this meta information. If you want to, e.g.,
    # project a 3d point into image coordinates, we strongly recommend
    # using image_geometry.
    #
    # If the camera is uncalibrated, the matrices D, K, R, P should be left
    # zeroed out. In particular, clients may assume that K[0] == 0.0
    # indicates an uncalibrated camera.
    
    #######################################################################
    #                     Image acquisition info                          #
    #######################################################################
    
    # Time of image acquisition, camera coordinate frame ID
    Header header    # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into the plane of the image
    
    
    #######################################################################
    #                      Calibration Parameters                         #
    #######################################################################
    # These are fixed during camera calibration. Their values will be the #
    # same in all messages until the camera is recalibrated. Note that    #
    # self-calibrating systems may "recalibrate" frequently.              #
    #                                                                     #
    # The internal parameters can be used to warp a raw (distorted) image #
    # to:                                                                 #
    #   1. An undistorted image (requires D and K)                        #
    #   2. A rectified image (requires D, K, R)                           #
    # The projection matrix P projects 3D points into the rectified image.#
    #######################################################################
    
    # The image dimensions with which the camera was calibrated. Normally
    # this will be the full camera resolution in pixels.
    uint32 height
    uint32 width
    
    # The distortion model used. Supported models are listed in
    # sensor_msgs/distortion_models.h. For most cameras, "plumb_bob" - a
    # simple model of radial and tangential distortion - is sufficient.
    string distortion_model
    
    # The distortion parameters, size depending on the distortion model.
    # For "plumb_bob", the 5 parameters are: (k1, k2, t1, t2, k3).
    float64[] D
    
    # Intrinsic camera matrix for the raw (distorted) images.
    #     [fx  0 cx]
    # K = [ 0 fy cy]
    #     [ 0  0  1]
    # Projects 3D points in the camera coordinate frame to 2D pixel
    # coordinates using the focal lengths (fx, fy) and principal point
    # (cx, cy).
    float64[9]  K # 3x3 row-major matrix
    
    # Rectification matrix (stereo cameras only)
    # A rotation matrix aligning the camera coordinate system to the ideal
    # stereo image plane so that epipolar lines in both stereo images are
    # parallel.
    float64[9]  R # 3x3 row-major matrix
    
    # Projection/camera matrix
    #     [fx'  0  cx' Tx]
    # P = [ 0  fy' cy' Ty]
    #     [ 0   0   1   0]
    # By convention, this matrix specifies the intrinsic (camera) matrix
    #  of the processed (rectified) image. That is, the left 3x3 portion
    #  is the normal camera intrinsic matrix for the rectified image.
    # It projects 3D points in the camera coordinate frame to 2D pixel
    #  coordinates using the focal lengths (fx', fy') and principal point
    #  (cx', cy') - these may differ from the values in K.
    # For monocular cameras, Tx = Ty = 0. Normally, monocular cameras will
    #  also have R = the identity and P[1:3,1:3] = K.
    # For a stereo pair, the fourth column [Tx Ty 0]' is related to the
    #  position of the optical center of the second camera in the first
    #  camera's frame. We assume Tz = 0 so both cameras are in the same
    #  stereo image plane. The first camera always has Tx = Ty = 0. For
    #  the right (second) camera of a horizontal stereo pair, Ty = 0 and
    #  Tx = -fx' * B, where B is the baseline between the cameras.
    # Given a 3D point [X Y Z]', the projection (x, y) of the point onto
    #  the rectified image is given by:
    #  [u v w]' = P * [X Y Z 1]'
    #         x = u / w
    #         y = v / w
    #  This holds for both images of a stereo pair.
    float64[12] P # 3x4 row-major matrix
    
    
    #######################################################################
    #                      Operational Parameters                         #
    #######################################################################
    # These define the image region actually captured by the camera       #
    # driver. Although they affect the geometry of the output image, they #
    # may be changed freely without recalibrating the camera.             #
    #######################################################################
    
    # Binning refers here to any camera setting which combines rectangular
    #  neighborhoods of pixels into larger "super-pixels." It reduces the
    #  resolution of the output image to
    #  (width / binning_x) x (height / binning_y).
    # The default values binning_x = binning_y = 0 is considered the same
    #  as binning_x = binning_y = 1 (no subsampling).
    uint32 binning_x
    uint32 binning_y
    
    # Region of interest (subwindow of full camera resolution), given in
    #  full resolution (unbinned) image coordinates. A particular ROI
    #  always denotes the same window of pixels on the camera sensor,
    #  regardless of binning settings.
    # The default setting of roi (all values 0) is considered the same as
    #  full resolution (roi.width = width, roi.height = height).
    RegionOfInterest roi
    
    ================================================================================
    MSG: sensor_msgs/RegionOfInterest
    # This message is used to specify a region of interest within an image.
    #
    # When used to specify the ROI setting of the camera when the image was
    # taken, the height and width fields should either match the height and
    # width fields for the associated image; or height = width = 0
    # indicates that the full resolution image was captured.
    
    uint32 x_offset  # Leftmost pixel of the ROI
                     # (0 if the ROI includes the left edge of the image)
    uint32 y_offset  # Topmost pixel of the ROI
                     # (0 if the ROI includes the top edge of the image)
    uint32 height    # Height of ROI
    uint32 width     # Width of ROI
    
    # True if a distinct rectified ROI should be calculated from the "raw"
    # ROI in this message. Typically this should be False if the full image
    # is captured (ROI not used), and True if a subwindow is captured (ROI
    # used).
    bool do_rectify
    
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
    MSG: grasp_detection/BoundingBox2D
    # The message defines the 2D bounding box of a certain object in the image.
    
    # ID or label of the detected object
    string object_id
    
    # 2D coordinatses of the bounding box in the image plane
    int32 x_min
    int32 y_min
    int32 x_max
    int32 y_max
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PerceptionSingleCamera(null);
    if (msg.camera_id !== undefined) {
      resolved.camera_id = msg.camera_id;
    }
    else {
      resolved.camera_id = ''
    }

    if (msg.rgb_image !== undefined) {
      resolved.rgb_image = sensor_msgs.msg.Image.Resolve(msg.rgb_image)
    }
    else {
      resolved.rgb_image = new sensor_msgs.msg.Image()
    }

    if (msg.rgb_camera_info !== undefined) {
      resolved.rgb_camera_info = sensor_msgs.msg.CameraInfo.Resolve(msg.rgb_camera_info)
    }
    else {
      resolved.rgb_camera_info = new sensor_msgs.msg.CameraInfo()
    }

    if (msg.rgb_camera_pose !== undefined) {
      resolved.rgb_camera_pose = geometry_msgs.msg.Pose.Resolve(msg.rgb_camera_pose)
    }
    else {
      resolved.rgb_camera_pose = new geometry_msgs.msg.Pose()
    }

    if (msg.depth_image !== undefined) {
      resolved.depth_image = sensor_msgs.msg.Image.Resolve(msg.depth_image)
    }
    else {
      resolved.depth_image = new sensor_msgs.msg.Image()
    }

    if (msg.depth_camera_info !== undefined) {
      resolved.depth_camera_info = sensor_msgs.msg.CameraInfo.Resolve(msg.depth_camera_info)
    }
    else {
      resolved.depth_camera_info = new sensor_msgs.msg.CameraInfo()
    }

    if (msg.depth_camera_pose !== undefined) {
      resolved.depth_camera_pose = geometry_msgs.msg.Pose.Resolve(msg.depth_camera_pose)
    }
    else {
      resolved.depth_camera_pose = new geometry_msgs.msg.Pose()
    }

    if (msg.detections !== undefined) {
      resolved.detections = new Array(msg.detections.length);
      for (let i = 0; i < resolved.detections.length; ++i) {
        resolved.detections[i] = BoundingBox2D.Resolve(msg.detections[i]);
      }
    }
    else {
      resolved.detections = []
    }

    return resolved;
    }
};

module.exports = PerceptionSingleCamera;
