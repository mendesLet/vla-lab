;; Auto-generated. Do not edit!


(when (boundp 'grasp_detection::Perception)
  (if (not (find-package "GRASP_DETECTION"))
    (make-package "GRASP_DETECTION"))
  (shadow 'Perception (find-package "GRASP_DETECTION")))
(unless (find-package "GRASP_DETECTION::PERCEPTION")
  (make-package "GRASP_DETECTION::PERCEPTION"))

(in-package "ROS")
;;//! \htmlinclude Perception.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass grasp_detection::Perception
  :super ros::object
  :slots (_header _cameras_data _bboxes_3d ))

(defmethod grasp_detection::Perception
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:cameras_data __cameras_data) ())
    ((:bboxes_3d __bboxes_3d) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _cameras_data __cameras_data)
   (setq _bboxes_3d __bboxes_3d)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:cameras_data
   (&rest __cameras_data)
   (if (keywordp (car __cameras_data))
       (send* _cameras_data __cameras_data)
     (progn
       (if __cameras_data (setq _cameras_data (car __cameras_data)))
       _cameras_data)))
  (:bboxes_3d
   (&rest __bboxes_3d)
   (if (keywordp (car __bboxes_3d))
       (send* _bboxes_3d __bboxes_3d)
     (progn
       (if __bboxes_3d (setq _bboxes_3d (car __bboxes_3d)))
       _bboxes_3d)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; grasp_detection/PerceptionSingleCamera[] _cameras_data
    (apply #'+ (send-all _cameras_data :serialization-length)) 4
    ;; grasp_detection/BoundingBox3D[] _bboxes_3d
    (apply #'+ (send-all _bboxes_3d :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; grasp_detection/PerceptionSingleCamera[] _cameras_data
     (write-long (length _cameras_data) s)
     (dolist (elem _cameras_data)
       (send elem :serialize s)
       )
     ;; grasp_detection/BoundingBox3D[] _bboxes_3d
     (write-long (length _bboxes_3d) s)
     (dolist (elem _bboxes_3d)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; grasp_detection/PerceptionSingleCamera[] _cameras_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _cameras_data (let (r) (dotimes (i n) (push (instance grasp_detection::PerceptionSingleCamera :init) r)) r))
     (dolist (elem- _cameras_data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; grasp_detection/BoundingBox3D[] _bboxes_3d
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bboxes_3d (let (r) (dotimes (i n) (push (instance grasp_detection::BoundingBox3D :init) r)) r))
     (dolist (elem- _bboxes_3d)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get grasp_detection::Perception :md5sum-) "7f155fccc8dd22fa4fd237c07ac106c4")
(setf (get grasp_detection::Perception :datatype-) "grasp_detection/Perception")
(setf (get grasp_detection::Perception :definition-)
      "# This message defines the data of the raw data and perception results of multiple cameras.

std_msgs/Header header

# The data of each camera.
PerceptionSingleCamera[] cameras_data

# Pre-fusioned 3D bounding boxes if any
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
MSG: grasp_detection/PerceptionSingleCamera
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
MSG: sensor_msgs/CameraInfo
# This message defines meta information for a camera. It should be in a
# camera namespace on topic \"camera_info\" and accompanied by up to five
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
# self-calibrating systems may \"recalibrate\" frequently.              #
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
# sensor_msgs/distortion_models.h. For most cameras, \"plumb_bob\" - a
# simple model of radial and tangential distortion - is sufficient.
string distortion_model

# The distortion parameters, size depending on the distortion model.
# For \"plumb_bob\", the 5 parameters are: (k1, k2, t1, t2, k3).
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
#  neighborhoods of pixels into larger \"super-pixels.\" It reduces the
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

# True if a distinct rectified ROI should be calculated from the \"raw\"
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
")



(provide :grasp_detection/Perception "7f155fccc8dd22fa4fd237c07ac106c4")


