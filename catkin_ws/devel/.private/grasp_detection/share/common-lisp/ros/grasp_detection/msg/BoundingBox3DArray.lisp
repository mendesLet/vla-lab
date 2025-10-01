; Auto-generated. Do not edit!


(cl:in-package grasp_detection-msg)


;//! \htmlinclude BoundingBox3DArray.msg.html

(cl:defclass <BoundingBox3DArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (bboxes_3d
    :reader bboxes_3d
    :initarg :bboxes_3d
    :type (cl:vector grasp_detection-msg:BoundingBox3D)
   :initform (cl:make-array 0 :element-type 'grasp_detection-msg:BoundingBox3D :initial-element (cl:make-instance 'grasp_detection-msg:BoundingBox3D))))
)

(cl:defclass BoundingBox3DArray (<BoundingBox3DArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoundingBox3DArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoundingBox3DArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_detection-msg:<BoundingBox3DArray> is deprecated: use grasp_detection-msg:BoundingBox3DArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BoundingBox3DArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_detection-msg:header-val is deprecated.  Use grasp_detection-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'bboxes_3d-val :lambda-list '(m))
(cl:defmethod bboxes_3d-val ((m <BoundingBox3DArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_detection-msg:bboxes_3d-val is deprecated.  Use grasp_detection-msg:bboxes_3d instead.")
  (bboxes_3d m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoundingBox3DArray>) ostream)
  "Serializes a message object of type '<BoundingBox3DArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'bboxes_3d))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'bboxes_3d))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoundingBox3DArray>) istream)
  "Deserializes a message object of type '<BoundingBox3DArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'bboxes_3d) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'bboxes_3d)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'grasp_detection-msg:BoundingBox3D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BoundingBox3DArray>)))
  "Returns string type for a message object of type '<BoundingBox3DArray>"
  "grasp_detection/BoundingBox3DArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BoundingBox3DArray)))
  "Returns string type for a message object of type 'BoundingBox3DArray"
  "grasp_detection/BoundingBox3DArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BoundingBox3DArray>)))
  "Returns md5sum for a message object of type '<BoundingBox3DArray>"
  "972964bfa630ec8002b6b6713451b7e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoundingBox3DArray)))
  "Returns md5sum for a message object of type 'BoundingBox3DArray"
  "972964bfa630ec8002b6b6713451b7e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoundingBox3DArray>)))
  "Returns full string definition for message of type '<BoundingBox3DArray>"
  (cl:format cl:nil "# This message contains array of BoundingBox3D messages ~%~%std_msgs/Header header~%~%BoundingBox3D[] bboxes_3d~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: grasp_detection/BoundingBox3D~%# A 3D bounding box that can be positioned and rotated about its center (6 DOF)~%# Dimensions of this box are in meters~%~%# ID or label of the detected object~%string object_id~%~%# The 3D position and orientation of the bounding box center~%geometry_msgs/Pose center~%~%# The size of the bounding box, in meters, surrounding the object's center~%geometry_msgs/Vector3 size~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoundingBox3DArray)))
  "Returns full string definition for message of type 'BoundingBox3DArray"
  (cl:format cl:nil "# This message contains array of BoundingBox3D messages ~%~%std_msgs/Header header~%~%BoundingBox3D[] bboxes_3d~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: grasp_detection/BoundingBox3D~%# A 3D bounding box that can be positioned and rotated about its center (6 DOF)~%# Dimensions of this box are in meters~%~%# ID or label of the detected object~%string object_id~%~%# The 3D position and orientation of the bounding box center~%geometry_msgs/Pose center~%~%# The size of the bounding box, in meters, surrounding the object's center~%geometry_msgs/Vector3 size~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoundingBox3DArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'bboxes_3d) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoundingBox3DArray>))
  "Converts a ROS message object to a list"
  (cl:list 'BoundingBox3DArray
    (cl:cons ':header (header msg))
    (cl:cons ':bboxes_3d (bboxes_3d msg))
))
