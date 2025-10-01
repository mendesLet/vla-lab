; Auto-generated. Do not edit!


(cl:in-package gazebo_plugins_local-srv)


;//! \htmlinclude GazeboGetBoundingBoxes-request.msg.html

(cl:defclass <GazeboGetBoundingBoxes-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GazeboGetBoundingBoxes-request (<GazeboGetBoundingBoxes-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GazeboGetBoundingBoxes-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GazeboGetBoundingBoxes-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_plugins_local-srv:<GazeboGetBoundingBoxes-request> is deprecated: use gazebo_plugins_local-srv:GazeboGetBoundingBoxes-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GazeboGetBoundingBoxes-request>) ostream)
  "Serializes a message object of type '<GazeboGetBoundingBoxes-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GazeboGetBoundingBoxes-request>) istream)
  "Deserializes a message object of type '<GazeboGetBoundingBoxes-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GazeboGetBoundingBoxes-request>)))
  "Returns string type for a service object of type '<GazeboGetBoundingBoxes-request>"
  "gazebo_plugins_local/GazeboGetBoundingBoxesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GazeboGetBoundingBoxes-request)))
  "Returns string type for a service object of type 'GazeboGetBoundingBoxes-request"
  "gazebo_plugins_local/GazeboGetBoundingBoxesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GazeboGetBoundingBoxes-request>)))
  "Returns md5sum for a message object of type '<GazeboGetBoundingBoxes-request>"
  "4a5148ef6b2e02f98aaa72ae4f26020a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GazeboGetBoundingBoxes-request)))
  "Returns md5sum for a message object of type 'GazeboGetBoundingBoxes-request"
  "4a5148ef6b2e02f98aaa72ae4f26020a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GazeboGetBoundingBoxes-request>)))
  "Returns full string definition for message of type '<GazeboGetBoundingBoxes-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GazeboGetBoundingBoxes-request)))
  "Returns full string definition for message of type 'GazeboGetBoundingBoxes-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GazeboGetBoundingBoxes-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GazeboGetBoundingBoxes-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GazeboGetBoundingBoxes-request
))
;//! \htmlinclude GazeboGetBoundingBoxes-response.msg.html

(cl:defclass <GazeboGetBoundingBoxes-response> (roslisp-msg-protocol:ros-message)
  ((bboxes_3d
    :reader bboxes_3d
    :initarg :bboxes_3d
    :type (cl:vector grasp_detection-msg:BoundingBox3D)
   :initform (cl:make-array 0 :element-type 'grasp_detection-msg:BoundingBox3D :initial-element (cl:make-instance 'grasp_detection-msg:BoundingBox3D))))
)

(cl:defclass GazeboGetBoundingBoxes-response (<GazeboGetBoundingBoxes-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GazeboGetBoundingBoxes-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GazeboGetBoundingBoxes-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_plugins_local-srv:<GazeboGetBoundingBoxes-response> is deprecated: use gazebo_plugins_local-srv:GazeboGetBoundingBoxes-response instead.")))

(cl:ensure-generic-function 'bboxes_3d-val :lambda-list '(m))
(cl:defmethod bboxes_3d-val ((m <GazeboGetBoundingBoxes-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_plugins_local-srv:bboxes_3d-val is deprecated.  Use gazebo_plugins_local-srv:bboxes_3d instead.")
  (bboxes_3d m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GazeboGetBoundingBoxes-response>) ostream)
  "Serializes a message object of type '<GazeboGetBoundingBoxes-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'bboxes_3d))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'bboxes_3d))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GazeboGetBoundingBoxes-response>) istream)
  "Deserializes a message object of type '<GazeboGetBoundingBoxes-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GazeboGetBoundingBoxes-response>)))
  "Returns string type for a service object of type '<GazeboGetBoundingBoxes-response>"
  "gazebo_plugins_local/GazeboGetBoundingBoxesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GazeboGetBoundingBoxes-response)))
  "Returns string type for a service object of type 'GazeboGetBoundingBoxes-response"
  "gazebo_plugins_local/GazeboGetBoundingBoxesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GazeboGetBoundingBoxes-response>)))
  "Returns md5sum for a message object of type '<GazeboGetBoundingBoxes-response>"
  "4a5148ef6b2e02f98aaa72ae4f26020a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GazeboGetBoundingBoxes-response)))
  "Returns md5sum for a message object of type 'GazeboGetBoundingBoxes-response"
  "4a5148ef6b2e02f98aaa72ae4f26020a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GazeboGetBoundingBoxes-response>)))
  "Returns full string definition for message of type '<GazeboGetBoundingBoxes-response>"
  (cl:format cl:nil "grasp_detection/BoundingBox3D[] bboxes_3d~%~%~%================================================================================~%MSG: grasp_detection/BoundingBox3D~%# A 3D bounding box that can be positioned and rotated about its center (6 DOF)~%# Dimensions of this box are in meters~%~%# ID or label of the detected object~%string object_id~%~%# The 3D position and orientation of the bounding box center~%geometry_msgs/Pose center~%~%# The size of the bounding box, in meters, surrounding the object's center~%geometry_msgs/Vector3 size~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GazeboGetBoundingBoxes-response)))
  "Returns full string definition for message of type 'GazeboGetBoundingBoxes-response"
  (cl:format cl:nil "grasp_detection/BoundingBox3D[] bboxes_3d~%~%~%================================================================================~%MSG: grasp_detection/BoundingBox3D~%# A 3D bounding box that can be positioned and rotated about its center (6 DOF)~%# Dimensions of this box are in meters~%~%# ID or label of the detected object~%string object_id~%~%# The 3D position and orientation of the bounding box center~%geometry_msgs/Pose center~%~%# The size of the bounding box, in meters, surrounding the object's center~%geometry_msgs/Vector3 size~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GazeboGetBoundingBoxes-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'bboxes_3d) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GazeboGetBoundingBoxes-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GazeboGetBoundingBoxes-response
    (cl:cons ':bboxes_3d (bboxes_3d msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GazeboGetBoundingBoxes)))
  'GazeboGetBoundingBoxes-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GazeboGetBoundingBoxes)))
  'GazeboGetBoundingBoxes-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GazeboGetBoundingBoxes)))
  "Returns string type for a service object of type '<GazeboGetBoundingBoxes>"
  "gazebo_plugins_local/GazeboGetBoundingBoxes")