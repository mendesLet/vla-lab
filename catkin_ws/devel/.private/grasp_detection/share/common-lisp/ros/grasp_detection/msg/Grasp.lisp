; Auto-generated. Do not edit!


(cl:in-package grasp_detection-msg)


;//! \htmlinclude Grasp.msg.html

(cl:defclass <Grasp> (roslisp-msg-protocol:ros-message)
  ((object_id
    :reader object_id
    :initarg :object_id
    :type cl:string
    :initform "")
   (grasp_pose
    :reader grasp_pose
    :initarg :grasp_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (grasp_width
    :reader grasp_width
    :initarg :grasp_width
    :type cl:float
    :initform 0.0)
   (grasp_depth
    :reader grasp_depth
    :initarg :grasp_depth
    :type cl:float
    :initform 0.0)
   (grasp_score
    :reader grasp_score
    :initarg :grasp_score
    :type cl:float
    :initform 0.0))
)

(cl:defclass Grasp (<Grasp>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Grasp>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Grasp)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_detection-msg:<Grasp> is deprecated: use grasp_detection-msg:Grasp instead.")))

(cl:ensure-generic-function 'object_id-val :lambda-list '(m))
(cl:defmethod object_id-val ((m <Grasp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_detection-msg:object_id-val is deprecated.  Use grasp_detection-msg:object_id instead.")
  (object_id m))

(cl:ensure-generic-function 'grasp_pose-val :lambda-list '(m))
(cl:defmethod grasp_pose-val ((m <Grasp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_detection-msg:grasp_pose-val is deprecated.  Use grasp_detection-msg:grasp_pose instead.")
  (grasp_pose m))

(cl:ensure-generic-function 'grasp_width-val :lambda-list '(m))
(cl:defmethod grasp_width-val ((m <Grasp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_detection-msg:grasp_width-val is deprecated.  Use grasp_detection-msg:grasp_width instead.")
  (grasp_width m))

(cl:ensure-generic-function 'grasp_depth-val :lambda-list '(m))
(cl:defmethod grasp_depth-val ((m <Grasp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_detection-msg:grasp_depth-val is deprecated.  Use grasp_detection-msg:grasp_depth instead.")
  (grasp_depth m))

(cl:ensure-generic-function 'grasp_score-val :lambda-list '(m))
(cl:defmethod grasp_score-val ((m <Grasp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_detection-msg:grasp_score-val is deprecated.  Use grasp_detection-msg:grasp_score instead.")
  (grasp_score m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Grasp>) ostream)
  "Serializes a message object of type '<Grasp>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'object_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'object_id))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'grasp_pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'grasp_width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'grasp_depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'grasp_score))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Grasp>) istream)
  "Deserializes a message object of type '<Grasp>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'object_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'grasp_pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'grasp_width) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'grasp_depth) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'grasp_score) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Grasp>)))
  "Returns string type for a message object of type '<Grasp>"
  "grasp_detection/Grasp")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Grasp)))
  "Returns string type for a message object of type 'Grasp"
  "grasp_detection/Grasp")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Grasp>)))
  "Returns md5sum for a message object of type '<Grasp>"
  "93b875bae0cc2881618b2d917c5f5523")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Grasp)))
  "Returns md5sum for a message object of type 'Grasp"
  "93b875bae0cc2881618b2d917c5f5523")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Grasp>)))
  "Returns full string definition for message of type '<Grasp>"
  (cl:format cl:nil "# This message defines the grasp detection results from the models ~%# TODO: consider all other possible information that can be useful for manipulation~%~%string object_id ~%~%# The grasp pose ~%geometry_msgs/Pose grasp_pose~%~%# The grasp width~%float64 grasp_width ~%~%# The grasp depth ~%float64 grasp_depth~%~%# The score of the grasp, which is the probability of the grasp being successful~%float64 grasp_score~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Grasp)))
  "Returns full string definition for message of type 'Grasp"
  (cl:format cl:nil "# This message defines the grasp detection results from the models ~%# TODO: consider all other possible information that can be useful for manipulation~%~%string object_id ~%~%# The grasp pose ~%geometry_msgs/Pose grasp_pose~%~%# The grasp width~%float64 grasp_width ~%~%# The grasp depth ~%float64 grasp_depth~%~%# The score of the grasp, which is the probability of the grasp being successful~%float64 grasp_score~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Grasp>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'object_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'grasp_pose))
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Grasp>))
  "Converts a ROS message object to a list"
  (cl:list 'Grasp
    (cl:cons ':object_id (object_id msg))
    (cl:cons ':grasp_pose (grasp_pose msg))
    (cl:cons ':grasp_width (grasp_width msg))
    (cl:cons ':grasp_depth (grasp_depth msg))
    (cl:cons ':grasp_score (grasp_score msg))
))
