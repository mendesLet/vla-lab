; Auto-generated. Do not edit!


(cl:in-package grasp_detection-msg)


;//! \htmlinclude BoundingBox3D.msg.html

(cl:defclass <BoundingBox3D> (roslisp-msg-protocol:ros-message)
  ((object_id
    :reader object_id
    :initarg :object_id
    :type cl:string
    :initform "")
   (center
    :reader center
    :initarg :center
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (size
    :reader size
    :initarg :size
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass BoundingBox3D (<BoundingBox3D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoundingBox3D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoundingBox3D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_detection-msg:<BoundingBox3D> is deprecated: use grasp_detection-msg:BoundingBox3D instead.")))

(cl:ensure-generic-function 'object_id-val :lambda-list '(m))
(cl:defmethod object_id-val ((m <BoundingBox3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_detection-msg:object_id-val is deprecated.  Use grasp_detection-msg:object_id instead.")
  (object_id m))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <BoundingBox3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_detection-msg:center-val is deprecated.  Use grasp_detection-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <BoundingBox3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_detection-msg:size-val is deprecated.  Use grasp_detection-msg:size instead.")
  (size m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoundingBox3D>) ostream)
  "Serializes a message object of type '<BoundingBox3D>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'object_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'object_id))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'size) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoundingBox3D>) istream)
  "Deserializes a message object of type '<BoundingBox3D>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'object_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'size) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BoundingBox3D>)))
  "Returns string type for a message object of type '<BoundingBox3D>"
  "grasp_detection/BoundingBox3D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BoundingBox3D)))
  "Returns string type for a message object of type 'BoundingBox3D"
  "grasp_detection/BoundingBox3D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BoundingBox3D>)))
  "Returns md5sum for a message object of type '<BoundingBox3D>"
  "268b39b5abde96a8d0270813498c1aa3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoundingBox3D)))
  "Returns md5sum for a message object of type 'BoundingBox3D"
  "268b39b5abde96a8d0270813498c1aa3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoundingBox3D>)))
  "Returns full string definition for message of type '<BoundingBox3D>"
  (cl:format cl:nil "# A 3D bounding box that can be positioned and rotated about its center (6 DOF)~%# Dimensions of this box are in meters~%~%# ID or label of the detected object~%string object_id~%~%# The 3D position and orientation of the bounding box center~%geometry_msgs/Pose center~%~%# The size of the bounding box, in meters, surrounding the object's center~%geometry_msgs/Vector3 size~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoundingBox3D)))
  "Returns full string definition for message of type 'BoundingBox3D"
  (cl:format cl:nil "# A 3D bounding box that can be positioned and rotated about its center (6 DOF)~%# Dimensions of this box are in meters~%~%# ID or label of the detected object~%string object_id~%~%# The 3D position and orientation of the bounding box center~%geometry_msgs/Pose center~%~%# The size of the bounding box, in meters, surrounding the object's center~%geometry_msgs/Vector3 size~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoundingBox3D>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'object_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'size))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoundingBox3D>))
  "Converts a ROS message object to a list"
  (cl:list 'BoundingBox3D
    (cl:cons ':object_id (object_id msg))
    (cl:cons ':center (center msg))
    (cl:cons ':size (size msg))
))
