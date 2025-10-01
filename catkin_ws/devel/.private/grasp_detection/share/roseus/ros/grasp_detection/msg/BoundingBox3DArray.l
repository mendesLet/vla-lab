;; Auto-generated. Do not edit!


(when (boundp 'grasp_detection::BoundingBox3DArray)
  (if (not (find-package "GRASP_DETECTION"))
    (make-package "GRASP_DETECTION"))
  (shadow 'BoundingBox3DArray (find-package "GRASP_DETECTION")))
(unless (find-package "GRASP_DETECTION::BOUNDINGBOX3DARRAY")
  (make-package "GRASP_DETECTION::BOUNDINGBOX3DARRAY"))

(in-package "ROS")
;;//! \htmlinclude BoundingBox3DArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass grasp_detection::BoundingBox3DArray
  :super ros::object
  :slots (_header _bboxes_3d ))

(defmethod grasp_detection::BoundingBox3DArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:bboxes_3d __bboxes_3d) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _bboxes_3d __bboxes_3d)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
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
    ;; grasp_detection/BoundingBox3D[] _bboxes_3d
    (apply #'+ (send-all _bboxes_3d :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
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

(setf (get grasp_detection::BoundingBox3DArray :md5sum-) "972964bfa630ec8002b6b6713451b7e5")
(setf (get grasp_detection::BoundingBox3DArray :datatype-) "grasp_detection/BoundingBox3DArray")
(setf (get grasp_detection::BoundingBox3DArray :definition-)
      "# This message contains array of BoundingBox3D messages 

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
")



(provide :grasp_detection/BoundingBox3DArray "972964bfa630ec8002b6b6713451b7e5")


